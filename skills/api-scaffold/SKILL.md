---
name: API Scaffold Generator
description: Generate complete NestJS module scaffold with CRUD, DTOs, Prisma, pagination, soft delete
argument-hint: "entity_name, [optional: with_pagination, with_soft_delete, with_search]"
allowed-tools: bash, grep
---

# API Scaffold Generator Skill

## Overview
Generates production-ready NestJS module scaffolds with:
- Full CRUD operations
- Data Transfer Objects (DTOs) with validation
- Prisma ORM integration
- Swagger API documentation
- Pagination support
- Soft delete functionality
- Search/filtering
- Comprehensive tests

## What Gets Generated

For an entity like `Product`, you'll get:
```
src/
├── modules/
│   └── product/
│       ├── product.module.ts
│       ├── product.controller.ts
│       ├── product.service.ts
│       ├── dto/
│       │   ├── create-product.dto.ts
│       │   ├── update-product.dto.ts
│       │   └── query-product.dto.ts
│       ├── entities/
│       │   └── product.entity.ts
│       ├── tests/
│       │   ├── product.service.spec.ts
│       │   └── product.controller.spec.ts
│       └── interfaces/
│           └── product-response.interface.ts
```

## Prerequisites

Ensure your NestJS project has:
```bash
npm install @nestjs/common @nestjs/core @nestjs/swagger
npm install @prisma/client prisma
npm install class-validator class-transformer
npm install @nestjs/mapped-types
```

## Step-by-Step Generation

### Step 1: Create Entity Definition

**File: `src/prisma/schema.prisma`**

Add your entity model:
```prisma
model Product {
  id        Int     @id @default(autoincrement())
  name      String  @unique
  slug      String  @unique
  description String?
  price     Float
  stock     Int     @default(0)
  category  String?

  // Metadata
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt
  deletedAt DateTime? // For soft delete

  // Relations (example)
  reviews   Review[]

  @@map("products")
}

model Review {
  id        Int     @id @default(autoincrement())
  content   String
  rating    Int     @default(5)
  productId Int
  product   Product @relation(fields: [productId], references: [id], onDelete: Cascade)

  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt

  @@map("reviews")
}
```

Run migration:
```bash
npx prisma migrate dev --name add_product
npx prisma generate
```

---

### Step 2: Create Entity Class

**File: `src/modules/product/entities/product.entity.ts`**

```typescript
import { ApiProperty } from '@nestjs/swagger';

export class ProductEntity {
  @ApiProperty({ example: 1, description: 'Product ID' })
  id: number;

  @ApiProperty({ example: 'MacBook Pro', description: 'Product name' })
  name: string;

  @ApiProperty({ example: 'macbook-pro', description: 'URL slug' })
  slug: string;

  @ApiProperty({
    example: 'High-performance laptop for professionals',
    description: 'Product description',
    required: false
  })
  description?: string;

  @ApiProperty({ example: 1299.99, description: 'Product price' })
  price: number;

  @ApiProperty({ example: 50, description: 'Stock quantity' })
  stock: number;

  @ApiProperty({ example: 'Electronics', description: 'Product category' })
  category?: string;

  @ApiProperty({ description: 'Creation timestamp' })
  createdAt: Date;

  @ApiProperty({ description: 'Last update timestamp' })
  updatedAt: Date;

  @ApiProperty({
    description: 'Soft delete timestamp',
    required: false
  })
  deletedAt?: Date | null;
}
```

---

### Step 3: Create DTOs

**File: `src/modules/product/dto/create-product.dto.ts`**

