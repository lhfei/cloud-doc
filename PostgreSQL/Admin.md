

### Admin

#### General Table Size Information

```sql
select
	-- *,
 table_schema || '.' || table_name,
	pg_size_pretty(total_bytes) as total ,
	pg_size_pretty(index_bytes) as index ,
	pg_size_pretty(toast_bytes) as toast ,
	pg_size_pretty(table_bytes) as table
from
	(
	select
		*, total_bytes-index_bytes-coalesce(toast_bytes, 0) as table_bytes
	from
		(
		select
			c.oid, nspname as table_schema, relname as TABLE_NAME , c.reltuples as row_estimate , pg_total_relation_size(c.oid) as total_bytes , pg_indexes_size(c.oid) as index_bytes , pg_total_relation_size(reltoastrelid) as toast_bytes
		from
			pg_class c
		left join pg_namespace n on
			n.oid = c.relnamespace
		where
			relkind = 'r'
			and nspname = 'public') a ) a
order by
	table_bytes desc;
```



#### Finding the largest database in your cluster



```sql
select
	d.datname as Name,
	pg_catalog.pg_get_userbyid(d.datdba) as owner,
	case
		when pg_catalog.has_database_privilege(d.datname, 'CONNECT') then pg_catalog.pg_size_pretty(pg_catalog.pg_database_size(d.datname))
		else 'No Access'
	end as size
from
	pg_catalog.pg_database d
order by
	case
		when pg_catalog.has_database_privilege(d.datname, 'CONNECT') then pg_catalog.pg_database_size(d.datname)
		else null
	end desc
	-- nulls first
limit 20
```



#### Finding the size of your biggest relations

Relations are objects in the database such as tables and indexes, and this query shows the size of all the individual parts. Tables which have both regular and [TOAST](http://www.postgresql.org/docs/current/static/storage-toast.html) pieces will be broken out into separate components; an example showing how you might include those into the main total is available in the [documentation](http://www.postgresql.org/docs/current/static/disk-usage.html), and as of PostgreSQL 9.0 it's possible to include it automatically by using pg_table_size here instead of pg_relation_size:

```sql
select
	nspname || '.' || relname as "relation",
	pg_size_pretty(pg_relation_size(C.oid)) as "size"
from
	pg_class C
left join pg_namespace N on
	(N.oid = C.relnamespace)
where
	nspname not in ('pg_catalog', 'information_schema')
order by
	pg_relation_size(C.oid) desc
limit 20;
```



#### Finding the total size of your biggest tables

```sql
select
	nspname || '.' || relname as "relation",
	pg_size_pretty(pg_total_relation_size(C.oid)) as "total_size"
from
	pg_class C
left join pg_namespace N on
	(N.oid = C.relnamespace)
where
	nspname not in ('pg_catalog', 'information_schema')
	and C.relkind <> 'i'
	and nspname !~ '^pg_toast'
order by
	pg_total_relation_size(C.oid) desc
limit 20;
```





