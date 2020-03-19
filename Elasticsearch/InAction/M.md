

### Create a Indx

```shell
curl -X PUT "http://10.220.225.138:9220/dmbout"
```



### Update Settings

```shell
curl -X PUT "http://10.220.225.138:9220/dmbout/_settings" -H 'Content-Type: application/json' -d'
{
  "index": {
	"refresh_interval": "-1",
	"number_of_replicas": "0"
  }
}
'
```



### Add Mapping

```shell
curl -X PUT "http://10.220.225.138:9220/dmbout/_mapping" -H 'Content-Type: application/json' -d'
{
  "properties": {
    "merchant_no": {
      "type": "text"
    },
    "member_id": {
      "type": "text"
    },
    "account_name": {
      "type": "text"
    },
    "detail_create_date": {
      "type": "date",
      "format": "yyyy-MM-dd HH:mm:ss.SSSSSS"
    },
    "out_trade_no": {
      "type": "text"
    },
    "account_balance": {
      "type": "double"
    },
    "in_amount": {
      "type": "text"
    },
    "out_amount": {
      "type": "text"
    },
    "trade_desc": {
      "type": "text"
    },
    "bill_date": {
      "type": "text"
    },
    "ext_min": {
      "type": "text"
    },
    "order_seq_no": {
      "type": "text"
    }
  }
}
'
```



### Load Data

> dmbout.conf

```ini
input {
  file {
    path => ["/export/app_benchmark/year=2019/month=*/*"]
    sincedb_path  => "NUL"
    start_position => "beginning"
  }
}
filter {
  csv {
    separator => ","
    columns => ["merchant_no","member_id","account_name","detail_create_date","out_trade_no","account_balance","in_amount","out_amount","trade_desc","bill_date","ext_min","order_seq_no"]
    skip_header => false

    convert => {
      "detail_create_date" => "date"
      "account_balance"    => "double"
    }
  } 

  date {
    locale => "zh_CN"
    timezone => "Asia/Shanghai"
    match => ["detail_create_date", "yyyy-MM-dd HH:mm:ss.SSSSSS"]
    target => "detail_create_date"
  }
}
output {
  elasticsearch {
    hosts => ["10.220.225.138:9220", "10.220.225.139:9220", "10.220.225.140:9220", "10.220.225.141:9220", "10.220.225.142:9220"]
    index => "dmbout"
    manage_template => false
  }
}
```



```shell
./bin/logstash -f config/dmbout.conf
```

