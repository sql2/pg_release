-- PostgreSQL 12
DROP TABLE IF EXISTS btree_text;
CREATE TABLE btree_text (col1 text collate "C");

CREATE INDEX dedup_idx ON btree_text(col1)
WITH (deduplicate_items=off);

INSERT INTO btree_text SELECT 'foo' FROM generate_series(1,100000);

SELECT pg_size_pretty (pg_relation_size('dedup_idx'));