```typescript
import { ApiProperty } from '@nestjs/swagger';
import {
  IsString,
  IsNumber,
  IsOptional,
  MinLength,
  MaxLength,
  Min,
  IsSlug,
} from 'class-validator';

export class CreateProductDto {
  @ApiProperty({ example: 'MacBook Pro' })
  @IsString()
  @MinLength(3)
  @MaxLength(100)
  name: string;

  @ApiProperty({ example: 'macbook-pro' })
  @IsSlug()
  slug: string;

  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  @MaxLength(1000)
  description?: string;

  @ApiProperty({ example: 1299.99 })
  @IsNumber()
  @Min(0)
  price: number;

  @ApiProperty({ example: 50, required: false })
  @IsOptional()
  @IsNumber()
  @Min(0)
  stock?: number;

  @ApiProperty({ required: false })
  @IsOptional()
  @IsString()
  @MaxLength(50)
  category?: string;
}
```

**File: `src/modules/product/dto/update-product.dto.ts`**

```typescript
import { PartialType } from '@nestjs/mapped-types';
import { CreateProductDto } from './create-product.dto';

export class UpdateProductDto extends PartialType(CreateProductDto) {}
```

**File: `src/modules/product/dto/query-product.dto.ts`**

```typescript
import { ApiProperty } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import { IsOptional, IsInt, Min, Max, IsString } from 'class-validator';

export class QueryProductDto {
  @ApiProperty({
    description: 'Page number (1-indexed)',
    example: 1,
    required: false,
  })
  @IsOptional()
  @Type(() => Number)
  @IsInt()
  @Min(1)
  page?: number = 1;

  @ApiProperty({
    description: 'Items per page',
    example: 10,
    required: false,
  })
  @IsOptional()
  @Type(() => Number)
  @IsInt()
  @Min(1)
  @Max(100)
  limit?: number = 10;

  @ApiProperty({
    description: 'Search by name or description',
    required: false,
  })
  @IsOptional()
  @IsString()
  search?: string;

  @ApiProperty({
    description: 'Filter by category',
    required: false,
  })
  @IsOptional()
  @IsString()
  category?: string;

  @ApiProperty({
    description: 'Sort field (name, price, createdAt)',
    required: false,
  })
  @IsOptional()
  @IsString()
  sortBy?: string = 'createdAt';

  @ApiProperty({
    description: 'Sort order (asc, desc)',
    required: false,
  })
  @IsOptional()
  @IsString()
  order?: 'asc' | 'desc' = 'desc';
}
```

---

### Step 4: Create Service

**File: `src/modules/product/product.service.ts`**

```typescript
import {
  Injectable,
  NotFoundException,
  BadRequestException,
} from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { CreateProductDto } from './dto/create-product.dto';
import { UpdateProductDto } from './dto/update-product.dto';
import { QueryProductDto } from './dto/query-product.dto';
import { ProductEntity } from './entities/product.entity';

@Injectable()
export class ProductService {
  constructor(private readonly prisma: PrismaService) {}

  async create(createProductDto: CreateProductDto): Promise<ProductEntity> {
    return this.prisma.product.create({
      data: createProductDto,
    });
  }

  async findAll(query: QueryProductDto) {
    const {
      page = 1,
      limit = 10,
      search,
      category,
      sortBy = 'createdAt',
      order = 'desc',
    } = query;

    // Validate pagination
    if (page < 1 || limit < 1 || limit > 100) {
      throw new BadRequestException('Invalid pagination parameters');
    }

    const skip = (page - 1) * limit;

    // Build filter
    const where: any = {
      deletedAt: null, // Soft delete filter
    };

    if (search) {
      where.OR = [
        { name: { contains: search, mode: 'insensitive' } },
        { description: { contains: search, mode: 'insensitive' } },
      ];
    }

    if (category) {
      where.category = category;
    }

    // Get total count for pagination
    const total = await this.prisma.product.count({ where });

    // Get paginated results
    const data = await this.prisma.product.findMany({
      where,
      skip,
      take: limit,
      orderBy: {
        [sortBy]: order,
      },
    });

    return {
      data,
      pagination: {
        page,
        limit,
        total,
        pages: Math.ceil(total / limit),
      },
    };
  }

  async findOne(id: number): Promise<ProductEntity> {
    const product = await this.prisma.product.findUnique({
      where: { id },
    });

    if (!product) {
      throw new NotFoundException(`Product with ID ${id} not found`);
    }

    if (product.deletedAt) {
      throw new NotFoundException(`Product with ID ${id} not found`);
    }

    return product;
  }

  async update(
    id: number,
    updateProductDto: UpdateProductDto,
  ): Promise<ProductEntity> {
    // Check existence
    await this.findOne(id);

    return this.prisma.product.update({
      where: { id },
      data: updateProductDto,
    });
  }

  async remove(id: number): Promise<ProductEntity> {
    // Check existence
    await this.findOne(id);

    // Soft delete
    return this.prisma.product.update({
      where: { id },
      data: { deletedAt: new Date() },
    });
  }

  async hardDelete(id: number): Promise<ProductEntity> {
    // Check existence
    await this.findOne(id);

    // Hard delete
    return this.prisma.product.delete({
      where: { id },
    });
  }

  async restore(id: number): Promise<ProductEntity> {
    const product = await this.prisma.product.findUnique({
      where: { id },
    });

    if (!product) {
      throw new NotFoundException(`Product with ID ${id} not found`);
    }

    return this.prisma.product.update({
      where: { id },
      data: { deletedAt: null },
    });
  }
}
```

