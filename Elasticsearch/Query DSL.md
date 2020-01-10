





```json
GET /_search
{
  "query": { 
    "bool": { 
      "must": [
        { "match": { "field_1":   "val1"        }},
        { "match": { "field_2":   "val2" }}
      ],
      "filter": [ 
        { "term":  { "status": "published" }},
        { "range": { "publish_date": { "gte": "2015-01-01" }}}
      ]
    }
  }
}
```



```json
GET /_search
{
  "query": { 
    "bool": { 
      "must": [
        {
          "range": {
            "age": {
              "gte": 18,
              "lte": 30
            }
          }
        },
        {
          "range": {
            "slary": {
              "gt": 5000,
              "lte": 10000
            }
          }
        }
      ],
      "filter": [ 
        { "term":  { "status": "published" }},
        { "range": { "publish_date": { "gte": "2015-01-01" }}}
      ]
    }
  }
}
```





### SQL

```json
POST /_sql?format=txt
{
  "query": """
  SELECT * FROM "fhv_tripdata"
  """
}
```

