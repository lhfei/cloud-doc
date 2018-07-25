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

**lineitem_large.task.json** JSON file:

```json
{
    "type": "index_hadoop",
    "spec": {
        "ioConfig": {
            "type": "hadoop",
            "inputSpec": {
                "type": "static",
                "paths": "hdfs://172.19.163.120:8020/user/druid/benchmark/data/lineitem.tbl.*.gz"
            }
        },
        "dataSchema": {
            "dataSource": "tpch_lineitem_large",
            "granularitySpec": {
                "type": "arbitrary",
                "intervals": [
                    "1980/2020"
                ]
            },
            "parser": {
                "type": "hadoopyString",
                "parseSpec": {
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
                    "dimensionsSpec": {
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
                    "timestampSpec": {
                        "format": "yyyy-MM-dd",
                        "column": "l_shipdate"
                    }
                }
            },
            "metricsSpec": [
                {
                    "type": "count",
                    "name": "count"
                },
                {
                    "type": "longSum",
                    "fieldName": "l_quantity",
                    "name": "L_QUANTITY"
                },
                {
                    "type": "doubleSum",
                    "fieldName": "l_extendedprice",
                    "name": "L_EXTENDEDPRICE"
                },
                {
                    "type": "doubleSum",
                    "fieldName": "l_discount",
                    "name": "L_DISCOUNT"
                },
                {
                    "type": "doubleSum",
                    "fieldName": "l_tax",
                    "name": "L_TAX"
                }
            ]
        },
        "tuningConfig": {
            "type": "hadoop",
            "partitionsSpec": {
                "type": "hashed",
                "targetPartitionSize": 5000000
            },
            "jobProperties": {}
        }
    }
}
```



```sh
curl -H 'Content-Type:application/json' -X POST -d@lineitem_large.task.json \
       http://172.19.163.145/druid/indexer/v1/task
```

