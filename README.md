# 10x-cards

AI-powered flashcard generation and learning platform that leverages LLM technology to automate the creation of high-quality study materials, supporting spaced repetition learning methodology.

## Table of Contents

- [Project Description](#project-description)
- [Tech Stack](#tech-stack)
- [Getting Started Locally](#getting-started-locally)
- [Available Scripts](#available-scripts)
- [Project Scope](#project-scope)
- [Project Status](#project-status)
- [License](#license)

## Project Description

10x-cards addresses the time-consuming process of creating quality flashcards by automating generation through AI while maintaining full user control. The platform enables users to:

- **Generate flashcards automatically** from any text input using LLM API
- **Create and manage flashcards manually** with full CRUD capabilities
- **Learn efficiently** using integrated spaced repetition algorithm
- **Track progress** with generation and acceptance statistics
- **Maintain privacy** with secure authentication and GDPR-compliant data storage

The goal is to reduce the barrier to entry for evidence-based learning methods by making flashcard creation 10x faster.

## Tech Stack

### Frontend
- **Astro 5** - Server-side rendered web framework (Node.js adapter)
- **React 19** - UI library for interactive components
- **TypeScript 5** - Type-safe JavaScript
- **Tailwind CSS 4** - Utility-first CSS framework
- **Shadcn/ui** - Component library (New York style)

### Backend
- **Supabase** - Backend-as-a-Service (PostgreSQL, authentication, Row Level Security)

### AI Integration
- **OpenAI API** - LLM for flashcard generation

### Development Tools
- **ESLint** - Code linting with TypeScript, React, and accessibility plugins
- **Prettier** - Code formatting
- **Husky + lint-staged** - Pre-commit hooks for code quality

### Node.js
- **Version**: 22.14.0 (see `.nvmrc`)

## Getting Started Locally

### Prerequisites

- Node.js v22.14.0 (use `nvm use` to automatically switch to the correct version)
- npm or compatible package manager
- Supabase account and project

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd 10xProject
```

2. Install dependencies:
```bash
npm install
```

3. Set up environment variables:
Create a `.env` file in the root directory with the following variables:
```env
# Supabase
PUBLIC_SUPABASE_URL=your_supabase_url
PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key

# OpenAI
OPENAI_API_KEY=your_openai_api_key
```

4. Set up Supabase:
- Create a new Supabase project
- Run database migrations (see `.cursor/rules/db-supabase-migrations.mdc` for guidelines)
- Configure authentication providers
- Enable Row Level Security (RLS) on all tables

5. Start the development server:
```bash
npm run dev
```

The application will be available at `http://localhost:4321`

## Available Scripts

### Development
- `npm run dev` - Start development server with hot reload
- `npm run build` - Build for production
- `npm run preview` - Preview production build locally

### Code Quality
- `npm run lint` - Run ESLint to check for code issues
- `npm run lint:fix` - Automatically fix ESLint issues
- `npm run format` - Format code with Prettier

## Project Scope

### MVP Features (In Scope)

#### Core Functionality
1. **AI Flashcard Generation** (US-003, US-004)
   - Text input (1,000-10,000 characters)
   - LLM-powered suggestion generation
   - Review, edit, accept, or reject AI suggestions

2. **Manual Flashcard Management** (US-005, US-006, US-007)
   - Create flashcards with front/back fields
   - Edit existing flashcards
   - Delete flashcards with confirmation

3. **User Authentication** (US-001, US-002, US-009)
   - Email/password registration
   - Secure login
   - Account deletion with data removal
   - User data isolation (no sharing between users)

4. **Learning Sessions** (US-008)
   - Spaced repetition algorithm integration (open-source library)
   - Session-based learning interface
   - Self-assessment rating system

5. **Analytics**
   - Track AI-generated vs. manually created flashcards
   - Monitor acceptance rate of AI suggestions

6. **Data Privacy**
   - GDPR-compliant data storage
   - Right to access and delete personal data

### Out of Scope (Post-MVP)

- Custom spaced repetition algorithm
- Gamification features
- Native mobile applications
- Multi-format document import (PDF, DOCX, etc.)
- Public API
- Flashcard sharing between users
- Advanced notification system
- Keyword-based flashcard search

### Success Metrics

- **AI Effectiveness**: 75% acceptance rate for AI-generated flashcards
- **AI Adoption**: 75% of flashcards created using AI vs. manual creation
- **Engagement**: Monitor generation vs. acceptance ratios for quality analysis

## Project Status

**Current Phase**: MVP Development

This project is in active development. The MVP focuses on core flashcard generation and learning features with a simplified tech stack optimized for rapid iteration.

### Architecture Decisions

The project initially considered Astro + Docker + DigitalOcean but adopted a pragmatic approach:
- **Current**: Astro 5 with SSR + Supabase + planned Vercel deployment
- **Rationale**: Faster time-to-market (2-3 weeks vs. 4-6 weeks)
- **Scalability**: Architecture supports migration to more complex infrastructure when user traction justifies it

See `.ai/tech-stack.md` for detailed technical analysis and trade-offs.

## License

TBD