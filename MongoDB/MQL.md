

```sql
select 

from 

where `day` in("2024-03-17", "2024-03-16")
  and `agdm` = '600519'
  and `ssfl` in ("财务类", "经营类")
  
group by `day`

having 10
```



```json
[
  {
    "$match": {
      "$and": [
        {
          "$or": [
            {
              "day": "2024-03-17"
            },
            {
              "day": "2024-03-16"
            }
          ]
        },
        {
          "agdm": "600519"
        },
        {
          "$or": [
            {
              "ssfl": "财务类"
            },
            {
              "ssfl": "经营类"
            }
          ]
        }
      ]
    }
  },
  {
    "$group": {
      "_id": {
        "day": "$day",
        "ssfl": "$ssfl"
      },
      "count": {
        "$sum": 1
      }
    }
  },
  {
    "$sort": {
      "_id": 1
    }
  },
  {
    "$project": {
      "_id": false,
      "day": "$_id.day",
      "ssfl": "$_id.ssfl",
      "count": true
    }
  },
  {
    "$sort": {
      "day": -1,
      "ssfl": 1
    }
  }
]
```

