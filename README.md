# Microsoft Data & AI Labs

A hands-on technical portfolio covering Microsoft Fabric, Azure Databricks, Real-Time Intelligence, OneLake, Fabric Warehouse, Power BI, Azure SQL, SQL Server, Copilot, Data Agents and enterprise Agentic AI patterns.

The emphasis here is on **original runnable demos, lab code, architecture exercises and instructor-ready material** rather than collections of external sample repositories.

## Programming languages demonstrated

- **SQL / T-SQL** — SQL Server, Azure SQL Database, Fabric Warehouse, Fabric SQL endpoint analytics, ELT, reconciliation, performance, security and AI-ready schemas
- **Python / PySpark** — Fabric and Azure Databricks ingestion, transformation, telemetry generation, agent orchestration and AI workflows

## What is actually built in this repository

| Area | Original artifact |
|---|---|
| Fabric Real-Time Intelligence | Synthetic manufacturing telemetry generator, KQL operational queries and instructor guide |
| Fabric Lakehouse / OneLake | PySpark Bronze → Silver → Gold medallion notebook |
| Fabric Warehouse | Retail star-schema DDL and analytical SQL |
| Power BI | Direct Lake-oriented DAX measure set and teaching exercise |
| Azure SQL / SQL Server | Performance diagnostics, T-SQL engineering patterns, security and transactional examples |
| SQL Engineering | SQL Server procedures, Fabric SQL endpoint queries, incremental ELT, data quality, Fabric Warehouse, RLS, performance and SQL+AI patterns |
| Enterprise context & agents | Business entity/context design exercise with governance boundaries |
| Azure Databricks | Auto Loader Bronze ingestion, Silver data-quality transformation, Gold Databricks SQL metrics, Unity Catalog governance lab |
| Databricks AI/BI | Conversational analytics instructor guide and semantic ambiguity exercises |
| Fabric Data Agents | Agent evaluation dataset covering analytics, ambiguity, causality and action safety |
| Agentic AI | Safe tool contracts, agentic RAG, multi-agent orchestration, evaluation, threat modeling, event-driven agents, governed SQL agents and MCP workshops |

## Repository map

- [01 - Fabric Real-Time Intelligence](01-fabric-real-time-intelligence/README.md)
- [02 - Fabric IQ](02-fabric-iq/README.md)
- [03 - OneLake and Lakehouse](03-onelake-lakehouse/README.md)
- [04 - Fabric Warehouse](04-fabric-warehouse/README.md)
- [05 - Power BI](05-power-bi/README.md)
- [06 - Azure SQL and SQL Server](06-azure-sql-sql-server/README.md)
- [07 - Microsoft IQ and Agents](07-microsoft-iq-and-agents/README.md)
- [09 - Azure Databricks](09-azure-databricks/README.md)
- [10 - Fabric Copilot and Data Agents](10-fabric-copilot-data-agents/README.md)
- [11 - Agentic AI Workshop Series](11-agentic-ai-workshops/README.md)
- [12 - SQL Engineering Workshops](12-sql-engineering-workshops/README.md)

## Featured hands-on labs

### SQL Engineering Workshop Track

`12-sql-engineering-workshops/`

A dedicated SQL evidence track covering:

- SQL Server schema design, constraints, indexing and stored procedures
- transactional error handling and idempotent service patterns
- watermark-based incremental ELT and merge/upsert patterns
- Fabric Warehouse dimensional modeling and serving views
- Fabric SQL endpoint analytical SQL with window functions
- source-to-target reconciliation and data quality checks
- SQL Server / Azure SQL performance diagnostics
- role-based access and row-level security
- SQL + AI retrieval schema design and safe data-agent access patterns

### Manufacturing operations with Fabric RTI

`01-fabric-real-time-intelligence/lab01-manufacturing-telemetry/`

A synthetic plant telemetry stream models stamping presses and assembly robots. The lab progresses from event generation to Eventhouse/KQL analysis and operational health monitoring.

### Sales Lakehouse medallion pipeline

`03-onelake-lakehouse/lab01-medallion/notebook.py`

A compact Fabric PySpark lab that lands raw orders, performs quality and deduplication in Silver, then publishes daily sales metrics in Gold.

### Azure Databricks medallion pipeline

`09-azure-databricks/lab01-medallion/`

A Databricks-native version using Auto Loader, Delta tables, data-quality logic and Databricks SQL. The goal is to teach both implementation and platform design choices.

### Unity Catalog governance

`09-azure-databricks/lab02-unity-catalog/setup.sql`

A role-oriented governance exercise that separates engineering and analytical access and gives learners permission-model challenges to solve.

### Conversational analytics

`09-azure-databricks/lab03-ai-bi-genie/INSTRUCTOR_GUIDE.md`

A teaching guide centered on business definitions, ambiguous questions, expected SQL results and semantic quality rather than prompt memorization.

### Fabric Data Agent evaluation

`10-fabric-copilot-data-agents/lab01-agent-evaluation/test_questions.json`

A reusable test set for evaluating whether a data agent handles metric questions, ambiguous language, unsupported causal claims and prohibited operational actions correctly.

### Agentic AI Workshop Series

`11-agentic-ai-workshops/`

A connected set of original workshops covering safe tool use, agentic RAG, multi-agent orchestration, evaluation, observability, governance, prompt injection, event-driven agents, governed SQL data agents and MCP. The same manufacturing scenario is reused across labs so the material can be delivered as individual conference sessions or combined into a full-day workshop.

The folder also includes a reusable session catalog with abstracts for future community and conference submissions.

## How I structure workshops

Each lab is designed around four layers:

1. **Build** — create something concrete with SQL, KQL, Python, PySpark or DAX.
2. **Explain** — connect each artifact to the architecture and the product capability it represents.
3. **Challenge** — give learners a change that forces them to reason instead of follow steps mechanically.
4. **Operate** — discuss governance, security, observability, cost, deployment and production trade-offs.

## Portfolio note

The implementation files in this repository are purpose-built for this portfolio and workshop use. Product documentation and external repositories may be consulted as technical references, but third-party source trees are not copied into this repository or presented as original work.
