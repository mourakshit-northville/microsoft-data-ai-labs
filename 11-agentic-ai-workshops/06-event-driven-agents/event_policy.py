from dataclasses import dataclass
from typing import Literal


@dataclass
class Event:
    asset_id: str
    temperature_c: float
    vibration_mm_s: float
    severity: Literal["info", "warning", "critical"]


def decide(event: Event) -> dict:
    """Deterministic gate before any LLM reasoning is invoked."""
    if event.severity == "critical":
        return {
            "route": "human_and_agent",
            "reason": "Critical events require immediate operator visibility plus agent investigation.",
            "max_agent_steps": 4,
            "write_actions_allowed": False,
        }

    if event.severity == "warning" and (
        event.temperature_c > 85 or event.vibration_mm_s > 6
    ):
        return {
            "route": "agent_investigation",
            "reason": "Warning exceeds investigation threshold.",
            "max_agent_steps": 3,
            "write_actions_allowed": False,
        }

    return {
        "route": "store_only",
        "reason": "No agent invocation required for normal operational noise.",
        "max_agent_steps": 0,
        "write_actions_allowed": False,
    }


if __name__ == "__main__":
    events = [
        Event("PRESS-101", 91.2, 7.8, "warning"),
        Event("PRESS-102", 72.0, 2.1, "info"),
        Event("PRESS-103", 104.0, 9.2, "critical"),
    ]
    for event in events:
        print(event, decide(event))
