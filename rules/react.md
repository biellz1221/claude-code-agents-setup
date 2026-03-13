# React Rules

## Componentes
- Sempre funcionais (nunca classes)
- Props tipadas com interface
- Default export para páginas, named export para componentes
- Separar lógica em custom hooks
- Máximo ~150 linhas por componente — extrair se passar

## State Management
- Server state: TanStack Query (useQuery, useMutation)
- Client state simples: useState, useReducer
- Client state global: Zustand (quando necessário)
- Context: apenas para temas, auth, i18n (valores que mudam pouco)
- NUNCA prop drilling > 2 níveis

## Data Fetching
- TanStack Query para TODA comunicação com API
- staleTime adequado (5min para dados que mudam pouco)
- Invalidação de cache após mutations
- Optimistic updates para UX mais fluida
- Error boundaries para capturar erros de render

## Hooks
- Prefixo `use` para custom hooks
- Um hook por arquivo
- Hooks não devem ter side effects diretos (usar useEffect)
- Regras de hooks: só no top level, nunca condicional

## Estilização
- Tailwind CSS (nunca CSS-in-JS ou CSS modules)
- Mobile-first: começar sem prefix, adicionar sm:, md:, lg:
- cn() (clsx + tailwind-merge) para classes condicionais
- Extrair componente quando classes > 5-6 utility classes

## Performance
- React.memo para componentes puros que re-renderizam muito
- useMemo/useCallback com moderação (só quando mediu o problema)
- Lazy loading para rotas e componentes pesados
- Virtualização para listas longas (> 100 items)
- Image optimization (next/image ou lazy loading)

## Acessibilidade (a11y)
- Semantic HTML (header, main, nav, article, button, etc.)
- Labels em todos os inputs
- Alt text em imagens
- Navegação por teclado funcional
- Contraste adequado (WCAG AA mínimo)
- aria-* quando semantic HTML não é suficiente
