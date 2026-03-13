#!/bin/bash
set -e

echo "🚀 Inicializando dev container..."

# Install project dependencies
if [ -f "pnpm-lock.yaml" ]; then
  echo "📦 Instalando dependências com pnpm..."
  pnpm install --frozen-lockfile 2>/dev/null || pnpm install
elif [ -f "package-lock.json" ]; then
  echo "📦 Instalando dependências com npm..."
  npm ci 2>/dev/null || npm install
elif [ -f "package.json" ]; then
  echo "📦 Instalando dependências..."
  npm install
fi

# Generate Prisma client if schema exists
if [ -f "prisma/schema.prisma" ]; then
  echo "🔧 Gerando Prisma client..."
  npx prisma generate
fi

# Install Playwright browsers if config exists
if [ -f "playwright.config.ts" ] || [ -f "playwright.config.js" ]; then
  echo "🎭 Instalando browsers do Playwright..."
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
echo "✅ Dev container pronto!"
echo ""
echo "Comandos disponíveis:"
echo "  claude                    → Iniciar Claude Code interativo"
echo "  claude -m 'instrução'     → Executar instrução direta"
echo "  claude --dangerously-skip-permissions  → Modo autônomo (sem confirmações)"
echo ""
