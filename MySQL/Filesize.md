

```sql
SELECT
  TABLE_NAME AS `Table`,
  ROUND((DATA_LENGTH + INDEX_LENGTH) / 1024 / 1024) AS `Size (MB)`
FROM
  information_schema.TABLES
WHERE
  TABLE_SCHEMA = "${SCHEMA_NAME}"
ORDER BY
  (DATA_LENGTH + INDEX_LENGTH)
DESC;
```
