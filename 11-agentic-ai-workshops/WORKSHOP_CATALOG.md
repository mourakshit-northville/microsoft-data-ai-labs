# Agentic AI Session and Workshop Catalog

These abstracts are designed so the material in this repository can be reused for community events, user groups, conference submissions, internal enablement, or full workshops.

## 1. Designing Enterprise AI Agents That Can Actually Be Trusted

**Format:** 60 minutes

AI agents become useful when they can retrieve data, call tools, make decisions, and participate in business workflows. That also makes them harder to govern. This session presents a practical architecture for separating model reasoning from enterprise control. It covers tool contracts, retrieval boundaries, human approval, identity, least privilege, prompt injection, evaluation, observability, and production guardrails using a manufacturing operations scenario.

## 2. Agentic RAG Beyond Vector Search

**Format:** 60–90 minutes

Not every business question should be answered through vector search. Some require SQL, some require documents, some require real-time telemetry, and some require clarification before retrieval begins. This workshop builds a retrieval router and shows how to combine structured and unstructured evidence while preserving source approval, metadata filtering, and grounding.

## 3. Multi-Agent Systems Without Multi-Agent Chaos

**Format:** 60 minutes

This session separates real multi-agent architecture from demos that simply create many chatbots. It explains specialization boundaries, coordinator/worker patterns, evidence contracts, conflict resolution, partial failure, cost-aware delegation, shared state, and completion conditions.

## 4. Building Event-Driven AI Agents with Microsoft Fabric RTI

**Format:** 90 minutes

Use Fabric Real-Time Intelligence to detect operational conditions and invoke agentic reasoning only when it adds value. The session connects Eventstream, Eventhouse/KQL, deterministic event policies, incident correlation, Data Agents, and human approval patterns.

## 5. Governed Data Agents over Fabric and Databricks

**Format:** 90–120 minutes

Build conversational data experiences over Lakehouse, Warehouse, SQL, KQL, and governed Databricks data. The workshop compares semantic context, SQL generation, read-only enforcement, approved-table scopes, ambiguity handling, evaluation questions, and enterprise governance.

## 6. MCP for Data and AI Architects

**Format:** 60–90 minutes

A practical architecture session on using MCP to expose governed enterprise tools and data to agents. Participants design safe schemas, identity-aware execution, observability, quotas, and action boundaries rather than treating MCP as an unrestricted bridge to backend systems.

## 7. Evaluating Agents Like Software, Not Demos

**Format:** 60 minutes

Define repeatable agent quality gates for groundedness, tool selection, action correctness, safety, latency, and cost. The session shows how to turn real failures into regression tests and establish release criteria for production agents.

## 8. From Copilot to Agent: Choosing the Right AI Pattern in Microsoft Data Platforms

**Format:** 60 minutes

Compare AI-assisted development, conversational BI, data agents, RAG applications, event-driven agents, and autonomous tool-using workflows. The goal is to choose the least complex architecture that solves the business problem while preserving governance and transparency.

## Full-day workshop: Enterprise Agentic AI Architecture

### Morning
- Agent mental model
- Safe tool use
- Agentic RAG
- SQL/data-agent patterns
- Evaluation basics

### Afternoon
- Multi-agent orchestration
- MCP
- Event-driven agents
- Governance and threat modeling
- Production readiness and architecture review

### Final exercise
Participants design an end-to-end agentic architecture for a chosen business domain and defend:

- why an agent is needed;
- what remains deterministic;
- which data is accessible;
- which tools are exposed;
- what requires human approval;
- how quality is evaluated;
- how cost and failure are controlled.
