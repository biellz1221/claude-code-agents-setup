---
name: qa-suite
description: Runs a complete quality suite on the current project — tests, lint, type-check, build, coverage and security audit. Generates a consolidated report. Use when asked to run QA, check quality, validate the project or verify everything is OK.
allowed-tools: Bash, Read, Grep, Glob, Write
---

# Complete QA Suite

Run all quality checks for the current project and generate a consolidated report.

## Checks (execute in order)

### 1. Project Detection
First, identify the project type:
```bash
# Check package.json
cat package.json | jq '{name, scripts: .scripts | keys}'
```
Adapt commands based on available scripts.

### 2. TypeScript Type Check
```bash
npx tsc --noEmit 2>&1
echo "EXIT_CODE: $?"
```
- Report: number of type errors
- List the first 10 errors (if any)

### 3. Linting
```bash
# Try eslint first, then biome
npm run lint 2>&1 || npx eslint . --ext .ts,.tsx 2>&1
echo "EXIT_CODE: $?"
```
- Report: errors vs warnings
- List errors (warnings are informational)

### 4. Unit Tests
```bash
npm test -- --coverage --verbose --forceExit 2>&1
echo "EXIT_CODE: $?"
```
- Report: passed/failed/skipped
- Report: coverage (statements, branches, functions, lines)
- List failing tests with error messages

### 5. Build
```bash
npm run build 2>&1
echo "EXIT_CODE: $?"
```
- Report: success or failure
- List compilation errors (if any)

### 6. Security Audit
```bash
npm audit --json 2>&1 | jq '{
  total: .metadata.totalDependencies,
  vulnerabilities: .metadata.vulnerabilities
}'
```
- Report: critical, high, moderate, low

### 7. Outdated Dependencies
```bash
npx npm-check-updates --format group 2>&1 | head -50
```
- Report: available major, minor, patch updates

### 8. Bundle Size (if applicable)
```bash
# For projects with build output
if [ -d "dist" ]; then
  du -sh dist/
  find dist -name "*.js" -exec du -sh {} \; | sort -rh | head -10
fi
```

## Final Report

Generate `qa-report.md` at the project root:

```markdown
# QA Report — [project name]
Date: [timestamp]

## Summary

| Check | Status | Details |
|-------|--------|---------|
| TypeScript | pass/fail | X errors |
| Lint | pass/fail | X errors, Y warnings |
| Tests | pass/fail | X passed, Y failed, Z skipped |
| Coverage | pass/warn/fail | X% statements |
| Build | pass/fail | — |
| Security | pass/warn/fail | X vulnerabilities |

## Quality Score: X/100

### Calculation:
- TypeScript no errors: +20
- Lint no errors: +15
- All tests passing: +25
- Coverage >= 80%: +15 (>= 60%: +10, >= 40%: +5)
- Build no errors: +15
- Zero critical/high vulnerabilities: +10

## Issue Details
[list each issue with file, line and suggested fix]

## Recommended Actions (prioritized)
1. CRITICAL: ...
2. WARNING: ...
3. INFO: ...
```

## Rules
- ALWAYS run ALL checks, even if one fails
- Capture exit codes to determine success/failure
- If a command doesn't exist (e.g., `npm run lint` not defined), report as "N/A"
- The score is calculated OBJECTIVELY — no generous rounding
- Be direct in recommendations — a solo dev needs to know what to prioritize
