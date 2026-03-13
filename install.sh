#!/bin/bash
set -e

# ============================================================
# Claude Code Environment Setup — Gabriel (Dev Solo)
# ============================================================
# Este script configura o ambiente global do Claude Code com:
# - settings.json global
# - CLAUDE.md global
# - 9 subagentes especializados
# - 6 skills customizadas
# - 3 rule files (TypeScript, NestJS, React)
# - Template de dev container
# - MCPs globais (Context7, Playwright, Prisma)
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
echo "📁 Criando estrutura de diretórios..."
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
echo "⚙️  Instalando settings.json global..."
if [ -f "$CLAUDE_DIR/settings.json" ]; then
  echo "   ⚠️  settings.json já existe. Fazendo backup em settings.json.bak"
  cp "$CLAUDE_DIR/settings.json" "$CLAUDE_DIR/settings.json.bak"
fi
cp "$SCRIPT_DIR/settings.json" "$CLAUDE_DIR/settings.json"

# ---- Copy CLAUDE.md ----
echo "📝 Instalando CLAUDE.md global..."
if [ -f "$CLAUDE_DIR/CLAUDE.md" ]; then
  echo "   ⚠️  CLAUDE.md já existe. Fazendo backup em CLAUDE.md.bak"
  cp "$CLAUDE_DIR/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md.bak"
fi
cp "$SCRIPT_DIR/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"

# ---- Copy agents ----
echo "🤖 Instalando subagentes..."
for agent_file in "$SCRIPT_DIR"/agents/*.md; do
  if [ -f "$agent_file" ]; then
    agent_name=$(basename "$agent_file" .md)
    cp "$agent_file" "$CLAUDE_DIR/agents/"
    echo "   ✅ $agent_name"
  fi
done

# ---- Copy skills ----
echo "🧠 Instalando skills..."
for skill_dir in "$SCRIPT_DIR"/skills/*; do
  if [ -d "$skill_dir" ]; then
    skill_name=$(basename "$skill_dir")
    # Remove trailing slash to ensure cp -r copies the directory itself, not just contents
    cp -r "${skill_dir%/}" "$CLAUDE_DIR/skills/"
    echo "   ✅ $skill_name"
  fi
done

# ---- Copy rules ----
echo "📏 Instalando rules..."
for rule_file in "$SCRIPT_DIR"/rules/*.md; do
  if [ -f "$rule_file" ]; then
    rule_name=$(basename "$rule_file" .md)
    cp "$rule_file" "$CLAUDE_DIR/rules/"
    echo "   ✅ $rule_name"
  fi
done

# ---- Install MCPs ----
echo ""
echo "🔌 Instalando MCPs globais..."

# Check if claude CLI is available
if command -v claude &> /dev/null; then
  echo "   Instalando Context7 (documentação atualizada)..."
  claude mcp add context7 --scope user -- npx -y @upstash/context7-mcp@latest 2>/dev/null && \
    echo "   ✅ Context7" || echo "   ⚠️  Context7 - falhou (instalar manualmente)"

  echo "   Instalando Playwright (testes e2e)..."
  claude mcp add playwright --scope user -- npx -y @playwright/mcp@latest 2>/dev/null && \
    echo "   ✅ Playwright" || echo "   ⚠️  Playwright - falhou (instalar manualmente)"

  echo "   Instalando Prisma MCP..."
  claude mcp add prisma --scope user -- npx -y prisma mcp 2>/dev/null && \
    echo "   ✅ Prisma" || echo "   ⚠️  Prisma - falhou (instalar manualmente)"
else
  echo "   ⚠️  Claude CLI não encontrado. Instale MCPs manualmente:"
  echo "      claude mcp add context7 --scope user -- npx -y @upstash/context7-mcp@latest"
  echo "      claude mcp add playwright --scope user -- npx -y @playwright/mcp@latest"
  echo "      claude mcp add prisma --scope user -- npx -y prisma mcp"
fi

# ---- Summary ----
echo ""
echo "╔══════════════════════════════════════════════════╗"
echo "║  ✅ Setup concluído!                             ║"
echo "╚══════════════════════════════════════════════════╝"
echo ""
echo "📂 Arquivos instalados em: $CLAUDE_DIR/"
echo ""
echo "Subagentes disponíveis:"
echo "  🏗️  architect       — Projeta arquitetura e estrutura"
echo "  ⚙️  backend-dev     — Implementa backend NestJS"
echo "  🎨 frontend-dev    — Implementa frontend React"
echo "  📄 landing-page    — Cria landing pages de conversão"
echo "  🧪 qa-tester       — Cria e executa testes"
echo "  🔒 security-auditor— Auditoria de segurança"
echo "  👀 code-reviewer   — Code review automatizado"
echo "  🗄️  db-specialist   — Modelagem e otimização de banco"
echo "  🚀 devops          — Docker, CI/CD e infraestrutura"
echo "  💡 feature-ideator — Análise de projeto + ideias de features"
echo "  📱 mobile-dev      — React Native / Expo mobile apps"
echo "  ✍️  ad-copywriter   — Copy para Meta/Google/TikTok Ads"
echo "  🎬 video-scripter  — Roteiros de vídeo pra ads"
echo "  🎨 ad-creative     — Conceitos visuais e briefs de anúncios"
echo "  📊 marketing-strat — Estratégia completa de marketing"
echo ""
echo "Skills disponíveis:"
echo "  /prospecting       — Prospecção de leads"
echo "  /idea-validator    — Validação de ideias"
echo "  /qa-suite          — Suite completa de QA"
echo "  /pentest           — Auditoria de segurança"
echo "  /api-scaffold      — Scaffold de módulo NestJS"
echo "  /landing-gen       — Gerador de landing page"
echo "  /light-copy        — Copy conversacional (método Ladeira)"
echo "  /funnel-strategy   — Funis de venda (Russell Brunson)"
echo "  /hormozi-offer     — Ofertas irresistíveis (Alex Hormozi)"
echo "  /trend-scanner     — Tendências do mercado digital"
echo ""
echo "MCPs globais:"
echo "  📚 Context7        — Docs atualizadas de qualquer lib"
echo "  🎭 Playwright      — Testes e2e e automação"
echo "  💎 Prisma          — Schema e queries"
echo ""
echo "Para usar dev containers em um projeto:"
echo "  cp -r $SCRIPT_DIR/devcontainer-template/ seu-projeto/.devcontainer/"
echo ""
echo "Para começar:"
echo "  cd seu-projeto && claude"
echo ""
