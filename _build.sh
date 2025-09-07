#!/bin/bash
set -e

echo "Node.js version: $(node --version)"
echo "pnpm version: $(pnpm --version)"

# Check if Node.js version is compatible
NODE_VERSION=$(node --version | cut -d'v' -f2)
REQUIRED_VERSION="20.19.0"

if [ "$(printf '%s\n' "$REQUIRED_VERSION" "$NODE_VERSION" | sort -V | head -n1)" != "$REQUIRED_VERSION" ]; then
    echo "Error: Node.js version $NODE_VERSION is not compatible. Required: >= $REQUIRED_VERSION"
    exit 1
fi

echo "Installing dependencies with pnpm..."
pnpm install --frozen-lockfile

echo "Building project..."
pnpm run build

echo "Build completed successfully!"