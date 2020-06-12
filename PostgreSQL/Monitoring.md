 

# Queries to monitor your PostgreSQL database

These have been compiled from multiple sources like the [postgresql wiki](https://wiki.postgresql.org/wiki/Main_Page), and [check_postgres](https://bucardo.org/wiki/Check_postgres).

## Usage
These `PREPARE`d statements are essentially queries with names (and 0 arguments) for convenience. Once you have executed a `PREPARE`, you can run it using `EXECUTE` like so:

```sql
EXECUTE query_stats;
```

You can either copy/paste these in selectively, or use the [full list of queries](./monitor.sql).

## Cost
These queries can be run periodically to send data to your monitoring system. They are all cheap enough to be run every few seconds even during heavy load.


## Queries
### current_queries_status (pg9.x)
```sql
PREPARE current_queries_status AS
SELECT count(pid), query, waiting from pg_stat_activity group by query, waiting;
```

### current_queries_status_with_locks (pg9.x)
```sql
PREPARE current_queries_status_with_locks AS
SELECT count(pg_stat_activity.pid) AS number_of_queries,
       substring(trim(LEADING
                      FROM regexp_replace(pg_stat_activity.query, '[\n\r]+'::text,
                       ' '::text, 'g'::text))
                 FROM 0
                 FOR 200) AS query_name,
       max(age(CURRENT_TIMESTAMP, query_start)) AS max_wait_time,
       waiting,
       usename,
       locktype,
       mode,
       granted
  FROM pg_stat_activity
  LEFT JOIN pg_locks ON pg_stat_activity.pid = pg_locks.pid
  WHERE query != '<IDLE>'
    AND query NOT ILIKE '%pg_%' AND query NOT ILIKE '%application_name%' AND query NOT ILIKE '%inet%'
    AND age(CURRENT_TIMESTAMP, query_start) > '5 milliseconds'::interval
  GROUP BY query_name,
           waiting,
           usename,
           locktype,
           mode,
           granted
  ORDER BY max_wait_time DESC;
```

### current_queries_status_with_locks (pg10)
```sql
PREPARE current_queries_status_with_locks AS
SELECT count(pg_stat_activity.pid) AS number_of_queries,
       substring(trim(LEADING
                      FROM regexp_replace(pg_stat_activity.query, '[\n\r]+'::text,
                       ' '::text, 'g'::text))
                 FROM 0
                 FOR 200) AS query_name,
       max(age(CURRENT_TIMESTAMP, query_start)) AS max_wait_time,
       wait_event,
       usename,
       locktype,
       mode,
       granted
  FROM pg_stat_activity
  LEFT JOIN pg_locks ON pg_stat_activity.pid = pg_locks.pid
  WHERE query != '<IDLE>'
    AND query NOT ILIKE '%pg_%' AND query NOT ILIKE '%application_name%' AND query NOT ILIKE '%inet%'
    AND age(CURRENT_TIMESTAMP, query_start) > '5 milliseconds'::interval
  GROUP BY query_name,
           wait_event,
           usename,
           locktype,
           mode,
           granted
  ORDER BY max_wait_time DESC;
```

### query_stats
```sql
PREPARE query_stats AS
SELECT LEFT(query,50) AS query,
       calls, total_time, rows, shared_blks_hit,
       local_blks_hit, blk_read_time, blk_write_time
FROM pg_stat_statements
WHERE EXISTS(SELECT * FROM pg_available_extensions
             WHERE name = 'pg_stat_statements')
ORDER BY calls DESC;
```

- This requires [pg_stat_statements](http://www.postgresql.org/docs/current/static/pgstatstatements.html) to be set up. It's a part of the contrib package, and needs to be added to `shared_preload_libraries` in `postgresql.conf`.

## Cache
### cache_tables
```sql
PREPARE cache_tables AS
SELECT relname AS "relation",
       heap_blks_read AS heap_read,
       heap_blks_hit AS heap_hit,
       ( (heap_blks_hit*100) / NULLIF((heap_blks_hit + heap_blks_read), 0)) AS ratio
FROM pg_statio_user_tables;
```

### cache_total
```sql
PREPARE cache_total AS
SELECT sum(heap_blks_read) AS heap_read,
       sum(heap_blks_hit)  AS heap_hit,
       (sum(heap_blks_hit)*100 / NULLIF((sum(heap_blks_hit) + sum(heap_blks_read)),0)) AS ratio
FROM pg_statio_user_tables;
```

## Disk usage
### table_sizes
```sql
PREPARE table_sizes AS
SELECT relname AS "relation",
       pg_size_pretty(pg_total_relation_size(C.oid)) AS "total_size"
FROM pg_class C
LEFT JOIN pg_namespace N ON (N.oid = C.relnamespace)
WHERE nspname NOT IN ('pg_catalog', 'information_schema')
      AND C.relkind <> 'i'
      AND nspname ='public'
ORDER BY pg_total_relation_size(C.oid) DESC;
```

### relation_sizes
```sql
PREPARE relation_sizes AS
SELECT relname AS "relation",
    pg_size_pretty(pg_relation_size(C.oid)) AS "size"
FROM pg_class C
LEFT JOIN pg_namespace N ON (N.oid = C.relnamespace)
WHERE nspname = 'public'
ORDER BY pg_relation_size(C.oid) DESC;
```

### db_size
```sql
PREPARE db_size AS
SELECT pg_size_pretty(pg_database_size(current_database()));
```

## Bloat
### table_bloat
```sql
PREPARE table_bloat AS
SELECT tblname as "relation", pg_size_pretty((bs*tblpages)::bigint) AS real_size,
  pg_size_pretty(((tblpages-est_tblpages)*bs)::bigint) AS extra_size,
  CASE WHEN tblpages - est_tblpages > 0
    THEN 100 * (tblpages - est_tblpages)/tblpages::float
    ELSE 0
  END AS extra_ratio, fillfactor, pg_size_pretty(((tblpages-est_tblpages_ff)*bs)::bigint) AS bloat_size,
  CASE WHEN tblpages - est_tblpages_ff > 0
    THEN 100 * (tblpages - est_tblpages_ff)/tblpages::float
    ELSE 0
  END AS bloat_ratio, is_na::varchar
  -- , (pst).free_percent + (pst).dead_tuple_percent AS real_frag
FROM (
  SELECT ceil( reltuples / ( (bs-page_hdr)/tpl_size ) ) + ceil( toasttuples / 4 ) AS est_tblpages,
    ceil( reltuples / ( (bs-page_hdr)*fillfactor/(tpl_size*100) ) ) + ceil( toasttuples / 4 ) AS est_tblpages_ff,
    tblpages, fillfactor, bs, tblid, schemaname, tblname, heappages, toastpages, is_na
    -- , stattuple.pgstattuple(tblid) AS pst
  FROM (
    SELECT
      ( 4 + tpl_hdr_size + tpl_data_size + (2*ma)
        - CASE WHEN tpl_hdr_size%ma = 0 THEN ma ELSE tpl_hdr_size%ma END
        - CASE WHEN ceil(tpl_data_size)::int%ma = 0 THEN ma ELSE ceil(tpl_data_size)::int%ma END
      ) AS tpl_size, bs - page_hdr AS size_per_block, (heappages + toastpages) AS tblpages, heappages,
      toastpages, reltuples, toasttuples, bs, page_hdr, tblid, schemaname, tblname, fillfactor, is_na
    FROM (
      SELECT
        tbl.oid AS tblid, ns.nspname AS schemaname, tbl.relname AS tblname, tbl.reltuples,
        tbl.relpages AS heappages, coalesce(toast.relpages, 0) AS toastpages,
        coalesce(toast.reltuples, 0) AS toasttuples,
        coalesce(substring(
          array_to_string(tbl.reloptions, ' ')
          FROM '%fillfactor=#"__#"%' FOR '#')::smallint, 100) AS fillfactor,
        current_setting('block_size')::numeric AS bs,
        CASE WHEN version()~'mingw32' OR version()~'64-bit|x86_64|ppc64|ia64|amd64' THEN 8 ELSE 4 END AS ma,
        24 AS page_hdr,
        23 + CASE WHEN MAX(coalesce(null_frac,0)) > 0 THEN ( 7 + count(*) ) / 8 ELSE 0::int END
          + CASE WHEN tbl.relhasoids THEN 4 ELSE 0 END AS tpl_hdr_size,
        sum( (1-coalesce(s.null_frac, 0)) * coalesce(s.avg_width, 1024) ) AS tpl_data_size,
        bool_or(att.atttypid = 'pg_catalog.name'::regtype) AS is_na
      FROM pg_attribute AS att
        JOIN pg_class AS tbl ON att.attrelid = tbl.oid
        JOIN pg_namespace AS ns ON ns.oid = tbl.relnamespace
        JOIN pg_stats AS s ON s.schemaname=ns.nspname AND ns.nspname = 'public'
          AND s.tablename = tbl.relname AND s.inherited=false AND s.attname=att.attname
        LEFT JOIN pg_class AS toast ON tbl.reltoastrelid = toast.oid
      WHERE att.attnum > 0 AND NOT att.attisdropped
        AND tbl.relkind = 'r'
      GROUP BY 1,2,3,4,5,6,7,8,9,10, tbl.relhasoids
      ORDER BY 2,3
    ) AS s
  ) AS s2
) AS s3;
```

### table_and_index_bloat
```sql
PREPARE table_and_index_bloat AS
SELECT
  tablename AS "relation", reltuples::bigint AS tups, relpages::bigint AS pages, otta,
  ROUND(CASE WHEN otta=0 OR sml.relpages=0 OR sml.relpages=otta THEN 0.0 ELSE sml.relpages/otta::numeric END,1) AS tbloat,
  CASE WHEN relpages < otta THEN 0 ELSE relpages::bigint - otta END AS wastedpages,
  CASE WHEN relpages < otta THEN 0 ELSE bs*(sml.relpages-otta)::bigint END AS wastedbytes,
  CASE WHEN relpages < otta THEN 0 ELSE (bs*(relpages-otta))::bigint END AS wastedsize,
  iname, ituples::bigint AS itups, ipages::bigint AS ipages, iotta,
  ROUND(CASE WHEN iotta=0 OR ipages=0 OR ipages=iotta THEN 0.0 ELSE ipages/iotta::numeric END,1) AS ibloat,
  CASE WHEN ipages < iotta THEN 0 ELSE ipages::bigint - iotta END AS wastedipages,
  CASE WHEN ipages < iotta THEN 0 ELSE bs*(ipages-iotta) END AS wastedibytes,
  CASE WHEN ipages < iotta THEN 0 ELSE (bs*(ipages-iotta))::bigint END AS wastedisize,
  CASE WHEN relpages < otta THEN
    CASE WHEN ipages < iotta THEN 0 ELSE bs*(ipages-iotta::bigint) END
    ELSE CASE WHEN ipages < iotta THEN bs*(relpages-otta::bigint)
      ELSE bs*(relpages-otta::bigint + ipages-iotta::bigint) END
  END AS totalwastedbytes
FROM (
  SELECT
    nn.nspname AS schemaname,
    cc.relname AS tablename,
    COALESCE(cc.reltuples,0) AS reltuples,
    COALESCE(cc.relpages,0) AS relpages,
    COALESCE(bs,0) AS bs,
    COALESCE(CEIL((cc.reltuples*((datahdr+ma-
      (CASE WHEN datahdr%ma=0 THEN ma ELSE datahdr%ma END))+nullhdr2+4))/(bs-20::float)),0) AS otta,
    COALESCE(c2.relname,'?') AS iname, COALESCE(c2.reltuples,0) AS ituples, COALESCE(c2.relpages,0) AS ipages,
    COALESCE(CEIL((c2.reltuples*(datahdr-12))/(bs-20::float)),0) AS iotta -- very rough approximation, assumes all cols
  FROM
     pg_class cc
  JOIN pg_namespace nn ON cc.relnamespace = nn.oid AND nn.nspname = 'public'
  LEFT JOIN
  (
    SELECT
      ma,bs,foo.nspname,foo.relname,
      (datawidth+(hdr+ma-(case when hdr%ma=0 THEN ma ELSE hdr%ma END)))::numeric AS datahdr,
      (maxfracsum*(nullhdr+ma-(case when nullhdr%ma=0 THEN ma ELSE nullhdr%ma END))) AS nullhdr2
    FROM (
      SELECT
        ns.nspname, tbl.relname, hdr, ma, bs,
        SUM((1-coalesce(null_frac,0))*coalesce(avg_width, 2048)) AS datawidth,
        MAX(coalesce(null_frac,0)) AS maxfracsum,
        hdr+(
          SELECT 1+count(*)/8
          FROM pg_stats s2
          WHERE null_frac<>0 AND s2.schemaname = ns.nspname AND s2.tablename = tbl.relname
        ) AS nullhdr
      FROM pg_attribute att
      JOIN pg_class tbl ON att.attrelid = tbl.oid
      JOIN pg_namespace ns ON ns.oid = tbl.relnamespace
      LEFT JOIN pg_stats s ON s.schemaname=ns.nspname
      AND s.tablename = tbl.relname
      AND s.inherited=false
      AND s.attname=att.attname,
      (
        SELECT
          (SELECT current_setting('block_size')::numeric) AS bs,
            CASE WHEN SUBSTRING(SPLIT_PART(v, ' ', 2) FROM '#"[0-9]+.[0-9]+#"%' for '#')
              IN ('8.0','8.1','8.2') THEN 27 ELSE 23 END AS hdr,
          CASE WHEN v ~ 'mingw32' OR v ~ '64-bit' THEN 8 ELSE 4 END AS ma
        FROM (SELECT version() AS v) AS foo
      ) AS constants
      WHERE att.attnum > 0 AND tbl.relkind='r'
      GROUP BY 1,2,3,4,5
    ) AS foo
  ) AS rs
  ON cc.relname = rs.relname AND nn.nspname = rs.nspname AND nn.nspname = 'public'
  LEFT JOIN pg_index i ON indrelid = cc.oid
  LEFT JOIN pg_class c2 ON c2.oid = i.indexrelid
) AS sml;
```

## Indexes
### index_usage
```sql
PREPARE index_usage AS
SELECT
    t.tablename AS "relation",
    indexname,
    c.reltuples AS num_rows,
    pg_size_pretty(pg_relation_size(quote_ident(t.tablename)::text)) AS table_size,
    pg_size_pretty(pg_relation_size(quote_ident(indexrelname)::text)) AS index_size,
    idx_scan AS number_of_scans,
    idx_tup_read AS tuples_read,
    idx_tup_fetch AS tuples_fetched
FROM pg_tables t
LEFT OUTER JOIN pg_class c ON t.tablename=c.relname
LEFT OUTER JOIN
    ( SELECT c.relname AS ctablename, ipg.relname AS indexname, x.indnatts AS number_of_columns, idx_scan, idx_tup_read, idx_tup_fetch, indexrelname, indisunique FROM pg_index x
           JOIN pg_class c ON c.oid = x.indrelid
           JOIN pg_class ipg ON ipg.oid = x.indexrelid
           JOIN pg_stat_all_indexes psai ON x.indexrelid = psai.indexrelid )
    AS foo
    ON t.tablename = foo.ctablename
WHERE t.schemaname='public'
ORDER BY 1,2;
```

## Tuples and Autovacuum
### tuple_info
```sql
PREPARE tuple_info AS
SELECT relname as "relation", EXTRACT (EPOCH FROM current_timestamp-last_autovacuum) as since_last_av,
       autovacuum_count as av_count, n_tup_ins, n_tup_upd, n_tup_del, n_live_tup, n_dead_tup
FROM pg_stat_all_tables
WHERE schemaname = 'public'
ORDER BY relname;
```


## Replication
### replication_status (pg9.x)
```sql
PREPARE replication_status AS
SELECT application_name,client_addr,state,sent_location,write_location,replay_location,
                 (sent_offset - (replay_offset - (sent_xlog - replay_xlog) * 255 * 16 ^ 6 ))::text AS byte_lag
                  FROM (SELECT
                          application_name,client_addr,state,sync_state,sent_location,write_location,replay_location,
                          ('x' || lpad(split_part(sent_location::text,   '/', 1), 8, '0'))::bit(32)::bigint AS sent_xlog,
                          ('x' || lpad(split_part(replay_location::text, '/', 1), 8, '0'))::bit(32)::bigint AS replay_xlog,
                          ('x' || lpad(split_part(sent_location::text,   '/', 2), 8, '0'))::bit(32)::bigint AS sent_offset,
                          ('x' || lpad(split_part(replay_location::text, '/', 2), 8, '0'))::bit(32)::bigint AS replay_offset
                        FROM pg_stat_replication)
                  AS s;
```
### replication_status (pg10)
```sql
PREPARE replication_status AS
SELECT application_name,client_addr,state, \\
                 (sent_offset - (replay_offset - (sent_xlog - replay_xlog) * 255 * 16 ^ 6 ))::text AS byte_lag \\
                  FROM (SELECT \\
                          application_name,client_addr,state,sync_state,sent_lsn,write_lsn,replay_lsn, \\
                          ('x' || lpad(split_part(sent_lsn::text,   '/', 1), 8, '0'))::bit(32)::bigint AS sent_xlog, \\
                          ('x' || lpad(split_part(replay_lsn::text, '/', 1), 8, '0'))::bit(32)::bigint AS replay_xlog, \\
                          ('x' || lpad(split_part(sent_lsn::text,   '/', 2), 8, '0'))::bit(32)::bigint AS sent_offset, \\
                          ('x' || lpad(split_part(replay_lsn::text, '/', 2), 8, '0'))::bit(32)::bigint AS replay_offset \\
                        FROM pg_stat_replication) \\
                  AS s;
```