# UnicornSurf.ai Rebranding Guidelines

## Overview
This document outlines the complete rebranding strategy for transforming Bolt.new into UnicornSurf.ai while maintaining all existing functionality and technical architecture.

## Brand Identity

### New Brand Name: UnicornSurf.ai
- **Mission**: Empowering developers to surf the waves of innovation with AI-powered development tools
- **Vision**: Making full-stack development as smooth as riding the perfect wave
- **Personality**: Innovative, reliable, cutting-edge, and user-friendly

### Color Scheme (Suggested)
- **Primary**: Ocean Blue (#0066CC) 
- **Secondary**: Sunset Orange (#FF6B35)
- **Accent**: Unicorn Purple (#8B5CF6)
- **Neutral**: Wave Gray (#6B7280)

### Typography
- **Headings**: Modern sans-serif (Inter or similar)
- **Body**: Clean, readable font family
- **Code**: Monospace (JetBrains Mono or Fira Code)

## Rebranding Strategy

### Phase 1: Core Application Changes

#### 1. Package and Configuration Updates
```json
// package.json changes needed
{
  "name": "unicornsurf",
  "description": "UnicornSurf AI-Powered Full-Stack Web Development Platform"
}
```

#### 2. Wrangler Configuration
```toml
# wrangler.toml
name = "unicornsurf"
```

#### 3. Metadata and SEO Updates
- Update all page titles from "Bolt" to "UnicornSurf"
- Change meta descriptions to reflect new brand
- Update social preview images and favicons

### Phase 2: Content and Messaging

#### 4. AI Assistant Identity
- Rebrand from "Bolt" to "Surf" (the AI assistant name)
- Update system prompts in `app/lib/.server/llm/prompts.ts`
- Modify AI personality to reflect surfing/wave themes

#### 5. User Interface Copy
- Update placeholder text in chat interface
- Modify help text and error messages
- Change loading states and notifications

#### 6. Documentation Updates
- Update README.md with new branding
- Modify CONTRIBUTING.md references
- Update code comments and examples

### Phase 3: Visual Identity

#### 7. Assets Replacement
- Replace favicon and app icons
- Update social preview images
- Add UnicornSurf logo and branding elements

#### 8. Theme and Styling
- Update CSS custom properties for new color scheme
- Modify theme variables in stores
- Update component styling to match new brand

## Implementation Checklist

### Files Requiring Updates

#### Configuration Files
- [ ] `package.json` - name, description
- [ ] `wrangler.toml` - project name
- [ ] `README.md` - complete rebranding
- [ ] `CONTRIBUTING.md` - reference updates

#### Core Application Files
- [ ] `app/routes/_index.tsx` - meta title and description
- [ ] `app/root.tsx` - title and theme references
- [ ] `app/lib/.server/llm/prompts.ts` - AI assistant identity
- [ ] `app/components/chat/BaseChat.tsx` - placeholder text

#### Type Definitions
- [ ] `app/types/actions.ts` - rename BoltAction to SurfAction
- [ ] `app/types/artifact.ts` - rename BoltArtifactData to SurfArtifactData

#### Runtime and Core Logic
- [ ] `app/lib/runtime/message-parser.ts` - update type references
- [ ] `app/lib/runtime/action-runner.ts` - update type references

#### Assets and Static Files
- [ ] `public/favicon.svg` - new favicon
- [ ] `public/social_preview_index.jpg` - new social preview
- [ ] Any logo or branding assets

### Theme and Styling Updates

#### CSS Custom Properties
```css
:root {
  --unicornsurf-primary: #0066CC;
  --unicornsurf-secondary: #FF6B35;
  --unicornsurf-accent: #8B5CF6;
  --unicornsurf-neutral: #6B7280;
}
```

#### Component Styling
- Update button colors and hover states
- Modify chat interface colors
- Adjust terminal and editor themes
- Update loading animations and transitions

## Technical Implementation Notes

### 1. Maintaining Functionality
- All WebContainer integration remains unchanged
- AI model configuration stays the same (Claude Sonnet 3.5)
- Core architecture and component structure preserved
- No breaking changes to existing APIs

### 2. Environment Variables
- Update any environment variables referencing "bolt"
- Configure new domain settings for deployment
- Update API keys if domain-specific

### 3. Deployment Considerations
- Configure new Cloudflare Pages project for unicornsurf.ai domain
- Update DNS settings for new domain
- Set up SSL certificates
- Configure redirects from old domain if needed

### 4. SEO and Analytics
- Update Google Analytics tracking if applicable
- Configure new search console properties
- Update sitemap.xml references
- Set up proper meta tags for new domain

## Content Guidelines

### Voice and Tone
- **Innovative**: Emphasize cutting-edge AI technology
- **Accessible**: Keep technical concepts approachable
- **Energetic**: Use surfing metaphors naturally (ride the wave, catch the perfect code, etc.)
- **Professional**: Maintain technical credibility

### Messaging Framework
- **What we do**: "Surf the waves of innovation with AI-powered development"
- **How we help**: "Catch the perfect wave of productivity with our AI assistant"
- **Why choose us**: "Ride the cutting edge of browser-based development"

### Copy Examples
```
Old: "Talk with Bolt, an AI assistant from StackBlitz"
New: "Ride the wave with Surf, your AI development companion"

Old: "How can Bolt help you today?"
New: "Ready to catch the perfect wave? How can Surf help you today?"
```

## Brand Assets Needed

### Logo Variations
- [ ] Primary logo (horizontal)
- [ ] Icon/mark version
- [ ] Favicon (16x16, 32x32, 64x64)
- [ ] Social media profile images

### Marketing Assets
- [ ] Social preview images (1200x630)
- [ ] Banner images for documentation
- [ ] Loading animations with new branding

### Color Variations
- [ ] Light theme color palette
- [ ] Dark theme color palette
- [ ] High contrast accessibility variants

## Testing Strategy

### Pre-Launch Checklist
- [ ] All "Bolt" references updated to "UnicornSurf" or "Surf"
- [ ] New branding assets implemented
- [ ] Theme colors updated throughout application
- [ ] All functionality tested and working
- [ ] SEO metadata properly configured
- [ ] Performance impact assessed
- [ ] Accessibility compliance verified

### User Testing
- [ ] Interface usability with new branding
- [ ] AI assistant personality acceptance
- [ ] Visual design feedback
- [ ] Navigation and user flow validation

## Rollout Plan

### Phase 1: Internal Updates (Week 1)
- Complete all code changes
- Update configuration files
- Test functionality thoroughly

### Phase 2: Visual Identity (Week 2)
- Implement new color scheme
- Add branding assets
- Update all visual elements

### Phase 3: Content Updates (Week 3)
- Update all copy and messaging
- Revise documentation
- Implement new AI personality

### Phase 4: Launch Preparation (Week 4)
- Final testing and QA
- Domain configuration
- Analytics setup
- Go-live planning

## Maintenance Guidelines

### Ongoing Brand Consistency
- Ensure all new features follow UnicornSurf branding
- Maintain consistent voice and tone in all content
- Keep visual elements aligned with brand guidelines
- Regular brand asset updates as needed

### Documentation Updates
- Keep this claude.md file updated with any changes
- Document new brand asset locations
- Maintain changelog of branding updates
- Update developer guidelines for consistent implementation

## Success Metrics

### Technical Metrics
- [ ] Zero functionality regressions
- [ ] Performance benchmarks maintained
- [ ] All tests passing
- [ ] No broken links or assets

### Brand Metrics
- [ ] Complete elimination of old brand references
- [ ] Consistent new brand implementation
- [ ] Positive user feedback on new identity
- [ ] Successful domain migration (if applicable)

---

*Last Updated: September 6, 2025*
*Version: 1.0*
*Status: Implementation Ready*