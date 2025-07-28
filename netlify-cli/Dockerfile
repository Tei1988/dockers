# --- Build Stage ---
ARG NODE_VERSION=20
FROM node:${NODE_VERSION}-alpine AS builder

# Install netlify-cli globally in the builder stage
# Using --no-update-notifier to prevent update checks
# Using --no-fund to suppress funding messages
RUN npm install -g netlify-cli@19.1.5 --no-update-notifier --no-fund

# --- Final Stage ---
FROM node:${NODE_VERSION}-alpine

# Copy the globally installed node_modules and the bin directory from the builder stage
# This ensures all dependencies and executables are included in the final image
COPY --from=builder /usr/local/lib/node_modules /usr/local/lib/node_modules
COPY --from=builder /usr/local/bin /usr/local/bin

# Set the entrypoint to the netlify command
ENTRYPOINT [ "netlify" ]

# Optionally, set a default command (e.g., show help)
# CMD ["--help"]
