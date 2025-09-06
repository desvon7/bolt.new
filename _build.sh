#!/bin/bash
set -e

echo "Installing dependencies with pnpm..."
pnpm install --frozen-lockfile

echo "Building project..."
pnpm run build

echo "Build completed successfully!"