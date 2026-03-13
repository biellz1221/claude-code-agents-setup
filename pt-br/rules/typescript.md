# TypeScript Rules

## Strict Mode
- `"strict": true` no tsconfig.json — obrigatório
- `"noUncheckedIndexedAccess": true` — previne undefined em arrays/objects
- `"noImplicitReturns": true` — toda branch retorna valor

## Tipos
- Nunca usar `any` — usar `unknown` quando tipo é desconhecido
- Narrow com type guards: `if ('prop' in obj)`, `instanceof`, discriminated unions
- Preferir `interface` para objetos (extensível) e `type` para unions
- Generics quando lógica é reutilizável com tipos diferentes
- Utility types: `Partial<T>`, `Pick<T, K>`, `Omit<T, K>`, `Required<T>`

## Async
- Sempre `async/await` (nunca `.then()`)
- Tratar erros com try/catch ou `.catch()` em cada chamada assíncrona
- Promise.all para operações paralelas independentes
- Promise.allSettled quando precisa de todos os resultados mesmo com falhas

## Funções
- Tipar parâmetros e retorno explicitamente em funções exportadas
- Arrow functions para callbacks e funções curtas
- Função nomeada (declaration) para funções de módulo/export
- Máximo 50 linhas por função — extrair se passar

## Enums vs Union Types
- Preferir union types para valores string: `type Status = 'active' | 'inactive'`
- Usar const enum ou `as const` para evitar runtime overhead
- Enum do Prisma é OK (gerado automaticamente)
