# Workshop 1 — Safe Tool-Using Agents

## Learning objectives

By the end of this lab, participants should be able to:

- distinguish reasoning from action execution;
- design read-only and write-capable tools differently;
- define explicit tool contracts;
- validate tool inputs and outputs;
- require approval for consequential actions;
- explain why retries, idempotency, and auditability matter.

## Demo story

A plant-operations agent is asked:

> PRESS-101 looks unhealthy. Investigate it and take the appropriate action.

The agent can call two tools:

1. `get_asset_health` — read-only
2. `create_maintenance_work_order` — write-capable and approval-gated

The teaching point is that the model may conclude a work order is appropriate, but the system still refuses the write unless a human approval token is supplied.

## Discussion prompts

1. What happens if the model calls the write tool twice after a timeout?
2. Should the model ever generate the approval token itself?
3. Which fields should be enum-constrained rather than free text?
4. What data should be returned to the model versus kept only in audit logs?
5. When is a deterministic rule better than giving the decision to an LLM?

## Challenge exercise

Add a third tool, `request_line_shutdown`, with these requirements:

- cannot execute autonomously;
- requires a reason code;
- requires two independent approvals;
- must include the latest asset-health observation ID;
- must reject stale observations older than five minutes.

## Instructor takeaway

Agent safety is not primarily a prompt-engineering problem. The strongest controls are enforced **outside the model** in identity, permissions, tool contracts, validation, approval workflows, and transaction design.
