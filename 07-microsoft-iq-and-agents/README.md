# Microsoft IQ & Agents

Microsoft IQ brings together complementary intelligence layers so Copilot and agents can reason with business, workplace, authoritative-document, and web context.

## Current Microsoft IQ model

- **Fabric IQ** — business entities, relationships, metrics, analytical and operational state.
- **Work IQ** — workplace context from Microsoft 365, including people, collaboration, files, conversations, and workflows.
- **Foundry IQ** — authoritative enterprise knowledge and policy/document context for agents.
- **Web IQ** — relevant web context.

The architectural goal is not to put every source into one database. It is to ground an agent in the right governed context for the question and action.

## Lab idea: grounded enterprise agent

1. Start with a business question that requires both structured data and organizational context.
2. Use Fabric IQ for business entities and current business state.
3. Use Work IQ when the task requires permission-aware Microsoft 365 context.
4. Use Foundry/agent tooling for orchestration and reasoning.
5. Keep system-of-record actions behind explicit tools and authorization.
6. Log evidence, tool calls, and final decisions for evaluation.

## Agent design checklist

- Define the business goal before selecting the model.
- Separate retrieval/context from action tools.
- Preserve source-system permissions.
- Use deterministic rules for policy boundaries.
- Evaluate groundedness, tool selection, latency, and failure behavior.
- Add human approval for high-impact actions.

## MCP and tool-oriented integration

Model Context Protocol (MCP) can provide a standardized tool/context boundary for agentic applications. In Microsoft data scenarios, the important design concern is not MCP by itself but the governance around what each exposed tool can read or change.

## Upstream references

- [Microsoft IQ documentation](https://learn.microsoft.com/microsoft-iq/)
- [Azure-Samples/get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Azure-Samples/Foundry_Toolkit_Samples](https://github.com/Azure-Samples/Foundry_Toolkit_Samples)
- [Azure-Samples/ai-foundry-agents-samples](https://github.com/Azure-Samples/ai-foundry-agents-samples)
- [Azure-Samples/sharepoint-foundryIQ-secure-sync](https://github.com/Azure-Samples/sharepoint-foundryIQ-secure-sync)
- [microsoft/fabric-rti-mcp](https://github.com/microsoft/fabric-rti-mcp)
