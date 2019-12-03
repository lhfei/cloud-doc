



### Hosts

```ini
10.182.60.199
10.182.24.28
10.182.25.119
10.182.27.230
10.182.56.151
10.182.60.71
10.182.60.126
10.182.63.59
10.182.63.154
10.182.76.254
10.182.96.19
```



|      IP       | Components |      |
| :-----------: | :--------: | ---- |
| 10.182.25.119 |   Master   |      |
| 10.182.27.230 |   Master   |      |
| 10.182.56.151 |    Seed    |      |
| 10.182.60.71  |    Seed    |      |
| 10.182.60.126 |    Seed    |      |
| 10.182.63.59  |    Seed    |      |
| 10.182.63.154 |    Seed    |      |
| 10.182.76.254 |    Seed    |      |
|               |            |      |
| 10.182.96.19  |  Logstash  |      |
| 10.182.60.199 |   Kibana   |      |



> elasticsearch.yml

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
node.name: node-10.182.25.119
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
network.host: 10.182.25.119
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
discovery.seed_hosts: ["10.182.56.151", "10.182.60.71", "10.182.60.126", "10.182.63.59", "10.182.63.154", "10.182.76.254"]
#
# Bootstrap the cluster using an initial set of master-eligible nodes:
#
cluster.initial_master_nodes: ["10.182.25.119", "10.182.27.230"]
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
```

