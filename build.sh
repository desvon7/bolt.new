#!/bin/bash
set -e

# Force Node.js version to 18.17.1
export NODE_VERSION=18.17.1
export PNPM_VERSION=9.4.0

echo "=== Cloudflare Pages Build Script ==="
echo "Setting Node.js version to $NODE_VERSION"
echo "Setting pnpm version to $PNPM_VERSION"

# Check if we're in Cloudflare Pages environment
if [ -n "$CF_PAGES" ]; then
    echo "Running in Cloudflare Pages environment"
    
    # Try to use nvm if available
    if command -v nvm &> /dev/null; then
        echo "Using nvm to set Node.js version"
        nvm install $NODE_VERSION
        nvm use $NODE_VERSION
    else
        echo "nvm not available, checking current Node.js version"
    fi
fi

echo "Current Node.js version: $(node --version)"
echo "Current pnpm version: $(pnpm --version)"

# Check if Node.js version is compatible
NODE_CURRENT=$(node --version | cut -d'v' -f2)
REQUIRED_VERSION="18.17.1"

if [ "$(printf '%s\n' "$REQUIRED_VERSION" "$NODE_CURRENT" | sort -V | head -n1)" != "$REQUIRED_VERSION" ]; then
    echo "WARNING: Node.js version $NODE_CURRENT may not be compatible with required $REQUIRED_VERSION"
    echo "Continuing with build..."
fi

# Install dependencies
echo "Installing dependencies with pnpm..."
pnpm install --frozen-lockfile

# Build the project
echo "Building project..."
pnpm run build

echo "Build completed successfully!"
