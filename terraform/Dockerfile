ARG BASE_IMAGE=alpine:3.14
FROM ${BASE_IMAGE} AS downloader

WORKDIR /tmp

RUN apk add --no-cache unzip
COPY ./downloader.sh /tmp/downloader.sh
RUN ./downloader.sh 1.0.1 /tmp/terraform.zip
RUN unzip /tmp/terraform.zip

FROM ${BASE_IMAGE}

WORKDIR /

COPY --from=downloader /tmp/terraform /terraform
ENTRYPOINT ["/terraform"]
