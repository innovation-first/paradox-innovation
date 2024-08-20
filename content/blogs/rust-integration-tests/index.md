---
title: 'Integration Testing with Rust, Gitlab, Kubernetes, gRPC, Python, llvm-cov and Sonarqube'
date: 2024-08-11T13:48:14+02:00
summary: 'An article about our approach of extracting test coverage reports from Rust, running on Kubernetes'
categories:
- Blog
tags:
- rust
- devops
authors: 
- Eric Muellenbach
image: 'shared/abstract-white-6.jpg'
---

This page describes the approach we implemented to run the integration tests of the matching subsystem as part of our CI/CD pipeline. It also illustrates how we extract code coverage information from the running applications and how we transfer these results to SonarQube.

The goal of this is to get the best possible overview how far our various test methods (unit test, integration test) cover all available code instructions.

Our CI/CD pipeline runs on Photon, the managed Gitlab Instance hosted by the DIS CCoE.

As part of Photon, the CCoE also provides a managed Kubernetes cluster, named Kirby. Kirby provides a dedicated namespace per project, in which we can deploy any containerized services, either built as part of our CI (the yellow and purple services above) or coming from external services (the blue-ish services, MinIO and RabbitMQ).

All services that are part of our product are delivered as Docker images are deployed through Helm.

All our services are developed in Rust and expose gRPC interfaces. The integration tests we provide are written in Python and test all three interface, the Enrollment Service, the Search Service as well as each Matcher Endpoint.

## CI Pipeline description

Our CI pipeline performs several best practices for Static Source Analysis like external vulnerability scanning and code linting. We use all tools mandated by the SecPlan where applicable (like SonarQube, NexusIQ).

Based on the branch we commit to, we have have different build targets for our Rust applications. In our case, commits to the develop branch as well as to feature branches are built as debug versions. They are not optimized by the compiler. Additionally, we specify the following RUSTFLAGS environment variable for these builds:

```bash
RUSTFLAGS: "-C instrument-coverage"
```

Which basically results in the following Gitlab CI job:

