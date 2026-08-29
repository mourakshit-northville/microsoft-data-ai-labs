# Workshop 3 — Multi-Agent Orchestration Without Chaos

## Core question

When should a problem use multiple agents instead of one capable agent with multiple tools?

## Learning objectives

Participants learn to:

- identify real specialization boundaries;
- compare coordinator/worker and peer-to-peer patterns;
- define evidence contracts between agents;
- avoid uncontrolled agent-to-agent loops;
- aggregate confidence and uncertainty;
- preserve a single decision owner.

## Scenario

A coordinator investigates an unhealthy production asset by delegating to:

- a telemetry specialist;
- a maintenance-history specialist;
- a supply/inventory specialist.

Each specialist returns a constrained result containing:

- summary;
- evidence references;
- confidence.

The coordinator does **not** allow the specialists to directly trigger operational actions.

## Anti-patterns to discuss

1. Creating an agent for every API call.
2. Letting agents converse indefinitely without a completion condition.
3. Passing entire chat histories between specialists.
4. Allowing every specialist to mutate shared state.
5. Treating “multi-agent” as automatically more advanced than a single-agent design.

## Challenge exercises

### Challenge A — conflicting evidence
Modify one specialist to report that PRESS-101 is healthy. Require the coordinator to surface the conflict rather than averaging it away.

### Challenge B — missing specialist
Simulate the supply system being unavailable. Decide whether the workflow should fail, continue with partial evidence, or escalate.

### Challenge C — cost-aware orchestration
Assign a cost to each specialist call. Design a coordinator that calls the minimum set of agents necessary for the question.

## Teaching takeaway

A good multi-agent system has **clear specialization, bounded communication, explicit evidence contracts, and one place where responsibility for the final decision is visible**.
