# Bolt.new Architecture Documentation

## Overview

Bolt.new is an AI-powered full-stack web development platform that runs entirely in the browser using StackBlitz's WebContainer technology. It combines Claude Sonnet 3.5 AI capabilities with a sandboxed Node.js environment to enable users to prompt, run, edit, and deploy full-stack applications without local setup.

## High-Level Architecture

```
┌─────────────────────────────────────────────────────────────────────┐
│                           Browser Environment                        │
├─────────────────────┬─────────────────────┬─────────────────────────┤
│    React Frontend   │    WebContainer     │    AI Integration       │
│                     │                     │                         │
│  • Chat Interface   │  • Node.js Runtime  │  • Claude Sonnet 3.5    │
│  • Code Editor      │  • File System      │  • AI SDK               │
│  • Terminal         │  • Package Manager  │  • Message Parser       │
│  • Preview          │  • Dev Server       │  • Action Runner        │
└─────────────────────┴─────────────────────┴─────────────────────────┘
                                │
                                ▼
                    ┌─────────────────────────┐
                    │  Cloudflare Workers     │
                    │  • API Endpoints        │
                    │  • LLM Communication    │
                    │  • Request Processing   │
                    └─────────────────────────┘
```

## Core Components

### 1. Frontend Application (React + Remix)

#### Main Application Structure
- **Entry Point**: `app/root.tsx` - Main application wrapper with theme management
- **Routes**: `app/routes/_index.tsx` - Primary chat interface route
- **Layout**: Responsive design with header, chat area, and workbench

#### Key Components:

**Chat System (`app/components/chat/`)**
- `Chat.client.tsx`: Main chat component with AI interaction logic
- `BaseChat.tsx`: Server-side fallback chat component
- `AssistantMessage.tsx`: AI message rendering with code highlighting

**Workbench (`app/components/workbench/`)**
- Code editor with CodeMirror integration
- Terminal emulator using xterm.js
- File browser and management
- Preview pane for running applications

**Editor System (`app/components/editor/`)**
- `CodeMirrorEditor.tsx`: Advanced code editor with syntax highlighting
- Multi-language support (JavaScript, TypeScript, Python, HTML, CSS, etc.)
- Real-time collaboration features

### 2. State Management (Nanostores)

The application uses nanostores for reactive state management:

**Core Stores** (`app/lib/stores/`):
- `workbench.ts`: Central workbench state management
- `chat.ts`: Chat interface state
- `editor.ts`: Code editor state and document management  
- `files.ts`: File system operations and modifications
- `terminal.ts`: Terminal state and process management
- `previews.ts`: Preview pane management
- `settings.ts`: User preferences and configuration
- `theme.ts`: Theme switching (light/dark mode)

### 3. WebContainer Integration

**WebContainer Setup** (`app/lib/webcontainer/`):
- `index.ts`: WebContainer initialization and management
- `auth.client.ts`: Authentication for WebContainer API

**Capabilities**:
- In-browser Node.js runtime
- npm package installation and management
- File system operations
- Terminal access with shell commands
- Web server hosting

### 4. AI Integration

**LLM Configuration** (`app/lib/.server/llm/`):
- `model.ts`: Anthropic Claude integration
- `prompts.ts`: System prompts and AI instructions
- `stream-text.ts`: Streaming response handling
- `api-key.ts`: API key management
- `constants.ts`: AI model configuration

**Message Processing**:
- `message-parser.ts`: Parse AI responses into actionable items
- `action-runner.ts`: Execute code actions in WebContainer

### 5. Runtime System

**Action Execution** (`app/lib/runtime/`):
- Action parsing and validation
- WebContainer command execution
- File system operations
- Package management
- Terminal command processing

### 6. UI Components

**Component Library** (`app/components/ui/`):
- Reusable UI components (Dialog, IconButton, Slider, etc.)
- Theme-aware styling
- Responsive design patterns

## Data Flow

### 1. User Interaction Flow
```
User Input → Chat Interface → AI Processing → Action Generation → WebContainer Execution → UI Update
```

### 2. File Management Flow
```
Editor Changes → Document Store → File System → WebContainer → Preview Update
```

### 3. AI Response Processing
```
AI Response → Message Parser → Action Runner → WebContainer API → State Update → UI Refresh
```

