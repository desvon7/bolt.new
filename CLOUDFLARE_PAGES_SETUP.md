# Cloudflare Pages Setup Instructions

## Required Environment Variables

To fix the Node.js installation issue, you **MUST** set the following environment variables in your Cloudflare Pages dashboard:

### Step 1: Access Cloudflare Pages Dashboard
1. Go to [Cloudflare Dashboard](https://dash.cloudflare.com)
2. Navigate to **Workers & Pages** > **Your Project**
3. Click on **Settings** tab
4. Click on **Environment Variables**

### Step 2: Add Required Environment Variables

Add these environment variables for **both Production and Preview**:

| Variable Name | Value | Description |
|---------------|-------|-------------|
| `NODE_VERSION` | `20.19.0` | Specifies Node.js version |
| `PNPM_VERSION` | `9.4.0` | Specifies pnpm version |
| `NODE_OPTIONS` | `--max-old-space-size=4096` | Increases memory limit |

### Step 3: Build Settings

In **Settings** > **Build & Deploy**:

- **Build command**: `pnpm run build`
- **Build output directory**: `./build/client`
- **Root directory**: `/` (leave empty)

### Step 4: Clear Build Cache

1. Go to **Settings** > **Build & Deploy**
2. Scroll down to **Build cache**
3. Click **Clear cache** to remove any cached build artifacts

## Why This Fixes the Issue

The deployment was failing because:
1. Cloudflare Pages defaults to Node.js 12.18.0
2. Our project requires Node.js 20.19.0
3. Without explicit environment variables, Cloudflare Pages tries to install an unsupported version (20.19.5)

## Verification

After setting these environment variables:
1. Trigger a new deployment
2. Check the build logs - you should see:
   - `Installing nodejs 20.19.0` (not 20.19.5)
   - Successful dependency installation
   - Successful build completion

## Project Configuration Files

This project includes multiple Node.js version specification files:
- `.nvmrc` - Node Version Manager
- `.node-version` - Node Version Manager alternative
- `.nodejs-version` - Node.js version specification
- `.tool-versions` - asdf version manager
- `package.json` engines field

All specify Node.js 20.19.0 for consistency.
