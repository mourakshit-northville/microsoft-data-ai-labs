# Azure SQL & SQL Server

This section covers Azure SQL Database, SQL Server, SQL Server on Azure VM, migration, performance, DevOps, AI integration, vector search, and data-platform modernization patterns.

## Lab ideas

### Azure SQL + AI
- Store business data in Azure SQL Database.
- Add vector-enabled or AI-assisted retrieval patterns where appropriate.
- Combine deterministic SQL filtering with semantic retrieval.
- Keep transactional truth in SQL while using AI for interpretation or discovery.

### SQL Server to Azure modernization
- Assess compatibility and workload characteristics.
- Compare Azure SQL Database, Managed Instance, and SQL Server on Azure VM.
- Document dependencies, HA/DR, security, and operational ownership.
- Build a migration validation checklist covering performance and application behavior.

### SQL DevOps
- Put database schema under source control.
- Validate changes in CI.
- Deploy through environment-aware pipelines.
- Separate schema deployment from sensitive configuration and secrets.

## Architecture questions

- Does the workload need instance-level SQL Server features?
- Which platform minimizes operational burden without forcing redesign?
- How should HA/DR targets map to the selected Azure service?
- Where can vector search or AI improve retrieval without replacing relational integrity?

## Upstream references

- [microsoft/sql-server-samples](https://github.com/microsoft/sql-server-samples)
- [Azure-Samples/azure-sql-db-samples](https://github.com/Azure-Samples/azure-sql-db-samples)
- [Azure-Samples/SQL-AI-samples](https://github.com/Azure-Samples/SQL-AI-samples)
- [Azure-Samples/azure-sql-db-openai](https://github.com/Azure-Samples/azure-sql-db-openai)
- [Azure-Samples/azure-sql-db-vector-search](https://github.com/Azure-Samples/azure-sql-db-vector-search)
- [Azure-Samples/sql-projects-devops-samples](https://github.com/Azure-Samples/sql-projects-devops-samples)
- [Azure-Samples/awesome-azure-sql](https://github.com/Azure-Samples/awesome-azure-sql)
