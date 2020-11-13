CREATE INDEX title_idx ON films (title) WITH (deduplicate_items = off);

ALTER INDEX title_idx ON films (title) SET (deduplicate_items = off);

SELECT reloptions FROM pg_class WHERE relname = 'title_idx';

