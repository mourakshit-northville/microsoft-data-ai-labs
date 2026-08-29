from dataclasses import dataclass
from datetime import datetime, timezone
from typing import Literal, Optional


@dataclass
class WorkOrder:
    work_order_id: str
    asset_id: str
    priority: Literal["low", "medium", "high", "critical"]
    status: Literal["open", "assigned", "in_progress", "closed"]
    description: str


ASSET_STATE = {
    "PRESS-101": {"temperature_c": 91.4, "vibration_mm_s": 7.9, "status": "warning"},
    "PRESS-102": {"temperature_c": 72.2, "vibration_mm_s": 2.1, "status": "normal"},
}

WORK_ORDERS: dict[str, WorkOrder] = {}


def get_asset_health(asset_id: str) -> dict:
    """Read-only tool. Returns the latest approved operational state for an asset."""
    state = ASSET_STATE.get(asset_id)
    if not state:
        return {"ok": False, "error": "asset_not_found", "asset_id": asset_id}

    return {
        "ok": True,
        "asset_id": asset_id,
        "observed_at": datetime.now(timezone.utc).isoformat(),
        **state,
    }


def create_maintenance_work_order(
    asset_id: str,
    priority: Literal["low", "medium", "high", "critical"],
    description: str,
    approval_token: Optional[str] = None,
) -> dict:
    """
    Write tool. Requires explicit approval before creating a work order.

    The approval requirement demonstrates a critical enterprise pattern:
    reasoning may be autonomous while consequential actions remain gated.
    """
    if approval_token != "APPROVED_BY_OPERATOR":
        return {
            "ok": False,
            "error": "human_approval_required",
            "message": "A maintenance work order cannot be created without operator approval.",
        }

    if asset_id not in ASSET_STATE:
        return {"ok": False, "error": "asset_not_found", "asset_id": asset_id}

    work_order_id = f"WO-{len(WORK_ORDERS) + 1001}"
    order = WorkOrder(
        work_order_id=work_order_id,
        asset_id=asset_id,
        priority=priority,
        status="open",
        description=description,
    )
    WORK_ORDERS[work_order_id] = order
    return {"ok": True, "work_order": order.__dict__}


if __name__ == "__main__":
    print(get_asset_health("PRESS-101"))
    print(create_maintenance_work_order("PRESS-101", "high", "Inspect vibration trend"))
    print(
        create_maintenance_work_order(
            "PRESS-101",
            "high",
            "Inspect vibration trend",
            approval_token="APPROVED_BY_OPERATOR",
        )
    )
