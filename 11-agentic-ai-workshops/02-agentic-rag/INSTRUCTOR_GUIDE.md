# Workshop 2 — Agentic RAG: Choosing the Right Retrieval Path

## Why this workshop matters

Many RAG demos treat retrieval as a single vector-search step. Enterprise questions are rarely that simple. Some questions require SQL, some require documents, some require both, and some should not retrieve anything until the user clarifies the request.

## Learning objectives

Participants learn to:

- classify questions by retrieval type;
- route structured questions to SQL/KQL;
- route policy/procedure questions to document retrieval;
- combine structured and unstructured evidence;
- use metadata filters and approved-content boundaries;
- decide when the correct action is to ask a clarifying question.

## Lab flow

1. Run the deterministic retrieval router.
2. Add a mock SQL retriever for work orders and telemetry.
3. Add a mock vector retriever for maintenance manuals.
4. Build a hybrid response that cites both evidence sets.
5. Inject an unapproved draft document and confirm it is filtered out.
6. Test an ambiguous question and verify that the system asks for clarification instead of guessing.

## Architecture discussion

A production design commonly separates these concerns:

- **Planner/router** — decides what evidence is needed.
- **Retriever** — obtains approved evidence.
- **Answer generator** — synthesizes the response.
- **Evaluator** — checks grounding and completeness.
- **Policy layer** — blocks sources, actions, or identities that are not allowed.

## Challenge exercise

Extend the router so that questions involving a date range require a validated time filter. Then add a rule that prevents the agent from answering questions about future production output when no forecast source is available.

## Teaching takeaway

Agentic RAG is not simply “RAG with more prompts.” It is a decision system around retrieval: **which source, which query method, which filters, which evidence, and whether the agent has enough information to answer at all**.
