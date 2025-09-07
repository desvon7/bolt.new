# URGENT: Cloudflare Pages Dashboard Setup Required

## 🚨 CRITICAL: You MUST set environment variables in the Cloudflare Pages dashboard

The deployment is failing because Cloudflare Pages is ignoring all version files and trying to install Node.js 20.19.5, which is not supported.

## Step-by-Step Instructions:

### 1. Access Cloudflare Pages Dashboard
1. Go to [Cloudflare Dashboard](https://dash.cloudflare.com)
2. Navigate to **Workers & Pages**
3. Click on your project **"unicornsurfsoftwaredev"**
4. Click on **Settings** tab

### 2. Set Environment Variables
1. Click on **Environment Variables** in the left sidebar
2. Click **Add variable** for each of these:

#### For Production Environment:
| Variable Name | Value | Description |
|---------------|-------|-------------|
| `NODE_VERSION` | `18.17.1` | Forces Node.js version |
| `PNPM_VERSION` | `9.4.0` | Forces pnpm version |
| `NODE_OPTIONS` | `--max-old-space-size=4096` | Memory limit |

#### For Preview Environment:
Repeat the same variables for Preview environment.

### 3. Clear Build Cache
1. Go to **Settings** → **Build & Deploy**
2. Scroll down to **Build cache**
3. Click **Clear cache**

### 4. Trigger New Deployment
1. Go to **Deployments** tab
2. Click **Retry build** on the latest deployment
3. Or push a new commit to trigger automatic deployment

## Expected Result:
After setting these environment variables, you should see in the build logs:
```
Detected the following tools from environment: nodejs@18.17.1, pnpm@9.4.0
Installing nodejs 18.17.1
✓ Success: Dependencies installed
✓ Success: Build completed
```

## Why This is Required:
Cloudflare Pages ignores version files (`.nvmrc`, `.node-version`, etc.) unless you explicitly set the `NODE_VERSION` environment variable in the dashboard. This is a known limitation of Cloudflare Pages.

## Alternative: Use Cloudflare Pages CLI
If the dashboard approach doesn't work, you can also try:
```bash
npx wrangler pages project create unicornsurfsoftwaredev
npx wrangler pages project update unicornsurfsoftwaredev --env NODE_VERSION=18.17.1
```