## Technology Stack

### Frontend Technologies
- **Framework**: React 18 with Remix Run
- **Styling**: UnoCSS with Tailwind-compatible utilities
- **State Management**: Nanostores (reactive stores)
- **Code Editor**: CodeMirror 6
- **Terminal**: xterm.js with WebGL renderer
- **Animation**: Framer Motion

### Build Tools
- **Bundler**: Vite
- **TypeScript**: Full TypeScript support
- **Linting**: ESLint with custom configuration
- **Testing**: Vitest framework

### Backend/Infrastructure
- **Runtime**: Cloudflare Workers
- **Deployment**: Cloudflare Pages
- **AI Provider**: Anthropic Claude API
- **Container**: StackBlitz WebContainer API

### Package Management
- **Package Manager**: pnpm
- **Node Version**: 20.15.1+
- **Compatibility**: ESNext target

## Security Considerations

### Browser Sandbox
- All code execution happens in WebContainer sandbox
- No native binary execution capability
- Isolated file system

### API Security
- API key management through secure storage
- Request validation and sanitization
- Rate limiting on AI requests

### Content Security
- HTML sanitization for AI-generated content
- XSS prevention in code execution
- Safe markdown rendering

## Performance Optimizations

### Code Splitting
- Client-side only components with `ClientOnly`
- Dynamic imports for heavy components
- Optimized CSS modules in production

### Caching Strategy
- Browser-based file system caching
- WebContainer instance reuse during development
- AI response caching where appropriate

### Memory Management
- Efficient state store updates
- WebContainer resource cleanup
- Terminal history management

## Deployment Architecture

### Development
```
Local Development → Vite Dev Server → WebContainer API → Claude API
```

### Production
```
Cloudflare Pages → Cloudflare Workers → WebContainer API → Claude API
```

### Configuration Files
- `wrangler.toml`: Cloudflare Workers configuration
- `vite.config.ts`: Build configuration with plugins
- `package.json`: Dependencies and scripts
- `tsconfig.json`: TypeScript configuration

## Code Review Findings

### Strengths
1. **Modern Architecture**: Well-structured React/Remix application with modern tooling
2. **Type Safety**: Comprehensive TypeScript usage throughout
3. **State Management**: Efficient reactive state with nanostores
4. **Component Architecture**: Well-organized, reusable components
5. **AI Integration**: Robust streaming AI interaction with action parsing

### Areas for Improvement
1. **Error Handling**: Could benefit from more comprehensive error boundaries
2. **Testing**: Limited test coverage, especially for WebContainer integration
3. **Documentation**: Some complex components lack inline documentation
4. **Bundle Size**: Could optimize with more aggressive code splitting
5. **Accessibility**: Some components could improve ARIA support

### Recommendations
1. **Add Error Boundaries**: Implement React error boundaries for better error handling
2. **Expand Testing**: Add integration tests for WebContainer operations
3. **Performance Monitoring**: Add performance tracking for WebContainer operations
4. **Accessibility Audit**: Comprehensive a11y review and improvements
5. **Documentation**: Add JSDoc comments for complex functions

## File Structure Summary

```
bolt.new/
├── app/
│   ├── components/          # React components
│   │   ├── chat/           # Chat interface components
│   │   ├── editor/         # Code editor components
│   │   ├── workbench/      # Development environment
│   │   ├── ui/             # Reusable UI components
│   │   └── sidebar/        # Sidebar navigation
│   ├── lib/                # Core application logic
│   │   ├── .server/        # Server-side modules
│   │   │   └── llm/        # AI/LLM integration
│   │   ├── stores/         # State management
│   │   ├── runtime/        # Action execution system
│   │   ├── webcontainer/   # WebContainer integration
│   │   └── hooks/          # Custom React hooks
│   ├── routes/             # Remix routes
│   ├── styles/             # Global styles
│   ├── types/              # TypeScript type definitions
│   └── utils/              # Utility functions
├── public/                 # Static assets
├── functions/              # Cloudflare functions
└── [config files]         # Build and deployment config
```

This architecture enables a powerful, browser-based development environment that combines the flexibility of AI assistance with the full capabilities of a Node.js runtime, all running securely within the user's browser.