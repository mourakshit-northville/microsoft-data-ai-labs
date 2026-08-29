# OneLake & Lakehouse

This section focuses on the data foundation of Microsoft Fabric: OneLake, Lakehouse, Delta tables, shortcuts, medallion-style organization, governance, and reuse across workloads.

## Core pattern

**Source systems → ingestion → Bronze → Silver → Gold → semantic/operational consumption**

The architecture should minimize unnecessary copies while preserving clear ownership, quality controls, and lineage.

## Lab ideas

### OneLake shortcut lab
- Create or identify an external/adjacent data source.
- Create a OneLake shortcut rather than physically copying the data.
- Query the shortcut from Fabric.
- Compare ownership, refresh, and governance implications with a copied-data approach.

### Lakehouse engineering lab
- Land raw data in Files or Bronze tables.
- Apply schema and data-quality transformations.
- Publish curated Delta tables.
- Register business-ready tables for downstream analytics.
- Validate consumption through SQL endpoint and Power BI.

### Incremental processing lab
- Identify a watermark/change-tracking strategy.
- Process only new or changed data.
- Handle late-arriving records and reprocessing.
- Capture operational metadata for auditability.

## Architecture questions

- When should data be copied versus referenced through shortcuts?
- What belongs in Lakehouse versus Warehouse?
- How should partitioning and file size be managed?
- Which transformations should be reusable across workloads?
- How should security and lineage flow across OneLake?

## Upstream references

- [microsoft/fabric-samples](https://github.com/microsoft/fabric-samples)
- [microsoft/fabric-toolbox](https://github.com/microsoft/fabric-toolbox)
- [Microsoft Fabric documentation](https://learn.microsoft.com/fabric/)
