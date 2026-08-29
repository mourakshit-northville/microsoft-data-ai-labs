# Lab: Design a Governed Fabric Data Agent

## Objective
Create a workshop exercise that demonstrates how a Fabric Data Agent should be grounded, governed and tested before it is exposed to business users.

## Scenario
A manufacturing leadership team wants to ask natural-language questions across sales, inventory and operational telemetry. The data spans a Warehouse, a Lakehouse and a KQL database.

## Lab flow

1. Identify the questions the agent should answer.
2. Select only the minimum required Fabric data sources.
3. Improve table and column descriptions before adding prompt instructions.
4. Add domain instructions for ambiguous terms such as revenue, backlog and active customer.
5. Create representative example questions.
6. Test questions with obvious answers first.
7. Test deliberately ambiguous questions.
8. Record failure modes and decide whether they require metadata, semantic-model or instruction changes.
9. Publish the agent only after the test set is stable.
10. Evaluate how the same agent could be consumed from Power BI, Microsoft 365 Copilot or an external MCP-capable application.

## Instructor discussion

The central lesson is that a conversational interface does not remove the need for data modeling. Better metadata, governed sources, business definitions and test cases generally matter more than increasingly elaborate prompts.

## Evaluation checklist

- Does the answer use an approved source?
- Does terminology match the business definition?
- Can the user trace the answer back to governed data?
- Does the agent refuse or avoid unsupported questions appropriately?
- Would a semantic model or ontology provide better context?
- Are permissions enforced consistently for every consuming experience?

## Extension

Add an ontology-backed source and compare the behavior of entity-oriented questions before and after the ontology is available.
