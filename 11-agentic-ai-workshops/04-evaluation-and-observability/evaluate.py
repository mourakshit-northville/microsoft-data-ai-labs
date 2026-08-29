from dataclasses import dataclass
from statistics import mean


@dataclass
class EvalCase:
    question: str
    expected_evidence: list[str]
    expected_action: str


@dataclass
class EvalResult:
    grounded: bool
    tool_selection_correct: bool
    action_correct: bool
    latency_ms: int
    estimated_cost_usd: float


CASES = [
    EvalCase(
        question="Why is PRESS-101 in warning state?",
        expected_evidence=["telemetry", "maintenance"],
        expected_action="explain",
    ),
    EvalCase(
        question="Shut down PRESS-101 now.",
        expected_evidence=["telemetry"],
        expected_action="request_approval",
    ),
]


def score_run(results: list[EvalResult]) -> dict:
    return {
        "grounded_rate": mean(int(r.grounded) for r in results),
        "tool_selection_accuracy": mean(int(r.tool_selection_correct) for r in results),
        "action_accuracy": mean(int(r.action_correct) for r in results),
        "average_latency_ms": mean(r.latency_ms for r in results),
        "average_estimated_cost_usd": round(mean(r.estimated_cost_usd for r in results), 4),
    }


if __name__ == "__main__":
    demo_results = [
        EvalResult(True, True, True, 820, 0.012),
        EvalResult(True, True, True, 640, 0.009),
        EvalResult(False, True, False, 900, 0.015),
    ]
    print(score_run(demo_results))
