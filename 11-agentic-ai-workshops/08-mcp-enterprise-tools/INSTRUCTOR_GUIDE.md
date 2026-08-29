# Workshop 8 — MCP for Enterprise Agent Tools

## Objective

Teach how Model Context Protocol can standardize tool exposure without turning every backend system into an unrestricted agent surface.

## Learning objectives

Participants should be able to:

- explain the difference between an MCP server, tool, resource, and client;
- design narrow, business-safe tool contracts;
- preserve identity and authorization checks behind the MCP layer;
- separate discovery metadata from privileged execution;
- add observability, quotas, and audit events to tool calls;
- decide when MCP is useful versus direct SDK/API integration.

## Scenario

Expose four operations capabilities through a governed tool surface:

- `get_asset_health(asset_id)`
- `get_open_work_orders(asset_id)`
- `get_part_availability(part_id)`
- `draft_maintenance_request(asset_id, reason)`

Only the first three are executable directly. The final tool creates a **draft request**, not a committed operational action.

## Architecture discussion

A production architecture should keep these controls outside the model:

1. authenticate the caller;
2. authorize the requested tool;
3. validate parameters;
4. enforce row/data-level permissions;
5. execute the backend operation;
6. redact unnecessary sensitive fields;
7. log the request, result, latency, and policy outcome.

## Lab exercise

Design a tool schema for `get_open_work_orders` with:

- one required asset identifier;
- optional status filter;
- maximum result count;
- stable error codes;
- no free-form SQL input.

Then explain why accepting arbitrary SQL as an MCP tool parameter would be a poor enterprise contract.

## Challenge exercise

Add a second user persona with fewer permissions. The same MCP tool should return different data based on identity rather than relying on the prompt to hide rows.

## Teaching takeaway

MCP standardizes how agents discover and call tools. It does **not** replace API security, authorization, data governance, or transaction controls.
