# Microsoft Data & AI Labs

A hands-on technical portfolio centered on Microsoft Fabric and Real-Time Intelligence, with supporting work across OneLake, Lakehouse, Fabric Warehouse, Power BI, Azure SQL, SQL Server, Copilot, Fabric IQ, Data Agents and enterprise Agentic AI patterns.

The emphasis here is on **original runnable demos, lab code, architecture exercises and instructor-ready material**.

## Programming languages demonstrated

- **SQL / T-SQL** — SQL Server, Azure SQL Database, Fabric Warehouse, Fabric SQL endpoint analytics, ELT, reconciliation, performance, security and AI-ready schemas
- **Python / PySpark** — Fabric ingestion, transformation, telemetry generation, agent orchestration and AI workflows

## What is actually built in this repository

| Area | Original artifact |
|---|---|
| Fabric Real-Time Intelligence | Synthetic manufacturing telemetry generator, KQL operational queries and instructor guide |
| Fabric Lakehouse / OneLake | PySpark Bronze → Silver → Gold medallion notebook |
| Fabric Warehouse | Retail star-schema DDL and analytical SQL |
| Power BI | Direct Lake-oriented DAX measure set and teaching exercise |
| Azure SQL / SQL Server | Performance diagnostics, T-SQL engineering patterns, security and transactional examples |
| SQL Engineering | SQL Server procedures, Fabric SQL endpoint queries, incremental ELT, data quality, Fabric Warehouse, RLS, performance and SQL + AI patterns |
| Fabric IQ and enterprise context | Business entity and ontology design exercises with governance boundaries |
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
- [10 - Fabric Copilot and Data Agents](10-fabric-copilot-data-agents/README.md)
- [11 - Agentic AI Workshop Series](11-agentic-ai-workshops/README.md)
- [12 - SQL Engineering Workshops](12-sql-engineering-workshops/README.md)

## Featured hands-on labs

### Microsoft Fabric Real-Time Intelligence

`01-fabric-real-time-intelligence/lab01-manufacturing-telemetry/`

A synthetic plant telemetry stream models stamping presses and assembly robots. The lab progresses from event generation to Eventstream/Eventhouse patterns, KQL analysis, operational monitoring and real-time decisioning.

### Microsoft Fabric Lakehouse medallion pipeline

`03-onelake-lakehouse/lab01-medallion/notebook.py`

A Fabric PySpark lab that lands raw orders, performs quality and deduplication in Silver, then publishes daily sales metrics in Gold.

### Microsoft Fabric Data Agent evaluation

`10-fabric-copilot-data-agents/lab01-agent-evaluation/test_questions.json`

A reusable test set for evaluating whether a Fabric Data Agent handles metric questions, ambiguous language, unsupported causal claims and prohibited operational actions correctly.

### SQL Engineering Workshop Track

`12-sql-engineering-workshops/`

A dedicated SQL evidence track covering SQL Server schema design, stored procedures, Fabric Warehouse dimensional modeling, Fabric SQL endpoint analytics, incremental ELT, reconciliation, security, performance and SQL + AI patterns.

### Agentic AI Workshop Series

`11-agentic-ai-workshops/`

A connected set of original workshops covering safe tool use, agentic RAG, multi-agent orchestration, evaluation, observability, governance, prompt injection, event-driven agents, governed SQL data agents and MCP. The material is designed so it can be delivered as individual community sessions or combined into a full-day workshop.

## How I structure workshops

Each lab is designed around four layers:

1. **Build** — create something concrete with SQL, KQL, Python, PySpark or DAX.
2. **Explain** — connect each artifact to the architecture and the Microsoft capability it represents.
3. **Challenge** — give learners a change that forces them to reason instead of follow steps mechanically.
4. **Operate** — discuss governance, security, observability, cost, deployment and production trade-offs.

## Portfolio note

The implementation files in this repository are purpose-built for this portfolio and workshop use, with a deliberate focus on Microsoft data, analytics and AI technologies.