---

### Step 5: Create Controller

**File: `src/modules/product/product.controller.ts`**

```typescript
import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Delete,
  Param,
  ParseIntPipe,
  Query,
  HttpCode,
  HttpStatus,
} from '@nestjs/common';
import {
  ApiTags,
  ApiOperation,
  ApiResponse,
  ApiParam,
  ApiQuery,
} from '@nestjs/swagger';
import { ProductService } from './product.service';
import { CreateProductDto } from './dto/create-product.dto';
import { UpdateProductDto } from './dto/update-product.dto';
import { QueryProductDto } from './dto/query-product.dto';
import { ProductEntity } from './entities/product.entity';

@ApiTags('Products')
@Controller('products')
export class ProductController {
  constructor(private readonly productService: ProductService) {}

  @Post()
  @HttpCode(HttpStatus.CREATED)
  @ApiOperation({ summary: 'Create a new product' })
  @ApiResponse({
    status: 201,
    description: 'Product created successfully',
    type: ProductEntity,
  })
  @ApiResponse({ status: 400, description: 'Invalid input' })
  create(@Body() createProductDto: CreateProductDto) {
    return this.productService.create(createProductDto);
  }

  @Get()
  @ApiOperation({ summary: 'Get all products with pagination and filtering' })
  @ApiQuery({ name: 'page', required: false, type: Number })
  @ApiQuery({ name: 'limit', required: false, type: Number })
  @ApiQuery({ name: 'search', required: false, type: String })
  @ApiQuery({ name: 'category', required: false, type: String })
  @ApiQuery({ name: 'sortBy', required: false, type: String })
  @ApiQuery({ name: 'order', required: false, type: String })
  @ApiResponse({
    status: 200,
    description: 'Products retrieved successfully',
  })
  findAll(@Query() query: QueryProductDto) {
    return this.productService.findAll(query);
  }

  @Get(':id')
  @ApiOperation({ summary: 'Get a product by ID' })
  @ApiParam({ name: 'id', type: Number, description: 'Product ID' })
  @ApiResponse({
    status: 200,
    description: 'Product found',
    type: ProductEntity,
  })
  @ApiResponse({ status: 404, description: 'Product not found' })
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.productService.findOne(id);
  }

  @Patch(':id')
  @ApiOperation({ summary: 'Update a product' })
  @ApiParam({ name: 'id', type: Number })
  @ApiResponse({
    status: 200,
    description: 'Product updated successfully',
    type: ProductEntity,
  })
  @ApiResponse({ status: 404, description: 'Product not found' })
  update(
    @Param('id', ParseIntPipe) id: number,
    @Body() updateProductDto: UpdateProductDto,
  ) {
    return this.productService.update(id, updateProductDto);
  }

  @Delete(':id')
  @HttpCode(HttpStatus.OK)
  @ApiOperation({ summary: 'Soft delete a product' })
  @ApiParam({ name: 'id', type: Number })
  @ApiResponse({ status: 200, description: 'Product deleted successfully' })
  @ApiResponse({ status: 404, description: 'Product not found' })
  remove(@Param('id', ParseIntPipe) id: number) {
    return this.productService.remove(id);
  }

  @Patch(':id/restore')
  @ApiOperation({ summary: 'Restore a soft-deleted product' })
  @ApiParam({ name: 'id', type: Number })
  @ApiResponse({
    status: 200,
    description: 'Product restored successfully',
    type: ProductEntity,
  })
  restore(@Param('id', ParseIntPipe) id: number) {
    return this.productService.restore(id);
  }
}
```

