--

\pset pager off

CREATE TABLE t_log (dt timestamp (0) severity text, message text);

INSERT INTO t_log
SELECT now () + ((g / 2) || 's') :: interval,
CASE g % 3 WHEN 0 THEN 'LOG'WHEN 1 THEN 'ERROR'ELSE 'FATAL'END, md5 (g :: text)
FROM generate_series (1, 10000) g;

--SELECT * FROM t_log;

CREATE INDEX ON t_log (dt);

VACUUM (ANALYZE) t_log;

SELECT * FROM t_log WHERE dt> '2020-05-25 14:10'
ORDER BY dt, severity, message LIMIT 1000;


SET enable_incremental_sort TO off;

EXPLAIN (ANALYZE)
SELECT * FROM t_log WHERE dt> '2020-05-25 14:10'
ORDER BY dt, severity, message LIMIT 1000;


SET enable_incremental_sort TO on;

EXPLAIN (ANALYZE)
SELECT * FROM t_log WHERE dt> '2020-05-25 14:10'
ORDER BY dt, severity, message LIMIT 1000;

