FROM alpine:latest

RUN apk add kubectl helm curl python3 openssh-client

ENV PATH="${PATH}:/google-cloud-sdk/bin"

# Google Cloud Platform
RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-475.0.0-linux-x86_64.tar.gz
RUN tar -xf google-cloud-cli-475.0.0-linux-x86_64.tar.gz
RUN ./google-cloud-sdk/install.sh
RUN rm google-cloud-cli-475.0.0-linux-x86_64.tar.gz
RUN gcloud components install gke-gcloud-auth-plugin

# Install Kastctl
ARG ACCESS_TOKEN
RUN curl --fail-with-body --header "PRIVATE-TOKEN: $ACCESS_TOKEN" "https://gitlab.thalesdigital.io/api/v4/projects/45015/packages/generic/kastctl/2.15.3/kastctl" --output /usr/bin/kastctl
RUN chmod +x /usr/bin/kastctl

ENTRYPOINT ["/bin/sh", "-c"]