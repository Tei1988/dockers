ARG BASE_IMAGE=ruby:2.7.4-alpine3.14
FROM ${BASE_IMAGE}
RUN apk --no-cache add \
        git \
        build-base \
        nodejs \
        tzdata \
        ca-certificates \
        shared-mime-info \
        mariadb-connector-c-dev
