# Benchmark

## Hosts

| IP           | Hostname                            |
| ------------ | ----------------------------------- |
| 10.182.17.59 | authserve-e857f6b0-2035558293-jzmc7 |
| 10.182.17.64 | authserve-e857f6b0-2035558293-dr7tj |
| 10.182.17.66 | authserve-e857f6b0-2035558293-dzb6g |



### indexer:

### 



## Load Data



### Task

**lineitem_small.task.json** JSON file:

```json
{
    "type": "index_hadoop",
    "hadoopCoordinates": "org.apache.hadoop:hadoop-core:0.20.205-emr",
    "config": {
        "dataSource": "tpch_lineitem_small",
        "timestampSpec": {
            "column": "l_shipdate",
            "format": "yyyy-MM-dd"
        },
        "dataSpec": {
            "format": "tsv",
            "delimiter": "|",
            "columns": [
                "l_orderkey",
                "l_partkey",
                "l_suppkey",
                "l_linenumber",
                "l_quantity",
                "l_extendedprice",
                "l_discount",
                "l_tax",
                "l_returnflag",
                "l_linestatus",
                "l_shipdate",
                "l_commitdate",
                "l_receiptdate",
                "l_shipinstruct",
                "l_shipmode",
                "l_comment"
            ],
            "dimensions": [
                "l_orderkey",
                "l_partkey",
                "l_suppkey",
                "l_linenumber",
                "l_returnflag",
                "l_linestatus",
                "l_shipdate",
                "l_commitdate",
                "l_receiptdate",
                "l_shipinstruct",
                "l_shipmode",
                "l_comment"
            ]
        },
        "granularitySpec": {
            "type": "arbitrary",
            "intervals": [
                "1980/2020"
            ]
        },
        "pathSpec": {
            "type": "static",
            "paths": "hdfs://host-10-182-93-182:8020/user/druid/benchmark/data/lineitem.tbl.gz"
        },
        "rollupSpec": {
            "aggs": [
                {
                    "type": "count",
                    "name": "count"
                },
                {
                    "type": "longSum",
                    "fieldName": "L_QUANTITY",
                    "name": "L_QUANTITY"
                },
                {
                    "type": "doubleSum",
                    "fieldName": "L_EXTENDEDPRICE",
                    "name": "L_EXTENDEDPRICE"
                },
                {
                    "type": "doubleSum",
                    "fieldName": "L_DISCOUNT",
                    "name": "L_DISCOUNT"
                },
                {
                    "type": "doubleSum",
                    "fieldName": "L_TAX",
                    "name": "L_TAX"
                }
            ],
            "rollupGranularity": "day"
        }
    }
}
```



```sh
curl -H 'Content-Type:application/json' -X POST -d@lineitem_small.task.json \
       http://10.182.17.66/druid/indexer/v1/task
```

