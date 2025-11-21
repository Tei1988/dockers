#!/bin/bash

VIBE_KANBAN_VERSION=$1
docker buildx build --platform=linux/arm64,linux/amd64 --build-arg VIBE_KANBAN_VERSION=${VIBE_KANBAN_VERSION} -t tei1988/vibe-kanban:${VIBE_KANBAN_VERSION} --push .
