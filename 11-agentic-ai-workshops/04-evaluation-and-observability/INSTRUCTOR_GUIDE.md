# Workshop 4 — Evaluating Enterprise Agents

## Why this workshop matters

A polished demo can hide a weak agent. Production systems need repeatable evaluation across quality, safety, latency, and cost.

## Evaluation dimensions

### Grounding
Did the answer rely on approved evidence?

### Tool selection
Did the agent choose the correct source or tool for the question?

### Action correctness
Did it choose the right action, including refusal or approval escalation when appropriate?

### Completeness
Did it answer all parts of the request?

### Safety
Did it respect permission and data boundaries?

### Efficiency
Was latency and model/tool cost reasonable for the value of the task?

## Lab flow

1. Define 10 representative business questions.
2. Add expected evidence and expected action for each case.
3. Execute the agent repeatedly.
4. Record output, tools used, latency, token/cost estimate, and policy outcome.
5. Score deterministic metrics automatically.
6. Review qualitative failures manually.
7. Add regression cases for every important failure found.

## Failure taxonomy

- unsupported claim;
- wrong source;
- stale evidence;
- wrong tool;
- unnecessary tool call;
- permission violation;
- incorrect escalation;
- incomplete answer;
- excessive latency;
- runaway cost;
- inconsistent answer across repeated runs.

## Challenge exercise

Create a release gate requiring:

- grounding rate >= 95%;
- action accuracy = 100% for high-risk cases;
- p95 latency below an agreed threshold;
- zero unauthorized write attempts;
- no regression from the previous approved version.

## Teaching takeaway

Agent evaluation should behave more like **software quality engineering** than a one-time prompt review. Every serious failure becomes a durable regression test.
