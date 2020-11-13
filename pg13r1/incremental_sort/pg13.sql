select * from pgbench_accounts order by aid, bid;

SET work_mem TO '64kB';

explain analyze select * from pgbench_accounts order by aid, bid;


