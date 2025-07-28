#!/bin/bash

GOPLS_VERSION=$1
docker buildx build --platform=linux/arm64 --build-arg GOPLS_VERSION=${GOPLS_VERSION} -t tei1988/gopls:${GOPLS_VERSION} --push .
