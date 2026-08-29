# Fabric IQ

Fabric IQ is the Microsoft Fabric intelligence layer for expressing business entities, relationships, properties, actions, and rules over trusted analytical, real-time, and operational data.

## Mental model

A practical way to think about Fabric IQ is in three connected layers:

1. **Unified data in OneLake** — governed analytical and operational data.
2. **Business intelligence** — Power BI semantic models and metrics that define measures and analytical meaning.
3. **Operational intelligence** — ontologies and business entities that make data understandable in the language of the business.

The important shift is from asking an agent to reason over tables and columns to giving it business concepts such as `Customer`, `Order`, `Asset`, `Shipment`, or `Claim`.

## Lab idea: from data to business entity

1. Start with a Lakehouse, Warehouse, or semantic model.
2. Identify a business entity and its key.
3. Map source fields to entity properties.
4. Define relationships to adjacent entities.
5. Add measures or current-state attributes.
6. Expose the resulting business context to an analytical or agent experience.
7. Test whether the agent can answer business questions without relying on raw schema knowledge.

## Architecture questions

- What is the canonical identity of each business entity?
- Which properties represent current state versus historical facts?
- Which relationships are deterministic and which are inferred?
- Which business actions should be callable by an agent?
- Which rules must remain outside generative reasoning?
- How are permissions inherited from the underlying Fabric estate?

## Upstream Microsoft references

- [Fabric IQ and Real-Time Intelligence assets](https://github.com/microsoft/Fabric-IQ-and-Real-Time-Intelligence-assets)
- [Microsoft Fabric samples](https://github.com/microsoft/fabric-samples)
- [Microsoft Fabric documentation](https://learn.microsoft.com/fabric/)
- [Microsoft IQ documentation](https://learn.microsoft.com/microsoft-iq/)

## Workshop extension

A strong enterprise demo is to combine historical data in OneLake, live state from Real-Time Intelligence, a Power BI semantic model, and an ontology representing the same business entity. This makes it possible to compare how SQL, KQL, BI semantics, and agent reasoning each contribute a different layer of context.