---

### Step 6: Create Module

**File: `src/modules/product/product.module.ts`**

```typescript
import { Module } from '@nestjs/common';
import { ProductService } from './product.service';
import { ProductController } from './product.controller';
import { PrismaService } from 'src/prisma/prisma.service';

@Module({
  controllers: [ProductController],
  providers: [ProductService, PrismaService],
  exports: [ProductService],
})
export class ProductModule {}
```

---

### Step 7: Create Tests

**File: `src/modules/product/product.service.spec.ts`**

```typescript
import { Test, TestingModule } from '@nestjs/testing';
import { NotFoundException } from '@nestjs/common';
import { ProductService } from './product.service';
import { PrismaService } from 'src/prisma/prisma.service';

describe('ProductService', () => {
  let service: ProductService;
  let prisma: PrismaService;

  const mockProduct = {
    id: 1,
    name: 'Test Product',
    slug: 'test-product',
    description: 'A test product',
    price: 99.99,
    stock: 10,
    category: 'Test',
    createdAt: new Date(),
    updatedAt: new Date(),
    deletedAt: null,
  };

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        ProductService,
        {
          provide: PrismaService,
          useValue: {
            product: {
              create: jest.fn(),
              findMany: jest.fn(),
              findUnique: jest.fn(),
              update: jest.fn(),
              delete: jest.fn(),
              count: jest.fn(),
            },
          },
        },
      ],
    }).compile();

    service = module.get<ProductService>(ProductService);
    prisma = module.get<PrismaService>(PrismaService);
  });

  describe('create', () => {
    it('should create a product', async () => {
      jest.spyOn(prisma.product, 'create').mockResolvedValue(mockProduct);

      const result = await service.create({
        name: 'Test Product',
        slug: 'test-product',
        price: 99.99,
      });

      expect(result).toEqual(mockProduct);
      expect(prisma.product.create).toHaveBeenCalledWith({
        data: expect.any(Object),
      });
    });
  });

  describe('findOne', () => {
    it('should return a product by id', async () => {
      jest.spyOn(prisma.product, 'findUnique').mockResolvedValue(mockProduct);

      const result = await service.findOne(1);

      expect(result).toEqual(mockProduct);
    });

    it('should throw NotFoundException if product does not exist', async () => {
      jest.spyOn(prisma.product, 'findUnique').mockResolvedValue(null);

      expect(service.findOne(999)).rejects.toThrow(NotFoundException);
    });
  });

  describe('remove', () => {
    it('should soft delete a product', async () => {
      jest.spyOn(prisma.product, 'findUnique').mockResolvedValue(mockProduct);
      jest.spyOn(prisma.product, 'update').mockResolvedValue({
        ...mockProduct,
        deletedAt: new Date(),
      });

      const result = await service.remove(1);

      expect(result.deletedAt).not.toBeNull();
      expect(prisma.product.update).toHaveBeenCalled();
    });
  });
});
```

