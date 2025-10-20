#!/usr/bin/env bash
set -euo pipefail

# Python tooling (mkdocs)
pip3 install --no-cache-dir --upgrade pip
pip3 install --no-cache-dir mkdocs mkdocs-material

# Node tooling
npm install -g markdownlint-cli2 alex http-server

# Vale install
VALE_VER=$(curl -fsSL https://api.github.com/repos/errata-ai/vale/releases/latest | jq -r .tag_name | sed 's/^v//')
curl -fsSL -o /tmp/vale.tgz https://github.com/errata-ai/vale/releases/download/v${VALE_VER}/vale_${VALE_VER}_Linux_64-bit.tar.gz
mkdir -p /tmp/vale && tar -xzf /tmp/vale.tgz -C /tmp/vale
sudo mv /tmp/vale/vale /usr/local/bin/vale || mv /tmp/vale/vale /usr/local/bin/vale

# Pre-commit (optional)
pip3 install pre-commit

# Verify
mkdocs --version || true
node --version || true
vale --version || true
