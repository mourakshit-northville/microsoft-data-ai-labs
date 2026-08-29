-- Original Unity Catalog governance workshop setup
-- Replace principals with groups available in your workspace before running.

CREATE CATALOG IF NOT EXISTS workshop;
CREATE SCHEMA IF NOT EXISTS workshop.bronze;
CREATE SCHEMA IF NOT EXISTS workshop.silver;
CREATE SCHEMA IF NOT EXISTS workshop.gold;

-- Example separation of duties
GRANT USE CATALOG ON CATALOG workshop TO `data_engineers`;
GRANT USE SCHEMA, CREATE TABLE ON SCHEMA workshop.bronze TO `data_engineers`;
GRANT USE SCHEMA, CREATE TABLE, MODIFY ON SCHEMA workshop.silver TO `data_engineers`;
GRANT USE SCHEMA, CREATE TABLE, MODIFY ON SCHEMA workshop.gold TO `data_engineers`;

GRANT USE CATALOG ON CATALOG workshop TO `data_analysts`;
GRANT USE SCHEMA ON SCHEMA workshop.gold TO `data_analysts`;
GRANT SELECT ON SCHEMA workshop.gold TO `data_analysts`;

-- Teaching checkpoint: verify effective permissions.
SHOW GRANTS ON CATALOG workshop;
SHOW GRANTS ON SCHEMA workshop.gold;

-- Instructor challenge:
-- 1. Add a finance schema that analysts can query but engineers cannot modify.
-- 2. Create a read-only consumer group for BI tools.
-- 3. Explain why granting SELECT directly to individuals is harder to operate than group-based access.
