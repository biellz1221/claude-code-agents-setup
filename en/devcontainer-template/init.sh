#!/bin/bash
set -e

echo "🚀 Initializing dev container..."

# Install project dependencies
if [ -f "pnpm-lock.yaml" ]; then
  echo "📦 Installing dependencies with pnpm..."
  pnpm install --frozen-lockfile 2>/dev/null || pnpm install
elif [ -f "package-lock.json" ]; then
  echo "📦 Installing dependencies with npm..."
  npm ci 2>/dev/null || npm install
elif [ -f "package.json" ]; then
  echo "📦 Installing dependencies..."
  npm install
fi

# Generate Prisma client if schema exists
if [ -f "prisma/schema.prisma" ]; then
  echo "🔧 Generating Prisma client..."
  npx prisma generate
fi

# Install Playwright browsers if config exists
if [ -f "playwright.config.ts" ] || [ -f "playwright.config.js" ]; then
  echo "🎭 Installing Playwright browsers..."
  npx playwright install chromium
fi

# Configure git (if not already configured)
git config --global --get user.email > /dev/null 2>&1 || \
  git config --global user.email "gabriel@dev.local"
git config --global --get user.name > /dev/null 2>&1 || \
  git config --global user.name "Gabriel"

# Git config for better experience
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global push.autoSetupRemote true

echo ""
echo "✅ Dev container ready!"
echo ""
echo "Available commands:"
echo "  claude                    → Start Claude Code interactive"
echo "  claude -m 'instruction'   → Run direct instruction"
echo "  claude --dangerously-skip-permissions  → Autonomous mode (no confirmations)"
echo ""
