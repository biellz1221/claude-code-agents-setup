# TypeScript Rules

## Strict Mode
- `"strict": true` in tsconfig.json — required
- `"noUncheckedIndexedAccess": true` — prevents undefined in arrays/objects
- `"noImplicitReturns": true` — every branch returns a value

## Types
- Never use `any` — use `unknown` when type is unknown
- Narrow with type guards: `if ('prop' in obj)`, `instanceof`, discriminated unions
- Prefer `interface` for objects (extensible) and `type` for unions
- Generics when logic is reusable with different types
- Utility types: `Partial<T>`, `Pick<T, K>`, `Omit<T, K>`, `Required<T>`

## Async
- Always `async/await` (never `.then()`)
- Handle errors with try/catch or `.catch()` on every async call
- Promise.all for independent parallel operations
- Promise.allSettled when all results are needed even with failures

## Functions
- Explicitly type parameters and return type on exported functions
- Arrow functions for callbacks and short functions
- Named function (declaration) for module/export functions
- Max 50 lines per function — extract if exceeded

## Enums vs Union Types
- Prefer union types for string values: `type Status = 'active' | 'inactive'`
- Use const enum or `as const` to avoid runtime overhead
- Prisma enums are OK (auto-generated)
