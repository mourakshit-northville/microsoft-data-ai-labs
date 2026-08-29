# Lab: Microsoft Fabric + Azure Databricks Interoperability

## Objective
Design a governed architecture in which Microsoft Fabric and Azure Databricks coexist without unnecessary duplication of data or overlapping platform responsibilities.

## Scenario
An enterprise already uses Azure Databricks for data engineering and AI but wants Fabric for business-facing analytics, OneLake integration, Power BI, Real-Time Intelligence and Fabric Data Agents.

## Design exercise

Evaluate these patterns:

- Databricks produces governed Delta data products; Fabric consumes selected assets through supported integration patterns.
- Fabric owns downstream semantic models and Power BI experiences.
- Real-time operational signals are handled in Fabric RTI while historical transformation remains in Databricks.
- AI workloads are assigned to the platform that best matches governance, model, latency and developer requirements.

## Workshop tasks

1. Draw the source-to-consumption architecture.
2. Identify every physical copy of data and challenge whether it is necessary.
3. Mark governance boundaries between Unity Catalog, OneLake/Fabric and Microsoft Purview.
4. Decide where semantic context belongs.
5. Define which users work primarily in each platform.
6. Add an agentic analytics scenario consuming governed data from both ecosystems.

## Questions for participants

- When is a shortcut or open-table access preferable to ingestion?
- Which platform should own the business semantic layer?
- Where do duplicated pipelines create operational risk?
- How do identity and permissions behave across platform boundaries?
- Which workload characteristics justify using both platforms?

## Reference

Microsoft's [Unified Data Foundation with Fabric solution accelerator](https://github.com/microsoft/unified-data-foundation-with-fabric-solution-accelerator) is a useful reference architecture because it includes Fabric, OneLake, Purview and Azure Databricks integration. This lab focuses on the architecture decisions and trade-offs rather than reproducing the accelerator.
