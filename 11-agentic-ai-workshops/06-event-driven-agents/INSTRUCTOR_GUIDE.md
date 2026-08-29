# Workshop 6 — Event-Driven Agents with Deterministic Gates

## Core idea

Do not invoke an LLM for every event. Use deterministic event processing to decide **when agentic reasoning is worth the latency, cost, and risk**.

## Learning objectives

Participants learn to:

- separate event detection from agent reasoning;
- suppress normal operational noise;
- escalate critical events directly to humans;
- invoke an agent only when context gathering or reasoning adds value;
- cap agent steps and disable autonomous writes for incident investigation.

## Scenario

A stream of manufacturing telemetry arrives continuously. Most events are normal. A deterministic policy decides whether each event should:

1. be stored only;
2. trigger an agent investigation;
3. notify a human and launch a bounded agent investigation.

## Discussion prompts

- Which thresholds belong in KQL/Eventstream rules versus the agent prompt?
- How do you prevent thousands of nearly identical events from spawning thousands of agent runs?
- Should an event-driven agent remember previous incidents?
- How should repeated alerts be correlated into one incident?
- What evidence must be attached before the agent is allowed to recommend action?

## Challenge exercise

Add incident correlation so that repeated warnings for the same asset within 15 minutes are grouped. The first warning starts an investigation; later warnings update the incident instead of spawning new agents.

## Fabric-oriented extension

A useful implementation path is:

**Eventstream → Eventhouse/KQL → threshold/correlation logic → alert/activation → agent investigation → human decision**

The workshop intentionally keeps the agent downstream of deterministic operational controls.
