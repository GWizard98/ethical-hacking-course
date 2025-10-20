# syntax=docker/dockerfile:1
FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Install system deps
RUN apt-get update -y && apt-get install -y \
  python3 python3-pip \
  curl wget jq git \
  nodejs npm \
  && rm -rf /var/lib/apt/lists/*

# Default workdir
WORKDIR /workspaces/ethical-hacking-course
