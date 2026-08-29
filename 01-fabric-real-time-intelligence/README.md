# Fabric Real-Time Intelligence

This section contains an original manufacturing operations lab built around Microsoft Fabric Real-Time Intelligence.

## Lab: manufacturing telemetry

Folder: [`lab01-manufacturing-telemetry`](lab01-manufacturing-telemetry/)

### Components

- `generate_telemetry.py` — generates synthetic press and robot telemetry as newline-delimited JSON.
- `queries.kql` — operational KQL for current health, trends, alert rate and threshold breaches.
- `INSTRUCTOR_GUIDE.md` — workshop flow, architecture discussion and learner challenges.

## Architecture

**Synthetic assets → Eventstream → Eventhouse / KQL Database → Real-Time Dashboard → alert / downstream action**

The demo deliberately separates four concerns:

1. event generation and ingestion,
2. stateful operational analysis,
3. visualization and monitoring,
4. governed handoff to downstream automation or AI.

## Suggested workshop flow

1. Run the telemetry generator and inspect the event contract.
2. Ingest the stream into Fabric Eventstream.
3. Persist it to an Eventhouse table named `AssetTelemetry`.
4. Execute the supplied KQL queries.
5. Build a Real-Time Dashboard showing latest state and recent trends.
6. Design a threshold rule for repeated anomalies.
7. Discuss when the same data should also be persisted to a Lakehouse for historical analysis.

## Teaching points

- Low latency is not the same as good operational decision design.
- A single threshold breach and a sustained condition should not be treated identically.
- Eventstream transformations and KQL transformations solve different parts of the pipeline.
- Agents should be able to explain operational state without automatically gaining authority to change machinery.

## Extension ideas

- Add work orders and maintenance events.
- Calculate mean time between failures.
- Create a second plant and compare operating health.
- Replace static thresholds with a rolling baseline.
- Join live asset state with historical maintenance data.
