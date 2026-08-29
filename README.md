# Microsoft Data & AI Labs

Hands-on architecture notes, lab guides, workshop-ready teaching material, and community demo patterns across Microsoft Fabric, Azure Databricks, Real-Time Intelligence, Fabric IQ, OneLake, Power BI, Azure SQL, SQL Server, Microsoft IQ, Copilot, Data Agents, and AI Foundry.

> This repository is a curated technical portfolio. Original notes, architecture exercises, teaching guides, and lab extensions are maintained here; Microsoft, Databricks, Azure, and community sample repositories are linked and attributed rather than presented as original work.

## Focus areas

| Area | Topics |
|---|---|
| Microsoft Fabric | OneLake, Lakehouse, Warehouse, Data Engineering, Data Factory, governance |
| Real-Time Intelligence | Eventstreams, Eventhouse, KQL, real-time dashboards, event-driven patterns |
| Fabric IQ | Ontology, business entities, semantic context, operational intelligence |
| Fabric Copilot & Data Agents | Notebook Copilot, Warehouse Copilot, Power BI Copilot, Data Agent, MCP, governed conversational analytics |
| Azure Databricks | Lakehouse, Delta, Unity Catalog, AI/BI, MLOps, Asset Bundles, Terraform, GenAI and platform interoperability |
| Power BI | Semantic models, Direct Lake, DAX, embedded/developer patterns |
| Azure SQL | Azure SQL Database, vector search, AI integration, REST endpoints, DevOps |
| SQL Server | SQL Server architecture, performance, migration, Azure VM patterns |
| Microsoft IQ | Fabric IQ, Work IQ, Foundry IQ, agent grounding and enterprise context |
| AI & Agents | Azure AI Foundry, agents, MCP, RAG, SQL + AI patterns |

## Repository map

- [01-fabric-real-time-intelligence](01-fabric-real-time-intelligence/README.md)
- [02-fabric-iq](02-fabric-iq/README.md)
- [03-onelake-lakehouse](03-onelake-lakehouse/README.md)
- [04-fabric-warehouse](04-fabric-warehouse/README.md)
- [05-power-bi](05-power-bi/README.md)
- [06-azure-sql-sql-server](06-azure-sql-sql-server/README.md)
- [07-microsoft-iq-and-agents](07-microsoft-iq-and-agents/README.md)
- [08-reference-samples](08-reference-samples/README.md)
- [09-azure-databricks](09-azure-databricks/README.md)
- [10-fabric-copilot-data-agents](10-fabric-copilot-data-agents/README.md)

## Workshop portfolio approach

The repository is structured around reusable workshop design rather than isolated snippets. Each area is intended to show four things:

1. **Architecture** — what the components are and how they fit together.
2. **Hands-on flow** — a sequence that can be demonstrated or taught.
3. **Decision points** — governance, security, scale, operations and platform trade-offs.
4. **Extensions** — challenges that move a learner beyond following prescribed steps.

When an external sample is useful, this repository points to the upstream source and explains what to learn, change, validate, or extend. This preserves attribution while making the portfolio useful as teaching and solution-design material.

## Selected upstream reference repositories

### Microsoft Fabric and Power BI
- [microsoft/fabric-samples](https://github.com/microsoft/fabric-samples)
- [microsoft/FabricRTIWorkshop](https://github.com/microsoft/FabricRTIWorkshop)
- [microsoft/FabConRTIWorkshop](https://github.com/microsoft/FabConRTIWorkshop)
- [microsoft/Fabric-IQ-and-Real-Time-Intelligence-assets](https://github.com/microsoft/Fabric-IQ-and-Real-Time-Intelligence-assets)
- [microsoft/real-time-intelligence-operations-solution-accelerator](https://github.com/microsoft/real-time-intelligence-operations-solution-accelerator)
- [microsoft/fabric-toolbox](https://github.com/microsoft/fabric-toolbox)
- [microsoft/unified-data-foundation-with-fabric-solution-accelerator](https://github.com/microsoft/unified-data-foundation-with-fabric-solution-accelerator)
- [microsoft/PowerBI-Developer-Samples](https://github.com/microsoft/PowerBI-Developer-Samples)

### Azure Databricks
- [databricks/azure-databricks-demos](https://github.com/databricks/azure-databricks-demos)
- [databricks/bundle-examples](https://github.com/databricks/bundle-examples)
- [databricks/unity-catalog-setup](https://github.com/databricks/unity-catalog-setup)
- [databricks/terraform-databricks-lakehouse-blueprints](https://github.com/databricks/terraform-databricks-lakehouse-blueprints)
- [microsoft/databricks-mlops-workshop](https://github.com/microsoft/databricks-mlops-workshop)

### SQL and AI
- [microsoft/sql-server-samples](https://github.com/microsoft/sql-server-samples)
- [Azure-Samples/SQL-AI-samples](https://github.com/Azure-Samples/SQL-AI-samples)
- [Azure-Samples/azure-sql-db-vector-search](https://github.com/Azure-Samples/azure-sql-db-vector-search)
- [Azure-Samples/Foundry_Toolkit_Samples](https://github.com/Azure-Samples/Foundry_Toolkit_Samples)
- [Azure-Samples/ai-foundry-agents-samples](https://github.com/Azure-Samples/ai-foundry-agents-samples)

## Notes on attribution

External repositories remain owned and maintained by their original authors. Links here are references for learning, comparison, architecture analysis, and extension. Any imported or adapted code should retain the applicable upstream license and attribution.
