# Stage 1: Builder
FROM node:24-alpine AS builder
ARG VIBE_KANBAN_VERSION
WORKDIR /app
RUN apk --no-cache add python3 build-base
RUN npm install vibe-kanban@${VIBE_KANBAN_VERSION}

# Stage 2: Final Image
FROM node:24-alpine
COPY --from=builder /app/node_modules /app/node_modules
COPY --from=builder /app/package.json /app/package.json
COPY --from=builder /app/package-lock.json /app/package-lock.json
RUN apk --no-cache add bash tini
WORKDIR /app
ENTRYPOINT ["tini", "--", "/app/node_modules/.bin/vibe-kanban"]
