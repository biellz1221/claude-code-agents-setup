# NestJS Rules

## Module Structure
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
- Always inject via constructor
- Use providers for services, repositories, adapters
- Exports for services that other modules need
- Global modules sparingly (ConfigModule, PrismaModule, LoggerModule)

## Controllers
- Responsibility: receive request → call service → return response
- ZERO business logic in the controller
- Swagger decorators on every endpoint
- Global ValidationPipe in main.ts

## Services
- Responsibility: business logic
- Inject PrismaService for database access
- Throw NestJS exceptions (NotFoundException, BadRequestException, etc.)
- Transactions for multi-table operations

## Error Handling
- Global ExceptionFilter to standardize error responses
- Typed NestJS exceptions (no generic throw new Error)
- Log full error on the server
- Client response without stack trace

## Config
- Use @nestjs/config with ConfigService
- Never use process.env directly in code
- Validate env vars at bootstrap with Joi or class-validator
