# SQL Engineering Workshop Track

A hands-on SQL portfolio covering SQL Server, Azure SQL Database, Microsoft Fabric Warehouse, Fabric SQL endpoints, ELT/pipeline SQL, performance engineering, data quality, security, and AI-ready SQL patterns.

## Why this track exists

SQL is used here as a first-class engineering language, not just for ad-hoc querying. The labs are structured around schema design, ingestion, transformation, orchestration, validation, observability, and serving.

## Workshop modules

1. SQL Server engineering foundations
2. Azure SQL transactional and analytical patterns
3. Fabric Warehouse and SQL endpoint development
4. ELT pipeline SQL and incremental loading
5. Data quality and reconciliation
6. Performance tuning and troubleshooting
7. Security, row-level access, and least privilege
8. SQL for AI, vectors, and governed data agents

## Labs

- `lab01-sql-server-core/` — schema, procedures, error handling, transactions
- `lab02-incremental-elt/` — watermark-driven incremental loads and MERGE patterns
- `lab03-fabric-warehouse/` — dimensional model, CTAS, transformations and serving queries
- `lab04-fabric-sql-endpoint/` — read-optimized SQL endpoint analytics
- `lab05-data-quality/` — reusable validation checks and reconciliation SQL
- `lab06-performance/` — execution plans, Query Store and indexing patterns
- `lab07-security/` — roles, schemas, row-level security and masking patterns
- `lab08-sql-ai/` — vector-search-ready schema and AI-safe query patterns

## Teaching approach

Each lab includes an implementation artifact plus discussion prompts on design trade-offs, failure modes, production concerns, and how the same concept changes across SQL Server, Azure SQL, and Fabric.