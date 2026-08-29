-- Azure SQL / SQL Server performance triage teaching script
-- Read-only diagnostic queries suitable for a workshop demo.

-- 1. Highest average CPU queries in the plan cache
SELECT TOP (20)
    qs.execution_count,
    CAST(qs.total_worker_time * 1.0 / NULLIF(qs.execution_count, 0) AS BIGINT) AS avg_cpu_us,
    CAST(qs.total_elapsed_time * 1.0 / NULLIF(qs.execution_count, 0) AS BIGINT) AS avg_elapsed_us,
    DB_NAME(st.dbid) AS database_name,
    SUBSTRING(
        st.text,
        (qs.statement_start_offset / 2) + 1,
        ((CASE qs.statement_end_offset WHEN -1 THEN DATALENGTH(st.text) ELSE qs.statement_end_offset END
          - qs.statement_start_offset) / 2) + 1
    ) AS statement_text
FROM sys.dm_exec_query_stats AS qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) AS st
ORDER BY avg_cpu_us DESC;

-- 2. Current waits by active request
SELECT
    r.session_id,
    r.status,
    r.command,
    r.wait_type,
    r.wait_time,
    r.blocking_session_id,
    r.cpu_time,
    r.total_elapsed_time,
    DB_NAME(r.database_id) AS database_name
FROM sys.dm_exec_requests AS r
WHERE r.session_id <> @@SPID
ORDER BY r.total_elapsed_time DESC;

-- 3. Index usage: look for large objects with scans but few seeks
SELECT
    OBJECT_SCHEMA_NAME(i.object_id) AS schema_name,
    OBJECT_NAME(i.object_id) AS table_name,
    i.name AS index_name,
    COALESCE(s.user_seeks, 0) AS user_seeks,
    COALESCE(s.user_scans, 0) AS user_scans,
    COALESCE(s.user_lookups, 0) AS user_lookups,
    COALESCE(s.user_updates, 0) AS user_updates
FROM sys.indexes AS i
LEFT JOIN sys.dm_db_index_usage_stats AS s
    ON i.object_id = s.object_id
   AND i.index_id = s.index_id
   AND s.database_id = DB_ID()
WHERE i.index_id > 0
ORDER BY user_scans DESC, user_updates DESC;

-- Instructor prompt:
-- Do not jump directly from a high-cost query to "add an index".
-- Ask learners to identify the workload pattern, selectivity, blocking,
-- cardinality, and whether the same query is actually business-critical.
