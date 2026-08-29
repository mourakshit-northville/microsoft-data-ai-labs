from dataclasses import dataclass
from typing import Literal


@dataclass
class QueryPlan:
    strategy: Literal["sql", "vector", "hybrid", "clarify"]
    rationale: str
    filters: dict


def plan_retrieval(question: str) -> QueryPlan:
    """Simple deterministic router used to teach retrieval strategy selection."""
    q = question.lower()

    if any(term in q for term in ["how many", "total", "average", "top", "count", "sum"]):
        return QueryPlan(
            strategy="sql",
            rationale="The question asks for an aggregate or structured fact.",
            filters={},
        )

    if any(term in q for term in ["why", "explain", "procedure", "manual", "policy"]):
        return QueryPlan(
            strategy="vector",
            rationale="The question is likely answered by unstructured operational documents.",
            filters={"document_status": "approved"},
        )

    if "press" in q and any(term in q for term in ["issue", "problem", "failure", "maintenance"]):
        return QueryPlan(
            strategy="hybrid",
            rationale="The answer should combine structured telemetry/work orders with maintenance documents.",
            filters={"document_status": "approved"},
        )

    return QueryPlan(
        strategy="clarify",
        rationale="The request is ambiguous enough that retrieval should wait for clarification.",
        filters={},
    )


if __name__ == "__main__":
    examples = [
        "How many critical work orders are open?",
        "Why does PRESS-101 vibrate after a die change?",
        "Explain the maintenance procedure for hydraulic pressure loss.",
        "Tell me about operations.",
    ]
    for question in examples:
        print(question, "=>", plan_retrieval(question))
