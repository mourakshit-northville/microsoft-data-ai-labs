# Agentic AI Workshop Series

This section contains original workshop material for designing, building, evaluating, governing, and operating enterprise AI agents.

The series is designed for technical community sessions, internal enablement, conference workshops, and architecture discussions. Each module emphasizes **how to reason about an agentic system**, not just how to call an SDK.

## Workshop tracks

1. **Agent Foundations** — goals, tools, memory, planning, control loops, failure modes.
2. **RAG + Agentic Retrieval** — when retrieval should be deterministic, adaptive, or delegated to tools.
3. **Tool-Using Agents** — safe function calling, schema contracts, validation, retries, and idempotency.
4. **Multi-Agent Systems** — coordinator/worker patterns, specialist agents, handoffs, shared state, and anti-patterns.
5. **MCP and Enterprise Tooling** — exposing governed tools and data sources to agents through MCP.
6. **Data Agents** — natural-language access to SQL, Lakehouse, Warehouse, KQL, and semantic models.
7. **Event-Driven Agents** — combining real-time events with deterministic rules and agentic reasoning.
8. **Evaluation and Observability** — groundedness, task completion, tool-use accuracy, latency, cost, and safety.
9. **Governance and Security** — identity, least privilege, data boundaries, prompt injection, and human approval.
10. **Production Architecture** — environment promotion, versioning, tracing, rollback, budget controls, and operational ownership.

## Suggested delivery formats

### 60-minute conference session
- 10 min: agent architecture mental model
- 15 min: tool-use demo
- 15 min: RAG + agentic retrieval
- 10 min: governance and failure modes
- 10 min: evaluation checklist

### 2-hour workshop
- Module 1: build a single tool-using agent
- Module 2: add retrieval and memory
- Module 3: add evaluation and guardrails
- Module 4: extend to multi-agent or event-driven architecture

### Full-day workshop
- Morning: foundations, tools, RAG, memory, evaluation
- Afternoon: multi-agent systems, MCP, enterprise data, governance, productionization

## Scenario used across labs

The workshop uses a manufacturing operations scenario with these entities:

- Plant
- ProductionLine
- Asset
- WorkOrder
- SensorReading
- MaintenanceTicket
- Supplier
- Shipment

This keeps the labs connected while allowing the same architecture to be adapted to finance, healthcare, retail, or customer service.

## Design principle

The strongest enterprise agent is not the one with the most autonomy. It is the one with the **right amount of autonomy, explicit tool boundaries, reliable data access, measurable outcomes, and clear human ownership**.
