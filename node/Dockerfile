ARG BASE_IMAGE=node:16.3.0-alpine3.13
ARG NPM_VERSION=7.20.1
FROM ${BASE_IMAGE}
RUN apk --no-cache add \
        git \
        python3 \
        build-base && \
    npm install -g npm@${NPM_VERSION} && \
    npm cache clean --force
