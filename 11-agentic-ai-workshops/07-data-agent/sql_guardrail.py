import re

ALLOWED_TABLES = {"assets", "work_orders", "sensor_readings", "maintenance_tickets"}
BLOCKED_KEYWORDS = {"insert", "update", "delete", "drop", "alter", "truncate", "merge", "grant", "revoke"}


def validate_sql(sql: str) -> dict:
    normalized = re.sub(r"\s+", " ", sql.strip().lower())

    if not normalized.startswith("select"):
        return {"allowed": False, "reason": "Only read-only SELECT statements are allowed."}

    if any(re.search(rf"\b{kw}\b", normalized) for kw in BLOCKED_KEYWORDS):
        return {"allowed": False, "reason": "A blocked SQL operation was detected."}

    referenced = set(re.findall(r"(?:from|join)\s+([a-zA-Z0-9_\.]+)", normalized))
    simple_names = {name.split(".")[-1] for name in referenced}
    unauthorized = sorted(simple_names - ALLOWED_TABLES)

    if unauthorized:
        return {
            "allowed": False,
            "reason": "Query references tables outside the approved data-agent scope.",
            "unauthorized_tables": unauthorized,
        }

    return {"allowed": True, "tables": sorted(simple_names)}


if __name__ == "__main__":
    tests = [
        "SELECT asset_id, status FROM assets",
        "SELECT a.asset_id, COUNT(*) FROM assets a JOIN work_orders w ON a.asset_id=w.asset_id GROUP BY a.asset_id",
        "DELETE FROM work_orders WHERE status='closed'",
        "SELECT * FROM employee_payroll",
    ]
    for sql in tests:
        print(sql, "=>", validate_sql(sql))
