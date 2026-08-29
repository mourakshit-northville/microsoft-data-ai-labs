# Instructor Guide: Manufacturing Telemetry with Fabric RTI

## Objective

Build an end-to-end operational analytics demo from synthetic machine events to KQL-driven monitoring. This lab is intentionally small enough for a live workshop but rich enough to discuss architecture, latency, alerting, and governance.

## Scenario

A Detroit manufacturing plant runs stamping presses and assembly robots. Operators need to see current equipment health, identify repeated threshold breaches, and distinguish a single noisy reading from a sustained problem.

## Teaching flow

1. Run `generate_telemetry.py` and inspect the event shape.
2. Route the JSON events into a Fabric Eventstream.
3. Land events in an Eventhouse table named `AssetTelemetry`.
4. Execute the queries in `queries.kql` one by one.
5. Build a Real-Time Dashboard with latest condition, trend, alert rate, and critical assets.
6. Add an alert rule for repeated critical readings rather than a single threshold breach.

## Discussion prompts

- Why is a five-minute average useful but dangerous for sudden failures?
- What belongs in Eventstream transformation versus KQL?
- When should historical telemetry move to a Lakehouse?
- How would you prevent an AI agent from triggering a maintenance action without approval?
- Which business entity should be the primary semantic object: Asset, Line, Plant, or Work Order?

## Challenge exercises

- Add downtime events and calculate mean time between failures.
- Add work-order IDs and correlate maintenance actions with telemetry.
- Create a second plant and compare health by location.
- Replace static thresholds with a rolling baseline.
- Persist an hourly health summary to a Lakehouse for long-term analysis.

## What this lab demonstrates

The value of RTI is not merely fast ingestion. The workshop focuses on the complete operational decision path: event, state, query, visual, threshold, action, and governed handoff to downstream analytics or AI.
