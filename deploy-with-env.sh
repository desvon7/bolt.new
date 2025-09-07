#!/bin/bash
set -e

echo "=== Cloudflare Pages Deployment with Environment Variables ==="

# Set environment variables
export NODE_VERSION=18.17.1
export PNPM_VERSION=9.4.0
export NODE_OPTIONS="--max-old-space-size=4096"

echo "Environment variables set:"
echo "NODE_VERSION=$NODE_VERSION"
echo "PNPM_VERSION=$PNPM_VERSION"
echo "NODE_OPTIONS=$NODE_OPTIONS"

# Build the project
echo "Building project..."
./build.sh

# Deploy to Cloudflare Pages
echo "Deploying to Cloudflare Pages..."
wrangler pages deploy ./build/client --project-name=unicornsurfsoftwaredev

echo "Deployment completed!"
