FROM alpine:latest

RUN apk add kubectl helm curl python3

ENV PATH="${PATH}:/google-cloud-sdk/bin"
# Google Cloud Platform
RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-475.0.0-linux-x86_64.tar.gz
RUN tar -xf google-cloud-cli-475.0.0-linux-x86_64.tar.gz
RUN ./google-cloud-sdk/install.sh
RUN rm google-cloud-cli-475.0.0-linux-x86_64.tar.gz
RUN gcloud components install gke-gcloud-auth-plugin

ENTRYPOINT ["/bin/sh", "-c"]