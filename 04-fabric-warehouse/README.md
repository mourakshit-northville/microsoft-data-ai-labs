# Fabric Warehouse

This section covers Microsoft Fabric Warehouse design, SQL analytics, dimensional modeling, performance, security, and integration with Power BI and OneLake.

## Design pattern

A Fabric Warehouse is a strong fit when the serving layer benefits from relational modeling, T-SQL, dimensional structures, governed BI consumption, and familiar SQL engineering practices.

## Lab ideas

### Dimensional warehouse lab
- Create fact and dimension tables.
- Load curated data from upstream Fabric pipelines or Lakehouse outputs.
- Apply surrogate key and slowly-changing-dimension patterns where appropriate.
- Build a Power BI semantic model over the warehouse.

### SQL performance lab
- Compare filtering, aggregation, and join patterns.
- Review query plans and execution behavior.
- Test modeling choices that reduce unnecessary data movement.

### Warehouse + OneLake lab
- Show how Warehouse fits inside the broader OneLake architecture.
- Compare a Warehouse table with a Lakehouse Delta table for the same analytical use case.
- Document when relational semantics improve maintainability.

## Architecture questions

- Which data products should be modeled relationally?
- Where should business transformations be implemented?
- Which dimensions are conformed across subject areas?
- When is Direct Lake appropriate for the semantic model?
- How should row/object permissions align with BI consumption?

## Upstream references

- [Microsoft Fabric samples](https://github.com/microsoft/fabric-samples)
- [Microsoft Fabric documentation](https://learn.microsoft.com/fabric/)
