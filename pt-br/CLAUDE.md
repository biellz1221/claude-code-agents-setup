# Instruções Globais — Gabriel (Dev Solo)

## Sobre Mim
Sou um desenvolvedor solo que mantém múltiplos projetos em paralelo.
Meu tempo é meu recurso mais escasso. Prefiro soluções pragmáticas que funcionam.
Código precisa ser limpo, testado e fácil de manter por uma pessoa só.

## Stack Principal
- **Runtime:** Node.js 20+ com TypeScript strict
- **Backend:** NestJS + Prisma + PostgreSQL
- **Frontend:** React 18+ (Next.js ou Vite) + Tailwind CSS
- **Testes:** Jest (unit/integration) + Playwright (e2e)
- **ORM:** Prisma com migrations versionadas
- **Package Manager:** pnpm (preferência) ou npm
- **Infra:** Docker + Docker Compose
- **CI/CD:** GitHub Actions
- **Hosting:** Adaptar conforme projeto (Vercel, Railway, Fly.io, etc.)

## Convenções de Código

### TypeScript
- Strict mode sempre (`"strict": true` no tsconfig)
- Nunca usar `any` — usar `unknown` e narrow com type guards
- Preferir interfaces para objetos, types para unions/intersections
- Indentação: 2 espaços
- Aspas simples
- Ponto e vírgula obrigatório
- async/await sempre (nunca .then chains)
- Funções puras quando possível
- Máximo 50 linhas por função
- Máximo 300 linhas por arquivo

### Naming
- Variáveis e funções: camelCase em inglês
- Classes e interfaces: PascalCase
- Constantes: UPPER_SNAKE_CASE
- Arquivos: kebab-case
- Comentários de lógica complexa em português (pt-BR)

### Git
- Branches: `feature/descricao`, `fix/descricao`, `chore/descricao`
- Commits: Conventional Commits (`feat:`, `fix:`, `chore:`, `docs:`, `test:`, `refactor:`)
- Mensagens de commit em inglês
- Sempre rodar testes antes de commit
- Nunca push direto na main
- PRs com descrição clara do que muda e por quê

## Verificação Obrigatória (antes de qualquer commit)
```bash
npm test          # todos os testes passando
npm run lint      # zero erros
npm run build     # compilação sem erros
npx tsc --noEmit  # type check (se não estiver no build)
```

## Arquivos Protegidos
Estes arquivos NUNCA devem ser modificados automaticamente sem confirmação:
- `.env`, `.env.*` (variáveis de ambiente)
- `prisma/migrations/**` (migrations já aplicadas)
- `docker-compose.prod.yml`
- Qualquer arquivo com credenciais ou secrets
- `package-lock.json` / `pnpm-lock.yaml` (só via install)

## Padrões NestJS
- Module → Controller → Service → Repository
- DTOs com class-validator para TODA entrada de dados
- Guards para autenticação/autorização (JWT)
- Interceptors para logging e transformação de resposta
- Exception filters para tratamento padronizado de erros
- Swagger decorators em TODOS os endpoints
- ConfigService para configurações (nunca process.env direto)

## Padrões React
- Componentes funcionais com hooks (nunca classes)
- Custom hooks para lógica reutilizável
- TanStack Query para server state
- Zustand para client state (quando necessário)
- Tailwind CSS (nunca CSS-in-JS ou CSS modules)
- Mobile-first responsivo
- Loading + Error + Empty states em toda view assíncrona

## Padrões Prisma
- IDs com cuid() ou uuid()
- createdAt e updatedAt em TODA tabela
- deletedAt para soft delete
- Índices para campos usados em WHERE e ORDER BY
- Relations com onDelete explícito
- Enums para campos com valores fixos
- @@map para nomes de tabela em snake_case

## Modo Semi-Autônomo — Quando Pedir Confirmação
PEDIR CONFIRMAÇÃO antes de:
- Rodar migrations de banco (`prisma migrate`)
- Instalar dependências novas (`npm install <nova-lib>`)
- Fazer git push
- Modificar configs de CI/CD
- Deletar arquivos ou dados
- Modificar variáveis de ambiente
- Fazer qualquer operação irreversível

PODE EXECUTAR LIVREMENTE:
- Criar/editar arquivos de código
- Rodar testes
- Rodar lint e formatação
- Rodar build
- Git add, commit, diff, log, status
- Ler qualquer arquivo do projeto

## Comunicação
- Responder em português (pt-BR) a menos que eu peça em outro idioma
- Ser direto e pragmático
- Se tiver dúvida, perguntar antes de assumir
- Explicar decisões de arquitetura brevemente (o "por quê")
- Não precisa pedir desculpa por erros, só corrigir