**File: `src/modules/product/product.controller.spec.ts`**

```typescript
import { Test, TestingModule } from '@nestjs/testing';
import { ProductController } from './product.controller';
import { ProductService } from './product.service';

describe('ProductController', () => {
  let controller: ProductController;
  let service: ProductService;

  const mockProduct = {
    id: 1,
    name: 'Test Product',
    slug: 'test-product',
    price: 99.99,
  };

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [ProductController],
      providers: [
        {
          provide: ProductService,
          useValue: {
            create: jest.fn().mockResolvedValue(mockProduct),
            findAll: jest.fn(),
            findOne: jest.fn().mockResolvedValue(mockProduct),
            update: jest.fn(),
            remove: jest.fn(),
          },
        },
      ],
    }).compile();

    controller = module.get<ProductController>(ProductController);
    service = module.get<ProductService>(ProductService);
  });

  describe('create', () => {
    it('should create a product', async () => {
      const dto = {
        name: 'Test Product',
        slug: 'test-product',
        price: 99.99,
      };

      const result = await controller.create(dto);

      expect(result).toEqual(mockProduct);
      expect(service.create).toHaveBeenCalledWith(dto);
    });
  });

  describe('findOne', () => {
    it('should return a product', async () => {
      const result = await controller.findOne(1);

      expect(result).toEqual(mockProduct);
      expect(service.findOne).toHaveBeenCalledWith(1);
    });
  });
});
```

---

## Step 8: Register Module in App

**File: `src/app.module.ts`**

```typescript
import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaModule } from './prisma/prisma.module';
import { ProductModule } from './modules/product/product.module';
// Import other modules here

@Module({
  imports: [
    PrismaModule,
    ProductModule,
    // Add other modules
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
```

---

## Step 9: Build & Test

```bash
# Run build to check for TypeScript errors
npm run build

# Run tests
npm run test

# Run tests with coverage
npm run test:cov

# Start development server
npm run start:dev

# Test endpoints with curl
curl -X GET http://localhost:3000/products
curl -X POST http://localhost:3000/products \
  -H "Content-Type: application/json" \
  -d '{"name":"Test","slug":"test","price":99.99}'
```

---

## Generated Module Checklist

- [ ] Entity added to Prisma schema
- [ ] Database migration created and ran
- [ ] Entity class created with Swagger annotations
- [ ] DTOs created (Create, Update, Query)
- [ ] Service created with full CRUD + soft delete
- [ ] Controller created with all endpoints
- [ ] Swagger decorators applied
- [ ] Module created and added to AppModule
- [ ] Unit tests written and passing
- [ ] Build succeeds without errors
- [ ] Endpoints tested manually
- [ ] Pagination working correctly
- [ ] Soft delete/restore working
- [ ] Search/filtering functional
- [ ] API documentation generated

## API Endpoints Summary

```
POST   /products              Create product
GET    /products              List with pagination/filter
GET    /products/:id          Get one
PATCH  /products/:id          Update
DELETE /products/:id          Soft delete
PATCH  /products/:id/restore  Restore from soft delete
```

## Query Parameters Example

```
GET /products?page=1&limit=20&search=macbook&category=electronics&sortBy=price&order=asc
```

## Response Format

```json
{
  "data": [...],
  "pagination": {
    "page": 1,
    "limit": 20,
    "total": 150,
    "pages": 8
  }
}
```

## Tips for Solo Developers

1. **Copy/Paste friendly**: Use this as a template for all new entities
2. **Consistency**: Same pattern across all modules = easier maintenance
3. **Testing**: Tests included = safer refactoring
4. **Documentation**: Swagger included = better API contracts
5. **Database**: Prisma migrations = version-controlled schema
6. **Soft delete**: Built-in = safer data handling
7. **Pagination**: Out of the box = scales from day one

---

**Next Steps**: After generation, customize validation rules, add business logic to service, and expand with additional features like image uploads, relationships, or caching.
