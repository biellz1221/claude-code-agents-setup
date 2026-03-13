---
name: qa-suite
description: Executa suite completa de qualidade no projeto atual — testes, lint, type-check, build, cobertura e audit de segurança. Gera relatório consolidado. Use quando pedirem para rodar QA, verificar qualidade, validar o projeto ou checar se tá tudo ok.
allowed-tools: Bash, Read, Grep, Glob, Write
---

# Suite de QA Completa

Execute todas as verificações de qualidade do projeto atual e gere um relatório consolidado.

## Verificações (executar em ordem)

### 1. Detecção do Projeto
Primeiro, identifique o tipo de projeto:
```bash
# Verificar package.json
cat package.json | jq '{name, scripts: .scripts | keys}'
```
Adaptar comandos conforme os scripts disponíveis.

### 2. TypeScript Type Check
```bash
npx tsc --noEmit 2>&1
echo "EXIT_CODE: $?"
```
- Reportar: número de erros de tipagem
- Listar os 10 primeiros erros (se houver)

### 3. Linting
```bash
# Tentar eslint primeiro, depois biome
npm run lint 2>&1 || npx eslint . --ext .ts,.tsx 2>&1
echo "EXIT_CODE: $?"
```
- Reportar: erros vs warnings
- Listar erros (warnings são informativos)

### 4. Testes Unitários
```bash
npm test -- --coverage --verbose --forceExit 2>&1
echo "EXIT_CODE: $?"
```
- Reportar: passed/failed/skipped
- Reportar: cobertura (statements, branches, functions, lines)
- Listar testes falhando com mensagem de erro

### 5. Build
```bash
npm run build 2>&1
echo "EXIT_CODE: $?"
```
- Reportar: sucesso ou falha
- Listar erros de compilação (se houver)

### 6. Audit de Segurança
```bash
npm audit --json 2>&1 | jq '{
  total: .metadata.totalDependencies,
  vulnerabilities: .metadata.vulnerabilities
}'
```
- Reportar: critical, high, moderate, low

### 7. Dependências Desatualizadas
```bash
npx npm-check-updates --format group 2>&1 | head -50
```
- Reportar: major, minor, patch updates disponíveis

### 8. Tamanho do Bundle (se aplicável)
```bash
# Para projetos com build
if [ -d "dist" ]; then
  du -sh dist/
  find dist -name "*.js" -exec du -sh {} \; | sort -rh | head -10
fi
```

## Relatório Final

Gerar `qa-report.md` na raiz do projeto:

```markdown
# QA Report — [nome do projeto]
Data: [timestamp]

## Resumo

| Check | Status | Detalhes |
|-------|--------|----------|
| TypeScript | ✅/❌ | X erros |
| Lint | ✅/❌ | X erros, Y warnings |
| Testes | ✅/❌ | X passed, Y failed, Z skipped |
| Cobertura | ✅/⚠️/❌ | X% statements |
| Build | ✅/❌ | — |
| Security | ✅/⚠️/❌ | X vulnerabilidades |

## Score de Qualidade: X/100

### Cálculo:
- TypeScript sem erros: +20
- Lint sem erros: +15
- Todos os testes passando: +25
- Cobertura >= 80%: +15 (>= 60%: +10, >= 40%: +5)
- Build sem erros: +15
- Zero vulnerabilidades critical/high: +10

## Detalhes dos Problemas
[listar cada problema com arquivo, linha e sugestão de fix]

## Ações Recomendadas (priorizadas)
1. 🚨 [Critical] ...
2. ⚠️ [Warning] ...
3. ℹ️ [Info] ...
```

## Regras
- SEMPRE executar TODOS os checks, mesmo que um falhe
- Capturar exit codes para determinar sucesso/falha
- Se um comando não existe (ex: `npm run lint` não definido), reportar como "N/A"
- O score é calculado OBJETIVAMENTE — sem arredondamentos generosos
- Ser direto nas recomendações — dev solo precisa saber o que priorizar
