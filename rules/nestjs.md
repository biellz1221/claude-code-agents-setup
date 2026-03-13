# NestJS Rules

## Estrutura de Módulos
```
src/
├── app.module.ts          # Root module
├── main.ts                # Bootstrap
├── common/                # Shared utilities
│   ├── decorators/        # Custom decorators
│   ├── filters/           # Exception filters
│   ├── guards/            # Auth guards
│   ├── interceptors/      # Logging, transform
│   ├── pipes/             # Validation pipes
│   └── dto/               # Shared DTOs (pagination, etc.)
├── config/                # ConfigModule setup
├── prisma/                # PrismaService
├── auth/                  # Auth module
└── [feature]/             # Feature modules
    ├── [feature].module.ts
    ├── [feature].controller.ts
    ├── [feature].service.ts
    ├── [feature].controller.spec.ts
    ├── [feature].service.spec.ts
    ├── dto/
    └── entities/
```

## Dependency Injection
- Sempre injetar via constructor
- Usar providers para services, repositories, adapters
- Exports para services que outros módulos precisam
- Global modules com moderação (ConfigModule, PrismaModule, LoggerModule)

## Controllers
- Responsabilidade: receber request → chamar service → retornar response
- ZERO lógica de negócio no controller
- Swagger decorators em cada endpoint
- ValidationPipe global no main.ts

## Services
- Responsabilidade: lógica de negócio
- Injetar PrismaService para acesso ao banco
- Lançar exceções do NestJS (NotFoundException, BadRequestException, etc.)
- Transações para operações multi-tabela

## Error Handling
- Global ExceptionFilter para padronizar responses de erro
- Exceções tipadas do NestJS (não throw new Error genérico)
- Log do erro completo no servidor
- Response pro cliente sem stack trace

## Config
- Usar @nestjs/config com ConfigService
- Nunca process.env direto no código
- Validar env vars no bootstrap com Joi ou class-validator
