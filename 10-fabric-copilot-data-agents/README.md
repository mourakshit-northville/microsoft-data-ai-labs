# Microsoft Fabric Copilot, Data Agents and AI-Assisted Analytics

This section collects workshop-ready material around AI-assisted development and conversational analytics in Microsoft Fabric.

## Topics

- Copilot in Fabric notebooks for code generation, refactoring, validation and troubleshooting
- Copilot-assisted SQL in Fabric Warehouse
- Copilot experiences in Power BI
- Fabric Data Agent over Lakehouse, Warehouse, semantic models, KQL databases and ontology-backed data
- Programmatic Data Agent workflows through the Fabric Data Agent SDK
- MCP-based consumption of published Fabric Data Agents
- Agent grounding, governance and enterprise context
- Fabric IQ, Work IQ and Foundry IQ relationship patterns
- Prompt design for analytics and developer workflows

## Workshop pattern

A strong teaching flow is to start with the same business question and solve it four ways:

1. traditional SQL or notebook code
2. Copilot-assisted development
3. a semantic/BI experience
4. a governed Fabric Data Agent

Participants can then compare speed, transparency, repeatability, governance and suitability for different personas.

## Suggested demos

### Demo 1 — Notebook Copilot
Use an attached Lakehouse and ask Copilot to profile data, generate transformations, explain a join, identify a data-quality issue and refactor the notebook. The learning objective is not just code generation; it is understanding how workspace, schema and runtime context influence AI-assisted development.

### Demo 2 — Warehouse Copilot
Start from a business question, generate SQL, inspect the query, improve it manually and compare the generated result with a governed semantic definition.

### Demo 3 — Fabric Data Agent
Connect approved Fabric data sources, add domain-specific instructions and example questions, publish the agent and test ambiguous business questions. Include a discussion of where semantic descriptions and ontology improve response quality.

### Demo 4 — Data Agent as MCP server
Publish a data agent and consume it from an external agent or application through its MCP endpoint. Discuss authentication, authorization, data permissions and why the agent remains read-only and governed.

## Current Microsoft references

- [Fabric Copilot feature state](https://github.com/MicrosoftDocs/fabric-docs/blob/main/docs/fundamentals/copilot-ai-feature-state.md)
- [Fabric Data Agent SDK](https://github.com/MicrosoftDocs/fabric-docs/blob/main/docs/data-science/fabric-data-agent-sdk.md)
- [Create a Fabric Data Agent](https://github.com/MicrosoftDocs/fabric-docs/blob/main/docs/data-science/how-to-create-data-agent.md)
- [Copilot for Fabric notebooks](https://github.com/MicrosoftDocs/fabric-docs/blob/main/docs/data-engineering/copilot-notebooks-overview.md)
- [microsoft/fabric-toolbox Data Agent utilities](https://github.com/microsoft/fabric-toolbox/tree/main/samples/data_agent_checklist_notebooks)

These links are upstream references. The teaching flow and exercises in this section are portfolio material designed around those capabilities.
