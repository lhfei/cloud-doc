
#### Create User
```shell
groupadd elastic
useradd elastic -g elastic -p elastic
chown -R elastic:elastic /export/cloud/elasticsearch-7.4.2
```

#### Make dirs
```shell
mkdir -p /export/app_data/elasticsearch/data
chmod 775 /export/app_data/elasticsearch/data
chown -R elastic:elastic /export/app_data/elasticsearch/data

mkdir -p /export/app_logs/es/logs
chmod 775 /export/app_logs/es/logs
chown -R elastic:elastic /export/app_logs/es/logs
```

#### Start
```shell
./bin/elasticsearch &
```

#### Stop
```shell
for pid in `lsof -i :9200`; do kill -9 $pid; done
```

#### Configuration

```yml
# ======================== Elasticsearch Configuration =========================
#
# NOTE: Elasticsearch comes with reasonable defaults for most settings.
#       Before you set out to tweak and tune the configuration, make sure you
#       understand what are you trying to accomplish and the consequences.
#
# The primary way of configuring a node is via this file. This template lists
# the most important settings you may want to configure for a production cluster.
#
# Please consult the documentation for further information on configuration options:
# https://www.elastic.co/guide/en/elasticsearch/reference/index.html
#
# ---------------------------------- Cluster -----------------------------------
#
# Use a descriptive name for your cluster:
#
cluster.name: fly-es
#
# ------------------------------------ Node ------------------------------------
#
# Use a descriptive name for the node:
#
node.name: node-182
#
# Add custom attributes to the node:
#
#node.attr.rack: r1
#
# ----------------------------------- Paths ------------------------------------
#
# Path to directory where to store the data (separate multiple locations by comma):
#
path.data: /export/app_data/elasticsearch/data
#
# Path to log files:
#
path.logs: /export/app_logs/es/logs
#
# ----------------------------------- Memory -----------------------------------
#
# Lock the memory on startup:
#
#bootstrap.memory_lock: true
#
# Make sure that the heap size is set to about half the memory available
# on the system and that the owner of the process is allowed to use this
# limit.
#
# Elasticsearch performs poorly when the system is swapping the memory.
#
# ---------------------------------- Network -----------------------------------
#
# Set the bind address to a specific IP (IPv4 or IPv6):
#
network.host: 10.182.93.182
#
# Set a custom port for HTTP:
#
http.port: 9200
#
# For more information, consult the network module documentation.
#
# --------------------------------- Discovery ----------------------------------
#
# Pass an initial list of hosts to perform discovery when this node is started:
# The default list of hosts is ["127.0.0.1", "[::1]"]
#
#discovery.seed_hosts: ["host1", "host2"]
discovery.seed_hosts: ["10.182.93.182","10.182.93.187","10.182.93.191","10.182.93.194","10.182.93.200","10.182.93.201","10.182.93.203"]
#
# Bootstrap the cluster using an initial set of master-eligible nodes:
#
cluster.initial_master_nodes: ["10.182.93.182","10.182.93.187","10.182.93.191"]
#discovery.zen.minimum_master_nodes: 3
#
# For more information, consult the discovery and cluster formation module documentation.
#
# ---------------------------------- Gateway -----------------------------------
#
# Block initial recovery after a full cluster restart until N nodes are started:
#
#gateway.recover_after_nodes: 3
#
# For more information, consult the gateway module documentation.
#
# ---------------------------------- Various -----------------------------------
#
# Require explicit names when deleting indices:
#
#action.destructive_requires_name: true

xpack.monitoring.collection.enabled: true
# enable snapshot repo
#path.repo: ["/export/app_data/elasticsearch/backups"]
```


#### Install Kibana
> 205
```shell
groupadd elastic
useradd elastic -g elastic -p elastic
chown -R elastic:elastic /export/cloud/kibana-7.4.2-linux-x86_64
```

In kibana.yml:

```yml
server.host: "10.182.93.205"
server.name: "10.182.93.205"

elasticsearch.hosts:
  - http://10.182.93.182:9200
  - http://10.182.93.187:9200
  - http://10.182.93.191:9200
  - http://10.182.93.194:9200
  - http://10.182.93.200:9200
  - http://10.182.93.201:9200
  - http://10.182.93.203:9200
  
  
elasticsearch.preserveHost: true
```

> Start Inbana

```shell
./bin/kibana &
```



#### Install Logstash

> 210

```shell
wget https://artifacts.elastic.co/downloads/logstash/logstash-7.4.2.tar.gz

tar xvzf logstash-7.4.2.tar.gz -C /export/cloud/

```

