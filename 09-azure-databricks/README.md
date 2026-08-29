# Azure Databricks Labs

This section contains original, workshop-ready Azure Databricks demos covering medallion architecture, Unity Catalog governance and conversational analytics.

## Lab 1: Medallion pipeline

Folder: [`lab01-medallion`](lab01-medallion/)

### Components

- `01_bronze_ingest.py` — incremental Auto Loader ingestion into a Bronze Delta table.
- `02_silver_transform.py` — standardization, validation, deduplication and data-quality tagging.
- `03_gold_metrics.sql` — Gold daily sales metrics for analytical consumption.

### Teaching goals

- Explain why Bronze preserves source fidelity.
- Show where data-quality decisions should be made.
- Compare overwrite, append and merge patterns.
- Discuss schema evolution and replayability.
- Connect Gold design to downstream BI and conversational analytics.

## Lab 2: Unity Catalog governance

File: [`lab02-unity-catalog/setup.sql`](lab02-unity-catalog/setup.sql)

This lab builds a simple governance model around engineering and analytical personas. Learners create the catalog/schema hierarchy, apply group-based permissions and then solve least-privilege challenges.

## Lab 3: AI/BI conversational analytics

File: [`lab03-ai-bi-genie/INSTRUCTOR_GUIDE.md`](lab03-ai-bi-genie/INSTRUCTOR_GUIDE.md)

This exercise starts with business definitions before conversational analytics. Learners test ambiguous questions, validate answers against SQL and classify failures as semantic, data-quality or language problems.

## Workshop sequence

1. Ingest orders into Bronze.
2. Standardize and validate them in Silver.
3. Publish business metrics in Gold.
4. Apply Unity Catalog permissions.
5. Expose only approved business objects to analytical consumers.
6. Test natural-language questions against governed metric definitions.

## Design discussions

- When should a pipeline use streaming versus batch semantics?
- Which data-quality failures should block a row versus mark it for review?
- Why is a business glossary necessary even when table names are clear?
- How should engineering, BI and AI consumers receive different access?
- What changes when the same solution must move from development into production?

## Next extensions

Planned additions include Asset Bundle deployment, model lifecycle/MLOps, Vector Search and a governed agent lab built on the same sales domain.
