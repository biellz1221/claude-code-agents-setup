ARG NODE_VERSION=20

FROM node:${NODE_VERSION}-bookworm

ARG PNPM_VERSION=9

# System dependencies
RUN apt-get update && apt-get install -y \
  git \
  procps \
  sudo \
  jq \
  vim \
  curl \
  unzip \
  && rm -rf /var/lib/apt/lists/*

# Install pnpm
RUN corepack enable && corepack prepare pnpm@${PNPM_VERSION} --activate

# Install Claude Code CLI
RUN npm install -g @anthropic-ai/claude-code@latest

# Install Playwright system dependencies (for e2e tests)
RUN npx playwright install-deps chromium 2>/dev/null || true

# Non-root user setup (node user already exists in node image)
RUN mkdir -p /workspace && chown -R node:node /workspace /home/node

# Allow node user to install global packages
RUN mkdir -p /home/node/.npm-global && chown -R node:node /home/node/.npm-global
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=/home/node/.npm-global/bin:$PATH

USER node
WORKDIR /workspace
ENV DEVCONTAINER=true
