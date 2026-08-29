"""Synthetic manufacturing telemetry generator for Fabric RTI demos.

Produces newline-delimited JSON events that can be pushed to an event source or
saved locally for replay. Designed specifically for this portfolio lab.
"""

from __future__ import annotations

import json
import math
import random
import time
from datetime import datetime, timezone

ASSETS = [
    {"asset_id": "PRESS-01", "plant": "DETROIT", "line": "STAMPING"},
    {"asset_id": "PRESS-02", "plant": "DETROIT", "line": "STAMPING"},
    {"asset_id": "ROBOT-11", "plant": "DETROIT", "line": "ASSEMBLY"},
    {"asset_id": "ROBOT-12", "plant": "DETROIT", "line": "ASSEMBLY"},
]


def build_event(asset: dict[str, str], sequence: int) -> dict:
    cycle = sequence % 240
    heat_wave = 8 * math.sin(cycle / 25)
    anomaly = random.random() < 0.025

    temperature = 68 + heat_wave + random.uniform(-1.5, 1.5)
    vibration = 1.8 + random.uniform(-0.35, 0.35)
    pressure = 42 + random.uniform(-2.0, 2.0)

    if anomaly:
        temperature += random.uniform(12, 22)
        vibration += random.uniform(2.5, 5.0)

    state = "ALERT" if temperature >= 82 or vibration >= 4.5 else "RUNNING"

    return {
        "event_time": datetime.now(timezone.utc).isoformat(),
        "asset_id": asset["asset_id"],
        "plant": asset["plant"],
        "line": asset["line"],
        "temperature_c": round(temperature, 2),
        "vibration_mm_s": round(vibration, 2),
        "pressure_bar": round(pressure, 2),
        "state": state,
        "sequence": sequence,
    }


def main() -> None:
    sequence = 0
    while True:
        for asset in ASSETS:
            print(json.dumps(build_event(asset, sequence)), flush=True)
        sequence += 1
        time.sleep(1)


if __name__ == "__main__":
    main()
