# Use an official Python runtime based on Alpine Linux as a parent image
FROM python:3.12-alpine

# Set environment variables
# Prevents Python from writing pyc files to disc (equivalent to python -B option)
ENV PYTHONDONTWRITEBYTECODE=1 \
# Prevents Python from buffering stdout and stderr (equivalent to python -u option)
    PYTHONUNBUFFERED=1

# Install poetry using pip with --no-cache-dir to reduce image size
# Also install build-base for potential native extensions during poetry install
# and then remove it after poetry installation to keep the image small
RUN apk add --no-cache --virtual .build-deps build-base && \
    pip install --no-cache-dir poetry==2.1.2 && \
    apk del .build-deps

# Set the working directory in the container
WORKDIR /app

# Define default command (optional, shows poetry version)
# You can change this to run your application or specific poetry commands
CMD ["poetry", "--version"]
