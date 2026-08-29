# Fabric Real-Time Intelligence

This section covers event-driven analytics patterns in Microsoft Fabric Real-Time Intelligence (RTI): ingestion, transformation, Eventhouse/KQL, real-time visualization, alerting, and agent integration.

## Architecture pattern

**Sources → Eventstream → Eventhouse/KQL Database → Real-Time Dashboard / Activator / Power BI / Agents**

Key design questions:

1. Which events need low-latency ingestion versus batch landing in OneLake?
2. What transformations belong in Eventstream versus KQL?
3. Which data should remain hot in Eventhouse and which should be persisted for broader analytical reuse?
4. What operational thresholds should drive alerts or downstream actions?
5. How should real-time context be exposed to AI agents without bypassing governance?

## Suggested hands-on labs

### Lab 1: Streaming telemetry to Eventhouse
- Create an Eventstream.
- Connect a sample event source.
- Route events to an Eventhouse/KQL database.
- Validate schema, ingestion rate, and latency.
- Query latest state using KQL.

### Lab 2: Real-time operations dashboard
- Build KQL queries for current state, trend, anomaly, and top-N views.
- Create a Real-Time Dashboard.
- Add refresh-aware visuals and operational filters.
- Define a threshold that could trigger downstream notification/action.

### Lab 3: Event-driven AI pattern
- Use real-time business events as context for an agent workflow.
- Separate deterministic business rules from generative reasoning.
- Keep operational actions permission-aware and auditable.

## Upstream Microsoft references

- [Fabric RTI Workshop](https://github.com/microsoft/FabricRTIWorkshop)
- [FabCon RTI Workshop](https://github.com/microsoft/FabConRTIWorkshop)
- [Real-Time Intelligence Operations Solution Accelerator](https://github.com/microsoft/real-time-intelligence-operations-solution-accelerator)
- [Fabric RTI MCP](https://github.com/microsoft/fabric-rti-mcp)
- [Event-driven RTI using Fabric](https://github.com/microsoft/Event-driven-real-time-intelligence-using-Fabrics-RTI)
- [Fabric IQ and RTI assets](https://github.com/microsoft/Fabric-IQ-and-Real-Time-Intelligence-assets)

## What I would extend in a workshop

- Add a manufacturing/operations scenario with asset telemetry.
- Show the same business entity across historical Lakehouse data and live Eventhouse state.
- Add a semantic/ontology layer so an agent reasons about an `Asset`, `Plant`, `Order`, or `Shipment` rather than raw tables.
- Demonstrate where KQL, Power BI, and agentic interaction each fit instead of treating them as interchangeable tools.
