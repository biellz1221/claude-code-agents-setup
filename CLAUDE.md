# Claude Code Setup — Example CLAUDE.md

> This is an **example** `CLAUDE.md` showcasing the capabilities available in this setup.
> Copy this file to `~/.claude/CLAUDE.md` and customize it to your needs.

## About Me
<!-- Describe your role so Claude can tailor responses to your experience level -->
I'm a full-stack developer working on web applications.
I value clean, tested, maintainable code.

## Tech Stack
<!-- List your stack so Claude knows what tools and patterns to use -->
- **Runtime:** Node.js 20+ with TypeScript strict
- **Backend:** NestJS + Prisma + PostgreSQL
- **Frontend:** React 18+ (Next.js or Vite) + Tailwind CSS
- **Tests:** Jest (unit/integration) + Playwright (e2e)
- **ORM:** Prisma with versioned migrations
- **Package Manager:** pnpm (preferred) or npm
- **Infra:** Docker + Docker Compose
- **CI/CD:** GitHub Actions

## Code Conventions

### TypeScript
- Strict mode always (`"strict": true` in tsconfig)
- Never use `any` — use `unknown` and narrow with type guards
- Prefer interfaces for objects, types for unions/intersections
- Indentation: 2 spaces
- Single quotes, semicolons required
- async/await always (never .then chains)
- Max 50 lines per function, max 300 lines per file

### Naming
- Variables and functions: camelCase
- Classes and interfaces: PascalCase
- Constants: UPPER_SNAKE_CASE
- Files: kebab-case

### Git
- Branches: `feature/description`, `fix/description`, `chore/description`
- Conventional Commits (`feat:`, `fix:`, `chore:`, `docs:`, `test:`, `refactor:`)
- Always run tests before committing
- PRs with clear description of what changes and why

## Pre-Commit Checks
```bash
npm test          # all tests passing
npm run lint      # zero errors
npm run build     # compilation without errors
npx tsc --noEmit  # type check
```

## Protected Files
These files must NEVER be modified without explicit confirmation:
- `.env`, `.env.*` (environment variables)
- `prisma/migrations/**` (applied migrations)
- `docker-compose.prod.yml`
- Any file containing credentials or secrets
- Lock files (`package-lock.json` / `pnpm-lock.yaml`)

## Autonomy Mode — When to Ask for Confirmation
ASK BEFORE:
- Running database migrations (`prisma migrate`)
- Installing new dependencies
- Running `git push`
- Modifying CI/CD configs
- Deleting files or data
- Modifying environment variables
- Any irreversible operation

CAN DO FREELY:
- Create/edit code files
- Run tests, lint, build
- Git add, commit, diff, log, status
- Read any project file

## Communication
- Respond in English (change to your preferred language)
- Be direct and pragmatic
- If in doubt, ask before assuming
- Briefly explain architecture decisions (the "why")
