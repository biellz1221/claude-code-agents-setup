#!/bin/bash
set -e

# ============================================================
# Claude Code Environment Setup
# ============================================================
# This script configures the global Claude Code environment with:
# - Global settings.json
# - Global CLAUDE.md (instructions file)
# - 15 specialized subagents
# - 10 custom skills (slash commands)
# - 3 rule files (TypeScript, NestJS, React)
# - Dev container template
# - Global MCPs (Context7, Playwright, Prisma)
# ============================================================

CLAUDE_DIR="$HOME/.claude"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo ""
echo "╔══════════════════════════════════════════════════╗"
echo "║  Claude Code Environment Setup                   ║"
echo "║  Stack: Node.js / NestJS / Prisma / React        ║"
echo "╚══════════════════════════════════════════════════╝"
echo ""

# ---- Create directory structure ----
echo "📁 Creating directory structure..."
mkdir -p "$CLAUDE_DIR/agents"
mkdir -p "$CLAUDE_DIR/skills/prospecting"
mkdir -p "$CLAUDE_DIR/skills/idea-validator"
mkdir -p "$CLAUDE_DIR/skills/qa-suite"
mkdir -p "$CLAUDE_DIR/skills/pentest"
mkdir -p "$CLAUDE_DIR/skills/api-scaffold"
mkdir -p "$CLAUDE_DIR/skills/landing-gen"
mkdir -p "$CLAUDE_DIR/skills/light-copy"
mkdir -p "$CLAUDE_DIR/skills/funnel-strategy"
mkdir -p "$CLAUDE_DIR/skills/hormozi-offer"
mkdir -p "$CLAUDE_DIR/skills/trend-scanner"
mkdir -p "$CLAUDE_DIR/rules"

# ---- Copy settings.json ----
echo "⚙️  Installing global settings.json..."
if [ -f "$CLAUDE_DIR/settings.json" ]; then
  echo "   ⚠️  settings.json already exists. Creating backup at settings.json.bak"
  cp "$CLAUDE_DIR/settings.json" "$CLAUDE_DIR/settings.json.bak"
fi
cp "$SCRIPT_DIR/settings.json" "$CLAUDE_DIR/settings.json"

# ---- Copy CLAUDE.md ----
echo "📝 Installing global CLAUDE.md..."
if [ -f "$CLAUDE_DIR/CLAUDE.md" ]; then
  echo "   ⚠️  CLAUDE.md already exists. Creating backup at CLAUDE.md.bak"
  cp "$CLAUDE_DIR/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md.bak"
fi
cp "$SCRIPT_DIR/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"

# ---- Copy agents ----
echo "🤖 Installing subagents..."
for agent_file in "$SCRIPT_DIR"/agents/*.md; do
  if [ -f "$agent_file" ]; then
    agent_name=$(basename "$agent_file" .md)
    cp "$agent_file" "$CLAUDE_DIR/agents/"
    echo "   ✅ $agent_name"
  fi
done

# ---- Copy skills ----
echo "🧠 Installing skills..."
for skill_dir in "$SCRIPT_DIR"/skills/*; do
  if [ -d "$skill_dir" ]; then
    skill_name=$(basename "$skill_dir")
    cp -r "${skill_dir%/}" "$CLAUDE_DIR/skills/"
    echo "   ✅ $skill_name"
  fi
done

# ---- Copy rules ----
echo "📏 Installing rules..."
for rule_file in "$SCRIPT_DIR"/rules/*.md; do
  if [ -f "$rule_file" ]; then
    rule_name=$(basename "$rule_file" .md)
    cp "$rule_file" "$CLAUDE_DIR/rules/"
    echo "   ✅ $rule_name"
  fi
done

# ---- Install MCPs ----
echo ""
echo "🔌 Installing global MCPs..."

if command -v claude &> /dev/null; then
  echo "   Installing Context7 (up-to-date documentation)..."
  claude mcp add context7 --scope user -- npx -y @upstash/context7-mcp@latest 2>/dev/null && \
    echo "   ✅ Context7" || echo "   ⚠️  Context7 — failed (install manually)"

  echo "   Installing Playwright (e2e testing & automation)..."
  claude mcp add playwright --scope user -- npx -y @playwright/mcp@latest 2>/dev/null && \
    echo "   ✅ Playwright" || echo "   ⚠️  Playwright — failed (install manually)"

  echo "   Installing Prisma MCP..."
  claude mcp add prisma --scope user -- npx -y prisma mcp 2>/dev/null && \
    echo "   ✅ Prisma" || echo "   ⚠️  Prisma — failed (install manually)"
else
  echo "   ⚠️  Claude CLI not found. Install MCPs manually:"
  echo "      claude mcp add context7 --scope user -- npx -y @upstash/context7-mcp@latest"
  echo "      claude mcp add playwright --scope user -- npx -y @playwright/mcp@latest"
  echo "      claude mcp add prisma --scope user -- npx -y prisma mcp"
fi

# ---- Summary ----
echo ""
echo "╔══════════════════════════════════════════════════╗"
echo "║  ✅ Setup complete!                              ║"
echo "╚══════════════════════════════════════════════════╝"
echo ""
echo "📂 Files installed at: $CLAUDE_DIR/"
echo ""
echo "Available Subagents:"
echo "  🏗️  architect        — Software architecture & project structure"
echo "  ⚙️  backend-dev      — NestJS backend implementation"
echo "  🎨 frontend-dev     — React frontend implementation"
echo "  📄 landing-page     — High-conversion landing pages"
echo "  🧪 qa-tester        — Automated testing (unit, integration, e2e)"
echo "  🔒 security-auditor — Security audit & vulnerability scanning"
echo "  👀 code-reviewer    — Automated code review"
echo "  🗄️  db-specialist    — Database modeling & query optimization"
echo "  🚀 devops           — Docker, CI/CD & infrastructure"
echo "  💡 feature-ideator  — Feature ideas & product analysis"
echo "  📱 mobile-dev       — React Native / Expo mobile apps"
echo "  ✍️  ad-copywriter    — Ad copy for Meta/Google/TikTok"
echo "  🎬 video-scripter   — Video ad scripts"
echo "  🎨 ad-creative      — Visual ad concepts & creative briefs"
echo "  📊 marketing-strat  — Complete marketing strategy"
echo ""
echo "Available Skills (slash commands):"
echo "  /prospecting       — Lead prospecting & qualification"
echo "  /idea-validator    — Product idea validation"
echo "  /qa-suite          — Full QA suite (tests, lint, build, audit)"
echo "  /pentest           — Security penetration testing"
echo "  /api-scaffold      — NestJS module scaffold generator"
echo "  /landing-gen       — Landing page generator"
echo "  /light-copy        — Conversational copy (Light Copy method)"
echo "  /funnel-strategy   — Sales funnel design (Brunson framework)"
echo "  /hormozi-offer     — Irresistible offers (Hormozi framework)"
echo "  /trend-scanner     — Digital marketing trends scanner"
echo ""
echo "Global MCPs:"
echo "  📚 Context7        — Up-to-date docs for any library"
echo "  🎭 Playwright      — E2E testing & browser automation"
echo "  💎 Prisma          — Schema & query assistance"
echo ""
echo "To use dev containers in a project:"
echo "  cp -r $SCRIPT_DIR/devcontainer-template/ your-project/.devcontainer/"
echo ""
echo "To get started:"
echo "  cd your-project && claude"
echo ""
