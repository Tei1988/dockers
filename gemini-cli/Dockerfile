# Stage 1: Builder
FROM node:24-alpine AS builder
ARG GEMINI_CLI_VERSION
WORKDIR /app
RUN npm install @google/gemini-cli@${GEMINI_CLI_VERSION}

# Stage 2: Final Image
FROM node:24-alpine
COPY --from=builder /app/node_modules /app/node_modules
COPY --from=builder /app/package.json /app/package.json
COPY --from=builder /app/package-lock.json /app/package-lock.json
RUN apk --no-cache add bash
WORKDIR /app
ENTRYPOINT ["/app/node_modules/.bin/gemini"]