```shell
groupadd elastic
useradd elastic -g elastic -p elastic
chown -R elastic:elastic /export/cloud/logstash-7.4.2
```

> Import Data

> yellow.conf
```ini
input {
  file {
    path => ["/export/app_workspaces/nyc-taxi-data/data/yellow*.csv"]
    sincedb_path  => "NUL"
    start_position => "beginning"
  }
}
filter {
  csv {
    separator => ","
    columns => ["VendorID","tpep_pickup_datetime","tpep_dropoff_datetime","passenger_count","trip_distance","RatecodeID","store_and_fwd_flag","PULocationID","DOLocationID","payment_type","fare_amount","extra","mta_tax","tip_amount","tolls_amount","improvement_surcharge","total_amount","congestion_surcharge"]
    skip_header => true
    convert => {
      "VendorID"              => "integer"
      "tpep_pickup_datetime"  => "date_time"
      "tpep_dropoff_datetime" => "date_time"
      "passenger_count"       => "integer"
      "trip_distance"         => "float"
      "RatecodeID"            => "integer"
      "PULocationID"          => "integer"
      "DOLocationID"          => "integer"
      "payment_type"          => "integer"
      "fare_amount"           => "float"
      "extra"                 => "float"
      "mta_tax"               => "float"
      "tip_amount"            => "float"
      "tolls_amount"          => "float"
      "improvement_surcharge" => "float"
      "total_amount"          => "float"
      "congestion_surcharge"  => "float"
    }
  } 
}
output {
  elasticsearch {
    hosts => ["10.220.48.59:9220","10.220.48.60:9220","10.220.48.62:9220","10.220.48.64:9220","10.220.48.65:9220"]
    index => "yellow_tripdata"
  }
}
```

```shell
bin/logstash -f config/yellow.conf
```

> fhv.conf
```ini
input {
  file {
    path => ["/export/app_sdk/fhv_tripdata_2018-06.csv"]
	sincedb_path  => "NUL"
    start_position => "beginning"
  }
}
filter {
  csv {
    separator => ","
    columns => ["Dispatching_base_num","Pickup_DateTime","DropOff_datetime","PUlocationID","DOlocationID","SR_Flag"]
    skip_header => true
    convert => {
      "Pickup_DateTime"      => "date_time"
      "DropOff_datetime"     => "date_time"
      "PUlocationID"         => "integer"
      "DOlocationID"         => "integer"
    }
  } 
}
output {
  elasticsearch {
    hosts => ["10.182.93.182:9200","10.182.93.187:9200","10.182.93.191:9200","10.182.93.194:9200","10.182.93.200:9200","10.182.93.201:9200","10.182.93.203:9200"]
    index => "fhv_tripdata"
    manage_template => false
  }
}
```

```shell
bin/logstash -f config/fhv.conf
```





> green_tripdata.conf

```ini
input {
  file {
    path => ["/export/app_workspaces/nyc-taxi-data/data/green_tripdata*.csv"]
    sincedb_path  => "NUL"
    start_position => "beginning"
  }
}
filter {
  csv {
    separator => ","
    columns => ["VendorID","lpep_pickup_datetime","Lpep_dropoff_datetime","Store_and_fwd_flag","RateCodeID","Pickup_longitude","Pickup_latitude","Dropoff_longitude","Dropoff_latitude","Passenger_count","Trip_distance","Fare_amount","Extra","MTA_tax","Tip_amount","Tolls_amount","Ehail_fee","Total_amount","Payment_type","Trip_type"]
    skip_header => true
    convert => {
      "VendorID"               => "integer"
      "lpep_pickup_datetime"   => "date_time"
      "Lpep_dropoff_datetime"  => "date_time"
      "RateCodeID"             => "integer"
      "Pickup_longitude"       => "float"
      "Pickup_latitude"        => "float"
      "Dropoff_longitude"      => "float"
      "Dropoff_latitude"       => "float"
      "Passenger_count"        => "integer"
      "Trip_distance"          => "float"
      "Fare_amount"            => "float"
      "Extra"                  => "float"
      "MTA_tax"                => "float"
      "Tip_amount"             => "float"
      "Tolls_amount"           => "float"
      "Ehail_fee"              => "float"
      "Total_amount"           => "float"
      "Payment_type"           => "integer"
      "Trip_type"              => "integer"
    }
  } 
}
output {
  elasticsearch {
    hosts => ["10.220.48.59:9220","10.220.48.60:9220","10.220.48.62:9220","10.220.48.64:9220","10.220.48.65:9220"]
    index => "green_tripdata"
  }
}
```

