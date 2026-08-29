/*
SQL Server / Azure SQL performance triage lab
Read-only diagnostics: waits, expensive queries, index usage, Query Store discussion
*/

-- Current top waits (filtering common benign waits)
SELECT TOP (20)
    wait_type,
    waiting_tasks_count,
    wait_time_ms,
    signal_wait_time_ms,
    wait_time_ms - signal_wait_time_ms AS resource_wait_ms
FROM sys.dm_os_wait_stats
WHERE wait_type NOT IN (
    'SLEEP_TASK','SLEEP_SYSTEMTASK','LAZYWRITER_SLEEP','RESOURCE_QUEUE',
    'XE_TIMER_EVENT','XE_DISPATCHER_WAIT','BROKER_TO_FLUSH','BROKER_TASK_STOP',
    'CLR_AUTO_EVENT','CLR_MANUAL_EVENT','SQLTRACE_BUFFER_FLUSH'
)
ORDER BY wait_time_ms DESC;
GO

-- Expensive cached statements
SELECT TOP (20)
    qs.execution_count,
    qs.total_elapsed_time / 1000.0 AS total_elapsed_ms,
    qs.total_worker_time / 1000.0 AS total_cpu_ms,
    qs.total_logical_reads,
    qs.total_elapsed_time / NULLIF(qs.execution_count,0) / 1000.0 AS avg_elapsed_ms,
    SUBSTRING(st.text,
              (qs.statement_start_offset/2)+1,
              ((CASE qs.statement_end_offset WHEN -1 THEN DATALENGTH(st.text)
                ELSE qs.statement_end_offset END - qs.statement_start_offset)/2)+1) AS statement_text
FROM sys.dm_exec_query_stats qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) st
ORDER BY qs.total_elapsed_time DESC;
GO

-- Index usage snapshot
SELECT
    OBJECT_SCHEMA_NAME(i.object_id) AS SchemaName,
    OBJECT_NAME(i.object_id) AS TableName,
    i.name AS IndexName,
    i.type_desc,
    COALESCE(us.user_seeks,0) AS user_seeks,
    COALESCE(us.user_scans,0) AS user_scans,
    COALESCE(us.user_lookups,0) AS user_lookups,
    COALESCE(us.user_updates,0) AS user_updates
FROM sys.indexes i
LEFT JOIN sys.dm_db_index_usage_stats us
  ON us.database_id = DB_ID()
 AND us.object_id = i.object_id
 AND us.index_id = i.index_id
WHERE i.object_id > 100
  AND i.is_hypothetical = 0
ORDER BY user_scans DESC, user_seeks DESC;
GO

-- Instructor discussion:
-- * Why not create every suggested missing index?
-- * CPU vs IO vs blocking: what evidence differentiates them?
-- * Query Store vs cache DMVs: which survives restart and plan eviction?
-- * How do Azure SQL resource limits change the diagnosis?