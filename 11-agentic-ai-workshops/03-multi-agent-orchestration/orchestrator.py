from dataclasses import dataclass, field
from typing import Callable


@dataclass
class AgentResult:
    agent: str
    summary: str
    evidence: list[str] = field(default_factory=list)
    confidence: float = 0.0


class SpecialistAgent:
    def __init__(self, name: str, handler: Callable[[str], AgentResult]):
        self.name = name
        self.handler = handler

    def run(self, task: str) -> AgentResult:
        return self.handler(task)


def telemetry_agent(task: str) -> AgentResult:
    return AgentResult(
        agent="telemetry",
        summary="PRESS-101 shows elevated vibration and temperature compared with normal operating range.",
        evidence=["telemetry:PRESS-101:vibration=7.9", "telemetry:PRESS-101:temp=91.4"],
        confidence=0.95,
    )


def maintenance_agent(task: str) -> AgentResult:
    return AgentResult(
        agent="maintenance",
        summary="The last two maintenance tickets mention bearing wear and hydraulic imbalance.",
        evidence=["ticket:MT-4401", "ticket:MT-4388"],
        confidence=0.88,
    )


def supply_agent(task: str) -> AgentResult:
    return AgentResult(
        agent="supply",
        summary="A replacement bearing is available in regional stock with a one-day transfer time.",
        evidence=["inventory:BRG-882:qty=3"],
        confidence=0.91,
    )


def coordinate(task: str) -> dict:
    specialists = [
        SpecialistAgent("telemetry", telemetry_agent),
        SpecialistAgent("maintenance", maintenance_agent),
        SpecialistAgent("supply", supply_agent),
    ]

    results = [agent.run(task) for agent in specialists]

    if any(r.confidence < 0.6 for r in results):
        return {
            "status": "needs_review",
            "reason": "One or more specialist outputs are below the confidence threshold.",
            "results": [r.__dict__ for r in results],
        }

    return {
        "status": "ready_for_human_decision",
        "recommended_next_step": "Schedule inspection of PRESS-101 and reserve replacement bearing BRG-882.",
        "results": [r.__dict__ for r in results],
    }


if __name__ == "__main__":
    print(coordinate("Investigate PRESS-101 and recommend the safest next step."))