We follow hereby the description found in the official [Rust documentation](https://doc.rust-lang.org/rustc/instrument-coverage.html). This enables the Rust binary to write [LLVM profiling data](https://clang.llvm.org/docs/SourceBasedCodeCoverage.html) once the application terminates to the file system. By default, this is the current working directory, but can be modified through the environment variable *LLVM_PROFILE_FILE* (this comes in handy later).

```yaml
build-binaries:
  image: ${BUILDER_IMAGE_NAME}
  tags:
    - photon_new_runners
  stage: test
  variables:
    RELEASE_FLAG: ""
    TARGET_DIRECTORY: "debug"
    RUSTFLAGS: "-C instrument-coverage"
  rules:
    - if: '$CI_PIPELINE_SOURCE == "merge_request_event"'
      when: never
    - if: '$CI_COMMIT_BRANCH == "main"'
      variables:
        RELEASE_FLAG: "--release"
        TARGET_DIRECTORY: "release"
        RUSTFLAGS: ""
```

## Build modifications

We use the [Thales Trusted Base Images](https://gitlab.thalesdigital.io/ThalesContainerImages/base-images), more notably Redhats Universal Base Image (UBI) in the UBI-micro flavor. This allows us to have the smallest attack surface while maintaining a full glibc.

In order for us to make of the extracted profiling data from the ephemeral container, we need to tweak the Container lifecycle management and find a place where we can store it. For this, two modifications were needed:

### Docker and Helm Chart modifications

Normally, our services are running as PID 1 as we simply launch the binaries of the respective services mentioned above. At the same time, our Rust binaries only write the coverage information to the file system once binary has gracefully terminated (all our services have an internal hook for the SIGTERM signal to finish all pending transactions and close connections properly).

So, we need to find a way to have the Pod inside the Kubernetes running slightly longer than the lifecycle of the respective services, so that the coverage information can be written and exported somewhere.

In our case, We use a Multi-Stage Dockerfile that allows us to build a release and debug image from the same Dockerfile:

```docker
FROM artifactory.thalesdigital.io/docker-internal/base-images/amd64/ubi-micro:9.4.13-2630 as release
...
ENTRYPOINT [ "/bin/bash", "-c" ]

FROM release as debug

COPY debug/mc /opt/app/bin/
COPY debug/debug-start.sh /opt/app/bin/

RUN mc --version

ENTRYPOINT [ "debug-start.sh" ]
```

When we specify no build target, we build a debug docker image. When we specify the docker build target release, we don't execute the last 4 lines of the script.

In both cases, we just provide the binary that we want to start as an argument. Like that, no additional modification is needed in the Helm chart.

The debug-start.sh script contains a trap for the SIGTERM, so that once this signal is sent by Kubernetes to the Pod, we can react accordingly:

```bash
#!/bin/bash

# Function to handle the SIGTERM signal
sigterm_handler() {
    echo "Received SIGTERM in debug handler..."

    # Create MinIO bucket and alias (if minio is running in another 
    # Kubernetes namespace, create an ExternalName service)
    mc alias set minio http://minio:9000 minio password --insecure
    echo "Created alias"
    mc mb minio/test-coverage || true
    echo "Created test bucket"

    # Find the PID of the process
    PID=$(cat /tmp/run.pid)

    # Check if PID is found
    if [ -z "$PID" ]; then
        echo "Process $PID not found."
        return 1
    fi

    # Send SIGTERM to the process
    kill -TERM "$PID"

    # Wait for the process to terminate
    while kill -0 "$PID" 2>/dev/null; do
        sleep 1
    done

    echo "Process PID $PID terminated."

    ls -l /tmp/coverage/
    mc cp -r /tmp/coverage/* minio/test-coverage/
    echo "Copied code coverage report"

    exit
}

# Check if either of the parameters is not set
if [ -z "$1" ]; then
    echo "Error: binary must be provided"
    exit 1
fi

# Trap the SIGTERM signal
trap 'sigterm_handler' SIGTERM

$1 & echo $! > /tmp/run.pid

wait $(cat /tmp/run.pid)
```

In our Helm chart, if the code coverage flag is enabled, we set the aforementioned environment variable:

```yaml
env:
- name: RUST_LOG
  value: {{ .Values.global.logLevel }}
{{- if .Values.global.codeCoverage.enabled }}
- name: LLVM_PROFILE_FILE
  value: "/tmp/coverage/enrollment-server.profraw"
{{- end}} 
```

### Profiling Extraction

Once all integration tests were run, we can start extracting the coverage information back from the test environment to the Gitlab Runner.  This is simply done by the following script:

```bash
kubectl scale deploy -l app.kubernetes.io/instance=matcher --replicas=0
sleep 10
./debug/mc alias set minio http://minio-in-kubernetes.thalescloud.io minio password --insecure
./debug/mc cp -r minio/test-coverage/ .
```

Basically, we scale down all deployments from which want to extract the code coverage. This will trigger the preStop hook, kill the processes, write the coverage information and transfer it to the MinIO instance. After the scale down, we wait 10 seconds to give the processes some time to cool down and write the reports.

## Code Coverage Report, Merge and Upload

From here on, it's more or less easy. We need to install the Rust demanger rustfilt and use the llvm tools to convert the profiling data to the lcov format.
From lcov, we can use a Python script to convert it to cobertura, which is easy to ingest in SonarQube:

```bash
llvm-profdata-14 merge -sparse ./biometric-matcher-filter-0.profraw -o ./biometric-matcher-filter-0.profdata
llvm-cov-14 export -Xdemangler=/builds/ibs/cbcs/server/matcher/.cargo/bin/rustfilt -format lcov target/debug/biometric-matcher -instr-profile=./biometric-matcher-filter-0.profdata -show-instantiation-summary -name=add_quoted_string -ignore-filename-regex='/rustc|.*/.cargo/.+' > biometric-matcher-filter-0.lcov
python3 debug/lcov_cobertura.py biometric-matcher-filter-0.lcov -o integration-coverage-matcher.xml
```

We repeat these steps for each service. Afterwards, we can re-use the Sonar CLI to merge all cobertura reports and have the SonarQube server aggregate the results from the Unit Test and Integration Test Coverage for us:

```bash
/opt/sonar-scanner/bin/sonar-scanner -Dsonar.login=$SONAR_TOKEN -Dsonar.externalIssuesReportPaths=sonar-issues.json -Dsonar.sarifReportPaths=sarif.json -Dsonar.cxx.cobertura.reportPaths=cobertura.xml,integration-coverage-*.xml
```

## Result

This approach helped us to gain coverage information of parts of our application that are otherwise hard to test (like for example the main function).

It also increased confidence in our deliverable, as we now have ~97% of our code base tested before can mark a version as "deliverable". To be fair, our unit test coverage as already at >90%, but experience shows that it's always the last 10% that cause issues.

It also tests features between services (e.g. the notification mechanism of newly enrolled records between the enrollment service and the matcher instances, passing through the message broker), which are otherwise hard to unit test.

Overall, we are very happy with this approach, for increasing the confidence we have in our delivery process.

## Contacts

- <eric.muellenbach@thalesgroup.com>
