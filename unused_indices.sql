SELECT
  t.schemaname || '.' || t.relname AS table_name
  ,i.indexrelname AS index_name
  ,t.seq_scan AS table_scans
  ,i.idx_scan AS index_scans
  ,t.n_live_tup AS estimated_tuples
FROM pg_stat_user_indexes i
  JOIN pg_stat_user_tables t USING (relid)
ORDER BY i.idx_scan ASC, t.n_live_tup DESC
;
