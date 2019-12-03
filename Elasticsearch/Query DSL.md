





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

