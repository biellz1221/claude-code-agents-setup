# Claude Code Agents Setup

A complete, production-ready environment setup for [Claude Code](https://claude.ai/code) — Anthropic's CLI for Claude. Includes specialized subagents, custom skills (slash commands), rule files, global settings, MCP integrations, and a dev container template.

Optimized for a **Node.js / TypeScript / NestJS / Prisma / React** stack, but easily adaptable to any tech stack.

## What's Included

### 15 Specialized Subagents

| Agent | Description |
|-------|-------------|
| `architect` | Software architecture, folder structure, DB schemas & API contracts |
| `backend-dev` | NestJS backend implementation (APIs, services, modules, migrations) |
| `frontend-dev` | React frontend implementation (components, pages, hooks, API integration) |
| `landing-page` | High-conversion landing pages with copywriting, SEO & performance |
| `qa-tester` | Automated testing — unit, integration & e2e (Jest + Playwright) |
| `security-auditor` | Security audit, OWASP Top 10, vulnerability scanning |
| `code-reviewer` | Automated code review for quality, performance & security |
| `db-specialist` | Database modeling, query optimization & migrations (Prisma/PostgreSQL) |
| `devops` | Docker, CI/CD, deploy & infrastructure |
| `feature-ideator` | Project analysis + market research → prioritized feature ideas |
| `mobile-dev` | React Native / Expo mobile app development |
| `ad-copywriter` | Ad copy for Meta Ads, Google Ads & TikTok Ads |
| `video-scripter` | Video ad scripts for Reels, TikTok, YouTube & Stories |
| `ad-creative` | Visual ad concepts, creative briefs & HTML/CSS mockups |
| `marketing-strategist` | Complete marketing strategy, funnels, channels & KPIs |

### 10 Custom Skills (Slash Commands)

| Skill | Command | Description |
|-------|---------|-------------|
| QA Suite | `/qa-suite` | Full quality suite — tests, lint, type-check, build, coverage & security audit |
| Pentest | `/pentest` | Security penetration testing (OWASP Top 10 focused) |
| API Scaffold | `/api-scaffold` | NestJS module scaffold with CRUD, DTOs, tests & Swagger |
| Landing Gen | `/landing-gen` | Landing page generator with SEO & performance optimization |
| Idea Validator | `/idea-validator` | Product/business idea validation across 6 dimensions |
| Prospecting | `/prospecting` | Lead prospecting & BANT qualification |
| Light Copy | `/light-copy` | Conversational copy for social media (Light Copy method) |
| Funnel Strategy | `/funnel-strategy` | Sales funnel design (Russell Brunson framework) |
| Hormozi Offer | `/hormozi-offer` | Irresistible offer creation (Alex Hormozi framework) |
| Trend Scanner | `/trend-scanner` | Digital marketing trends scanner & analysis |

### 3 Rule Files

- **TypeScript** — Strict mode, type safety, async patterns, naming conventions
- **NestJS** — Module structure, DI, controllers, services, error handling
- **React** — Components, state management, data fetching, styling, performance

### Global Settings

Pre-configured `settings.json` with:
- Sensible permission defaults (allow common dev commands, deny destructive ones)
- Environment variables for development
- macOS notification hook for when Claude needs attention

### MCP Integrations

- **Context7** — Up-to-date documentation for any library
- **Playwright** — E2E testing & browser automation
- **Prisma** — Schema & query assistance

### Dev Container Template

Ready-to-use `.devcontainer/` configuration for consistent development environments.

## Languages

This setup is available in two languages:

| Language | Folder | Install |
|----------|--------|---------|
| English | [`en/`](en/) | `cd en && ./install.sh` |
| Portugues (pt-BR) | [`pt-br/`](pt-br/) | `cd pt-br && ./install.sh` |

## Quick Start

1. **Clone the repo:**
   ```bash
   git clone git@github.com:biellz1221/claude-code-agents-setup.git
   cd claude-code-agents-setup
   ```

2. **Choose your language and run the installer:**
   ```bash
   # English
   cd en && ./install.sh

   # Portuguese (pt-BR)
   cd pt-br && ./install.sh
   ```

3. **Customize `~/.claude/CLAUDE.md`** with your personal preferences, stack, and conventions.

4. **Start using Claude Code in any project:**
   ```bash
   cd your-project && claude
   ```

## Customization

### CLAUDE.md

The `CLAUDE.md` file is your main instruction file. Customize it with:
- Your role and experience level
- Your tech stack
- Code conventions and naming patterns
- Git workflow preferences
- Which operations require confirmation vs. can run freely
- Communication preferences (language, verbosity)

See [`CLAUDE.example.md`](CLAUDE.example.md) for a template.

### Adding New Agents

Create a new `.md` file in `~/.claude/agents/` with this structure:

```markdown
---
name: my-agent
description: What this agent does and when to use it.
tools: Read, Edit, Write, Bash, Grep, Glob
model: sonnet
---

Your agent instructions here...
```

### Adding New Skills

Create a new folder in `~/.claude/skills/` with a `SKILL.md` file:

```markdown
---
name: my-skill
description: What this skill does.
allowed-tools: Bash, Read, Write
---

# My Skill

Instructions for the skill...
```

## Project Structure

```
claude-code-agents-setup/
├── README.md                  # This file
├── CLAUDE.md                  # Example CLAUDE.md (template)
├── CLAUDE.example.md          # Same template, explicit example name
├── install.sh                 # Root installer (English)
├── settings.json              # Global Claude Code settings
├── en/                        # English version
│   ├── install.sh
│   ├── CLAUDE.md
│   ├── settings.json
│   ├── agents/                # 15 subagent definitions
│   ├── skills/                # 10 custom skills
│   ├── rules/                 # TypeScript, NestJS, React rules
│   └── devcontainer-template/
├── pt-br/                     # Portuguese (pt-BR) version
│   ├── install.sh
│   ├── CLAUDE.md
│   ├── settings.json
│   ├── agents/
│   ├── skills/
│   ├── rules/
│   └── devcontainer-template/
├── agents/                    # Source agents (PT-BR)
├── skills/                    # Source skills (mixed)
├── rules/                     # Source rules (PT-BR)
└── devcontainer-template/     # Dev container config
```

## Requirements

- [Claude Code CLI](https://claude.ai/code) installed
- Node.js 20+
- Bash shell (macOS / Linux / WSL)

## License

MIT
