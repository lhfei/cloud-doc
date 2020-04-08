###  [Cluster APIs](https://www.elastic.co/guide/en/elasticsearch/reference/current/cluster.html) 

- [Cluster allocation explain](https://www.elastic.co/guide/en/elasticsearch/reference/current/cluster-allocation-explain.html)
- [Cluster get settings](https://www.elastic.co/guide/en/elasticsearch/reference/current/cluster-get-settings.html)
- [Cluster health](https://www.elastic.co/guide/en/elasticsearch/reference/current/cluster-health.html)
- [Cluster reroute](https://www.elastic.co/guide/en/elasticsearch/reference/current/cluster-reroute.html)
- [Cluster state](https://www.elastic.co/guide/en/elasticsearch/reference/current/cluster-state.html)
- [Cluster stats](https://www.elastic.co/guide/en/elasticsearch/reference/current/cluster-stats.html)
- [Cluster update settings](https://www.elastic.co/guide/en/elasticsearch/reference/current/cluster-update-settings.html)
- [Nodes feature usage](https://www.elastic.co/guide/en/elasticsearch/reference/current/cluster-nodes-usage.html)
- [Nodes hot threads](https://www.elastic.co/guide/en/elasticsearch/reference/current/cluster-nodes-hot-threads.html)
- [Nodes info](https://www.elastic.co/guide/en/elasticsearch/reference/current/cluster-nodes-info.html)
- [Nodes stats](https://www.elastic.co/guide/en/elasticsearch/reference/current/cluster-nodes-stats.html)
- [Pending cluster tasks](https://www.elastic.co/guide/en/elasticsearch/reference/current/cluster-pending.html)
- [Remote cluster info](https://www.elastic.co/guide/en/elasticsearch/reference/current/cluster-remote-info.html)
- [Task management](https://www.elastic.co/guide/en/elasticsearch/reference/current/tasks.html)
- [Voting configuration exclusions](https://www.elastic.co/guide/en/elasticsearch/reference/current/voting-config-exclusions.html)



#### Cluster stats API

```
GET /_cluster/stats
```

```
GET /_cluster/stats/nodes/<node_id>
```





#### Nodes stats API

```
GET /_nodes/stats
```

```
GET /_nodes/<node_id>/stats
```

```
GET/_nodes/stats/<metric>
```

```
GET/_nodes/<node_id>/stats/<metric>
```

```
GET /_nodes/stats/<metric>/<index_metric>
```

```
GET /_nodes/<node_id>/stats/<metric>/<index_metric>
```



#### Index

```shell
PUT /twitter
{
    "settings" : {
        "index" : {
            "number_of_shards" : 3, 
            "number_of_replicas" : 2 
        }
    }
}
```







#### SQL

```
POST /_sql?format=txt
{
  "query": """
  SELECT * FROM "fhv_tripdata"
  """
}
```



#### Aggregations

```shell
curl -XPOST "http://10.220.225.137:9220/paybill/_search?size=0" -H 'Content-Type: application/json' -d'
{
    "query": {
        "bool": {
            "filter": [
                {
                    "term": {
                        "member_id": "110979645002"
                    }
                }
            ],
            "must": [
                {
                    "range": {
                        "detail_create_date": {
                            "gte": "2020-01-01 07:01:08.689888",
                            "lte": "2020-03-14 07:01:08.689888"
                        }
                    }
                },
                {
                    "range": {
                        "detail_amount": {
                            "gte": 105,
                            "lte": 1111110
                        }
                    }
                }
            ]
        }
    },
    "aggs": {
        "ammount_count": {
            "sum": {
                "field": "detail_amount"
            }
        }
    }
}' | jq
```



#### Group by

```shell

```

