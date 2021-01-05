FROM alpine:3.12 AS download
ENV CLOUD_BUILD_LOCAL_VERSION=0.5.2\
    GCLOUD_VERSION=319.0.0\
    DOCKER_VERSION=19.03.8
WORKDIR /tmp

RUN mkdir -p base/bin base/lib && \
    apk add --no-cache ca-certificates

RUN wget -O /tmp/base/bin/cloud-build-local https://storage.googleapis.com/local-builder/cloud-build-local_linux_amd64-v${CLOUD_BUILD_LOCAL_VERSION} && \
    chmod +x /tmp/base/bin/cloud-build-local
RUN wget -O google-cloud-sdk.tar.gz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${GCLOUD_VERSION}-linux-x86_64.tar.gz && \
    tar zxvf google-cloud-sdk.tar.gz && \
    cp /tmp/google-cloud-sdk/bin/gcloud /tmp/base/bin && \
    cp /tmp/google-cloud-sdk/bin/docker-credential-gcloud /tmp/base/bin && \
    cp -r /tmp/google-cloud-sdk/lib /tmp/base/
RUN wget -O docker.tgz https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz && \
    tar zxvf docker.tgz && \
    mv docker/* base/bin
FROM python:3.9.1-alpine3.12
ENV GLIBC_VERSION=2.32-r0
RUN apk --no-cache add wget && \
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget -O glibc.apk https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk && \
    apk add glibc.apk && \
    rm glibc.apk && \
    apk del wget
COPY --from=download /tmp/base/ /usr/local/
ENTRYPOINT ["cloud-build-local"]
