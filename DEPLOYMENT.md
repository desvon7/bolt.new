# Deployment Guide

## Cloudflare Pages Deployment

This project is configured to deploy to Cloudflare Pages with the following specifications:

### Node.js Version
- **Required**: Node.js 20.19.0 or higher
- **Specified in**: `.nvmrc`, `.node-version`, and `package.json` engines

### Package Manager
- **Required**: pnpm 9.4.0 or higher
- **Specified in**: `package.json` packageManager field

### Build Configuration
- **Build Command**: `pnpm run build`
- **Output Directory**: `./build/client`
- **Configuration Files**:
  - `wrangler.toml` - Cloudflare Workers configuration
  - `cloudflare-pages.toml` - Cloudflare Pages specific configuration
  - `vite.config.ts` - Vite build configuration

### Troubleshooting Deployment Issues

#### Node.js Installation Failure
If you encounter "error occurred while installing tools or dependencies" during Node.js installation:

1. **Verify Node.js Version**: Ensure your local Node.js version matches the deployment requirements
2. **Check Package Manager**: Ensure pnpm is installed and up to date
3. **Clear Cache**: Try clearing the build cache in Cloudflare Pages dashboard
4. **Environment Variables**: Check that no conflicting environment variables are set

#### Build Failures
If the build process fails:

1. **Dependencies**: Run `pnpm install` locally to ensure all dependencies resolve correctly
2. **TypeScript**: Run `pnpm run typecheck` to check for TypeScript errors
3. **Linting**: Run `pnpm run lint` to check for code quality issues
4. **Local Build**: Run `pnpm run build` locally to test the build process

#### Deployment Commands
```bash
# Local development
pnpm run dev

# Build locally
pnpm run build

# Deploy to Cloudflare Pages
pnpm run deploy

# Preview production build locally
pnpm run preview
```

### Environment Variables
Required environment variables for deployment:
- `ANTHROPIC_API_KEY` - Anthropic API key for AI functionality

### File Structure
```
├── .nvmrc                    # Node.js version specification
├── .node-version            # Alternative Node.js version file
├── cloudflare-pages.toml    # Cloudflare Pages configuration
├── wrangler.toml            # Cloudflare Workers configuration
├── package.json             # Dependencies and scripts
├── vite.config.ts           # Vite build configuration
└── _build.sh               # Build script
```
