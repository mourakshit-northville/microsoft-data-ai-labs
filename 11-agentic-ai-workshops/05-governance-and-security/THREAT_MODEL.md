# Workshop 5 — Agentic AI Threat Model

This workshop uses a practical threat model for enterprise agents that can read data, call tools, and recommend or initiate actions.

## Assets to protect

- enterprise data
- user identity and authorization context
- tool credentials
- business actions
- audit evidence
- prompts and system instructions
- approved retrieval corpus
- model and tool budgets

## Threats

### Prompt injection
A retrieved document or user message attempts to override trusted instructions.

### Tool abuse
The model calls a valid tool with harmful or unauthorized parameters.

### Data exfiltration
The agent reveals information outside the caller's permission boundary.

### Confused deputy
The agent has broader permissions than the user and unintentionally acts on the user's behalf with elevated rights.

### Memory poisoning
Incorrect or malicious content is persisted into reusable memory.

### Retrieval poisoning
Unapproved or manipulated documents rank highly and influence the answer.

### Runaway autonomy
An agent repeatedly calls tools, agents, or external systems without a bounded completion condition.

### Cost exhaustion
A malicious or poorly designed workflow triggers excessive model, retrieval, or tool usage.

## Control matrix

| Threat | Primary control | Secondary control |
|---|---|---|
| Prompt injection | trust-boundary separation | content sanitization + tool allowlists |
| Tool abuse | server-side authorization | parameter validation + approval gates |
| Data exfiltration | identity-aware data access | output filtering + audit |
| Confused deputy | on-behalf-of identity | least privilege |
| Memory poisoning | write approval + provenance | TTL + review |
| Retrieval poisoning | approved-source filtering | document provenance |
| Runaway autonomy | max steps / budget | timeout + circuit breaker |
| Cost exhaustion | quotas | per-run budget + alerts |

## Workshop exercise

For each architecture component, label it as:

- trusted control plane;
- model-controlled decision point;
- external/untrusted content;
- privileged action boundary.

Then redesign the system so that no privileged action depends solely on model-generated text.

## Key teaching point

The LLM is part of the application, not the security boundary. Enterprise controls should remain enforceable even if the model makes a bad decision.
