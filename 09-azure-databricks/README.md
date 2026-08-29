# Azure Databricks Labs and Teaching Guides

This section organizes workshop-ready material for Azure Databricks across data engineering, governance, analytics, AI, MLOps, and interoperability with Microsoft Fabric.

The emphasis is on **teaching flow and architectural understanding**: what to build, why each component matters, where common implementation mistakes occur, and how the pattern changes for enterprise environments.

## Lab tracks

1. **Lakehouse and medallion architecture** — Bronze, Silver, Gold, Delta Lake, incremental processing, data quality and orchestration.
2. **Unity Catalog governance** — catalogs, schemas, external locations, managed storage, permissions, lineage and governed data products.
3. **AI/BI and conversational analytics** — semantic context, natural-language analytics, governed SQL access and business-facing experiences.
4. **GenAI and agentic applications** — vector search, retrieval patterns, model endpoints, tool use and governed enterprise grounding.
5. **MLOps** — feature engineering, experiment tracking, model lifecycle, registry, serving, monitoring and CI/CD.
6. **DevOps and Asset Bundles** — repeatable deployments, environment promotion and source-controlled workspace assets.
7. **Fabric + Databricks interoperability** — OneLake shortcuts, open Delta/Parquet patterns, governance boundaries and when to use each platform.

## Suggested workshop sequence

### Module 1 — Build the Lakehouse
- Ingest a raw operational dataset.
- Land immutable Bronze data.
- Standardize and validate Silver tables.
- Produce Gold business aggregates.
- Discuss schema evolution, late-arriving data and data quality.

### Module 2 — Govern with Unity Catalog
- Create governed catalogs and schemas.
- Separate engineering, analytics and consumer access.
- Apply least-privilege permissions.
- Trace lineage from ingestion through serving.
- Discuss external locations, managed storage and cross-workspace governance.

### Module 3 — Add AI/BI
- Expose governed business tables through SQL Warehouses.
- Design business-friendly descriptions and semantic context.
- Compare dashboard-driven BI with conversational BI.
- Add guardrails for ambiguous business terminology.

### Module 4 — Operationalize AI
- Create embeddings for a governed corpus.
- Build retrieval over approved enterprise content.
- Serve a model or agent endpoint.
- Capture evaluation, observability and governance considerations.

### Module 5 — Productionize
- Package jobs and resources using Databricks Asset Bundles.
- Promote configurations between dev/test/prod.
- Add CI/CD and automated validation.

## Reference implementations used for comparison and extension

These upstream repositories are useful references and remain owned by their original maintainers:

- [databricks/azure-databricks-demos](https://github.com/databricks/azure-databricks-demos)
- [databricks/bundle-examples](https://github.com/databricks/bundle-examples)
- [databricks/unity-catalog-setup](https://github.com/databricks/unity-catalog-setup)
- [databricks/terraform-databricks-lakehouse-blueprints](https://github.com/databricks/terraform-databricks-lakehouse-blueprints)
- [microsoft/databricks-mlops-workshop](https://github.com/microsoft/databricks-mlops-workshop)

## Teaching extensions

For each upstream lab, the useful exercise is not merely to run the sample. A workshop should ask participants to explain the architecture, change one design assumption, add governance, and evaluate how the solution behaves when scaled or promoted to production.
