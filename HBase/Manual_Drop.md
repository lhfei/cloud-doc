



### Get table in 'hbase:meta' info

```shell
echo "scan 'hbase:meta'" | hbase shell | grep ${hbase_table_name} | awk -F 'column' '{print $1}' | sort | uniq 
```

eg:

```shell
[lhfei@TX-220-48-65 supdev]$ echo "scan 'hbase:meta'" | hbase shell | grep yellow_trip | awk -F 'column' '{print $1}' | sort | uniq 
 yellow_trip 
 yellow_trip,,1574663529704.e9cfbcfe0ca1251f8ef15eb281819fa2. 
```



then delete all records by row_key

```shell
deleteall 'hbase:meta', 'yellow_trip'
deleteall 'hbase:meta', 'yellow_trip,,1574663529704.e9cfbcfe0ca1251f8ef15eb281819fa2. '
```

