#!/bin/bash
set -e

# ============================================================
# Claude Code Environment Setup
# ============================================================
# Este script configura o ambiente global do Claude Code com:
# - settings.json global
# - CLAUDE.md global
# - 15 subagentes especializados
# - 10 skills customizadas (slash commands)
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

# ---- Criar estrutura de diretórios ----
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

# ---- Copiar settings.json ----
echo "⚙️  Instalando settings.json global..."
if [ -f "$CLAUDE_DIR/settings.json" ]; then
  echo "   ⚠️  settings.json já existe. Fazendo backup em settings.json.bak"
  cp "$CLAUDE_DIR/settings.json" "$CLAUDE_DIR/settings.json.bak"
fi
cp "$SCRIPT_DIR/settings.json" "$CLAUDE_DIR/settings.json"

# ---- Copiar CLAUDE.md ----
echo "📝 Instalando CLAUDE.md global..."
if [ -f "$CLAUDE_DIR/CLAUDE.md" ]; then
  echo "   ⚠️  CLAUDE.md já existe. Fazendo backup em CLAUDE.md.bak"
  cp "$CLAUDE_DIR/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md.bak"
fi
cp "$SCRIPT_DIR/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"

# ---- Copiar agentes ----
echo "🤖 Instalando subagentes..."
for agent_file in "$SCRIPT_DIR"/agents/*.md; do
  if [ -f "$agent_file" ]; then
    agent_name=$(basename "$agent_file" .md)
    cp "$agent_file" "$CLAUDE_DIR/agents/"
    echo "   ✅ $agent_name"
  fi
done

# ---- Copiar skills ----
echo "🧠 Instalando skills..."
for skill_dir in "$SCRIPT_DIR"/skills/*; do
  if [ -d "$skill_dir" ]; then
    skill_name=$(basename "$skill_dir")
    cp -r "${skill_dir%/}" "$CLAUDE_DIR/skills/"
    echo "   ✅ $skill_name"
  fi
done

# ---- Copiar rules ----
echo "📏 Instalando rules..."
for rule_file in "$SCRIPT_DIR"/rules/*.md; do
  if [ -f "$rule_file" ]; then
    rule_name=$(basename "$rule_file" .md)
    cp "$rule_file" "$CLAUDE_DIR/rules/"
    echo "   ✅ $rule_name"
  fi
done

# ---- Instalar MCPs ----
echo ""
echo "🔌 Instalando MCPs globais..."

if command -v claude &> /dev/null; then
  echo "   Instalando Context7 (documentação atualizada)..."
  claude mcp add context7 --scope user -- npx -y @upstash/context7-mcp@latest 2>/dev/null && \
    echo "   ✅ Context7" || echo "   ⚠️  Context7 — falhou (instalar manualmente)"

  echo "   Instalando Playwright (testes e2e e automação)..."
  claude mcp add playwright --scope user -- npx -y @playwright/mcp@latest 2>/dev/null && \
    echo "   ✅ Playwright" || echo "   ⚠️  Playwright — falhou (instalar manualmente)"

  echo "   Instalando Prisma MCP..."
  claude mcp add prisma --scope user -- npx -y prisma mcp 2>/dev/null && \
    echo "   ✅ Prisma" || echo "   ⚠️  Prisma — falhou (instalar manualmente)"
else
  echo "   ⚠️  Claude CLI não encontrado. Instale MCPs manualmente:"
  echo "      claude mcp add context7 --scope user -- npx -y @upstash/context7-mcp@latest"
  echo "      claude mcp add playwright --scope user -- npx -y @playwright/mcp@latest"
  echo "      claude mcp add prisma --scope user -- npx -y prisma mcp"
fi

# ---- Resumo ----
echo ""
echo "╔══════════════════════════════════════════════════╗"
echo "║  ✅ Setup concluído!                             ║"
echo "╚══════════════════════════════════════════════════╝"
echo ""
echo "📂 Arquivos instalados em: $CLAUDE_DIR/"
echo ""
echo "Subagentes disponíveis:"
echo "  🏗️  architect        — Arquitetura de software e estrutura de projeto"
echo "  ⚙️  backend-dev      — Implementação de backend NestJS"
echo "  🎨 frontend-dev     — Implementação de frontend React"
echo "  📄 landing-page     — Landing pages de alta conversão"
echo "  🧪 qa-tester        — Testes automatizados (unit, integration, e2e)"
echo "  🔒 security-auditor — Auditoria de segurança e vulnerabilidades"
echo "  👀 code-reviewer    — Code review automatizado"
echo "  🗄️  db-specialist    — Modelagem de dados e otimização de queries"
echo "  🚀 devops           — Docker, CI/CD e infraestrutura"
echo "  💡 feature-ideator  — Ideias de features e análise de produto"
echo "  📱 mobile-dev       — Apps mobile com React Native / Expo"
echo "  ✍️  ad-copywriter    — Copy para ads (Meta/Google/TikTok)"
echo "  🎬 video-scripter   — Roteiros de vídeo para anúncios"
echo "  🎨 ad-creative      — Conceitos visuais e briefs de criativos"
echo "  📊 marketing-strat  — Estratégia completa de marketing"
echo ""
echo "Skills disponíveis (slash commands):"
echo "  /prospecting       — Prospecção e qualificação de leads"
echo "  /idea-validator    — Validação de ideias de produto"
echo "  /qa-suite          — Suite completa de QA (testes, lint, build, audit)"
echo "  /pentest           — Teste de penetração de segurança"
echo "  /api-scaffold      — Gerador de scaffold de módulo NestJS"
echo "  /landing-gen       — Gerador de landing page"
echo "  /light-copy        — Copy conversacional (método Light Copy)"
echo "  /funnel-strategy   — Funis de venda (framework Brunson)"
echo "  /hormozi-offer     — Ofertas irresistíveis (framework Hormozi)"
echo "  /trend-scanner     — Scanner de tendências de marketing digital"
echo ""
echo "MCPs globais:"
echo "  📚 Context7        — Docs atualizadas de qualquer lib"
echo "  🎭 Playwright      — Testes e2e e automação de browser"
echo "  💎 Prisma          — Schema e assistência de queries"
echo ""
echo "Para usar dev containers em um projeto:"
echo "  cp -r $SCRIPT_DIR/devcontainer-template/ seu-projeto/.devcontainer/"
echo ""
echo "Para começar:"
echo "  cd seu-projeto && claude"
echo ""
