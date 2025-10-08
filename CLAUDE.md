# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Tech Stack

- **Astro 5** - Server-rendered web framework (output: "server" mode)
- **React 19** - UI library for interactive components
- **TypeScript 5** - Type-safe JavaScript
- **Tailwind CSS 4** - Utility-first CSS framework
- **Shadcn/ui** - Component library (New York style)
- **Supabase** - Backend services, auth, and database

## Commands

### Development
```bash
npm run dev          # Start dev server (port 3000)
npm run build        # Build for production
npm run preview      # Preview production build
```

### Code Quality
```bash
npm run lint         # Run ESLint
npm run lint:fix     # Fix ESLint issues
npm run format       # Format code with Prettier
```

### Testing
No test configuration currently set up.

## Architecture

### Rendering Mode
This project uses Astro's **server-side rendering** (SSR) mode with the Node.js adapter in standalone mode. All pages are rendered on-demand by default.

### Component Strategy
- **Astro components** (.astro) - Use for static content and layouts
- **React components** (.tsx) - Use ONLY when interactivity is needed
- Never use "use client" or Next.js directives (this is Astro + React, not Next.js)

### Directory Structure
- `./src` - source code
- `./src/layouts` - Astro layouts
- `./src/pages` - Astro pages
- `./src/pages/api` - API endpoints
- `./src/middleware/index.ts` - Astro middleware
- `./src/db` - Supabase clients and types
- `./src/types.ts` - Shared types for backend and frontend (Entities, DTOs)
- `./src/components` - Client-side components written in Astro (static) and React (dynamic)
- `./src/components/ui` - Client-side components from Shadcn/ui
- `./src/lib` - Services and helpers 
- `./src/assets` - static internal assets
- `./public` - public assets

### Path Aliases
Configured in tsconfig.json:
- `@/*` maps to `./src/*`
- Components: `@/components`
- Utils: `@/lib/utils`
- UI: `@/components/ui`

### API Routes
- Use uppercase HTTP method handlers: `GET`, `POST`, etc.
- Always add `export const prerender = false` for API routes
- Validate input with Zod schemas
- Extract business logic to `src/lib/services`
- Access Supabase via `context.locals.supabase` (not direct import)
- Use `SupabaseClient` type from `src/db/supabase.client.ts`

### Middleware
Implement in `src/middleware/index.ts` for request/response modification, authentication checks, etc.

## Coding Practices

### Error Handling Pattern
- Handle errors and edge cases at the beginning of functions
- Use early returns for error conditions (avoid deep nesting)
- Place happy path last in the function
- Avoid unnecessary else statements (if-return pattern)
- Use guard clauses for preconditions
- Implement proper error logging with user-friendly messages

### Astro Best Practices
- Leverage View Transitions API with ClientRouter for smooth navigation
- Use content collections with type safety for structured content
- Use `Astro.cookies` for server-side cookie management
- Access environment variables via `import.meta.env`
- Enable image optimization with Astro Image integration
- Implement hybrid rendering (SSR where needed, static elsewhere)

### React Best Practices
- Use functional components with hooks (no class components)
- Extract logic to custom hooks in `src/components/hooks`
- Use `React.memo()` for expensive components with stable props
- Use `React.lazy()` and Suspense for code-splitting
- Use `useCallback` for event handlers passed to children
- Use `useMemo` for expensive calculations
- Use `useId()` for generating unique IDs for accessibility
- Use `useOptimistic` for optimistic UI updates
- Use `useTransition` for non-urgent state updates

### Tailwind Guidelines
- Use `@layer` directive to organize styles (components, utilities, base)
- Use arbitrary values with square brackets for one-offs (e.g., `w-[123px]`)
- Use responsive variants: `sm:`, `md:`, `lg:`, etc.
- Use state variants: `hover:`, `focus-visible:`, `active:`, etc.
- Implement dark mode with `dark:` variant
- Leverage `theme()` function in CSS for accessing theme values

### Accessibility (ARIA)
- Use ARIA landmarks to identify page regions (main, navigation, search)
- Apply ARIA roles to custom elements without semantic HTML equivalents
- Set `aria-expanded` and `aria-controls` for expandable content
- Use `aria-live` regions for dynamic content updates
- Use `aria-hidden` to hide decorative content from screen readers
- Apply `aria-label` or `aria-labelledby` for elements without visible labels
- Use `aria-describedby` for descriptive text associations
- Use `aria-current` for current item indication
- Avoid redundant ARIA that duplicates native HTML semantics

### Supabase Integration
- Use Supabase for authentication and database operations
- Always access via `context.locals.supabase` in API routes (not direct import)
- Import `SupabaseClient` type from `src/db/supabase.client.ts`, not `@supabase/supabase-js`
- Validate all data with Zod schemas
- ALWAYS enable Row Level Security (RLS) on new tables
- Create granular RLS policies (separate policies for each operation and role)

**When setting up Supabase**: See `.cursor/rules/api-supabase-astro-init.mdc` for complete initialization structure

**When creating database migrations**: See `.cursor/rules/db-supabase-migrations.mdc` for migration file naming, SQL guidelines, and RLS best practices

## Shadcn/ui Components

Components are in `src/components/ui/` using **New York** style with **neutral** base color.

**Adding new components**: `npx shadcn@latest add [component-name]`

**When working with Shadcn/ui**: See `.cursor/rules/ui-shadcn-helper.mdc` for component usage patterns and available components

## Linting & Formatting

- ESLint configured with TypeScript, React, Astro, and accessibility plugins
- Prettier configured for code formatting
- Husky + lint-staged for pre-commit hooks:
  - Auto-fix ESLint on `.ts`, `.tsx`, `.astro` files
  - Auto-format `.json`, `.css`, `.md` files

## Node Version

Required: Node.js v22.14.0 (see `.nvmrc`)

## Context-Specific Rules

For detailed patterns and guidelines:
- `.cursor/rules/shared.mdc` - Always applicable coding practices
- `.cursor/rules/frontend.mdc` - Frontend (Astro/React) guidelines
- `.cursor/rules/astro.mdc` - Astro-specific patterns
- `.cursor/rules/react.mdc` - React hooks and component patterns
- `.cursor/rules/backend.mdc` - Backend and database patterns
- `.cursor/rules/ui-shadcn-helper.mdc` - Shadcn/ui component usage
- `.cursor/rules/api-supabase-astro-init.mdc` - Supabase initialization
- `.cursor/rules/db-supabase-migrations.mdc` - Database migration guidelines
