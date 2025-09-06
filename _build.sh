#!/bin/bash
set -e

echo "Node.js version: $(node --version)"
echo "pnpm version: $(pnpm --version)"

echo "Installing dependencies with pnpm..."
pnpm install --frozen-lockfile --prefer-offline

echo "Building project..."
pnpm run build

echo "Build completed successfully!"