#!/bin/bash

GEMINI_CLI_VERSION=$1
docker buildx build --platform=linux/arm64,linux/amd64 --build-arg GEMINI_CLI_VERSION=${GEMINI_CLI_VERSION} -t tei1988/gemini-cli:${GEMINI_CLI_VERSION} --push .
