# Enterprise Context Lab: From Tables to Governed Agent Answers

## Scenario

A business user asks an assistant about revenue, customers, plant assets, and operational alerts. The underlying data exists across analytical and real-time systems, but the user should not need to know table names, storage engines, or query languages.

This lab focuses on designing the context layer that sits between raw data and an agent.

## Context model

### Business entities

- `Customer`
- `Order`
- `Product`
- `Plant`
- `ProductionLine`
- `Asset`
- `TelemetryEvent`

### Relationships

- Customer **places** Order
- Order **contains** Product
- Plant **contains** ProductionLine
- ProductionLine **operates** Asset
- Asset **emits** TelemetryEvent

### Governed definitions

- **Revenue**: sum of valid net order amount.
- **Active Customer**: customer with at least one valid order in the selected period.
- **Critical Asset**: asset whose latest operational state is ALERT or whose defined thresholds are breached.

## Architecture exercise

Map each question to the minimum context required:

| User question | Data context | Semantic context | Policy context |
|---|---|---|---|
| Which region led revenue yesterday? | Gold sales | Revenue, Region | read-only |
| Which assets are critical now? | RTI telemetry | Asset, Critical state | read-only |
| Why did revenue fall? | sales history | Revenue, period comparison | distinguish evidence from causality |
| Shut down the press | telemetry + asset | Asset | human approval required |

## Workshop task

For each question, learners must identify:

1. the authoritative data source,
2. the business definition,
3. the allowed action boundary,
4. the expected answer shape,
5. how the answer should be tested.

The purpose is to show that enterprise agents need more than retrieval. They need agreed business meaning, governed access, and explicit action policy.
