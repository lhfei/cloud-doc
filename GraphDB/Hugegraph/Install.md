### Install



```shell
# bin/hugegraph deploy -v {hugegraph-version} -p {install-path} [-u {download-path-prefix}]

bin/hugegraph deploy -v 1.3.0 -p /export/cloud 
```



> hugegraph.properties

`{hugegraph_home}/conf/graphs/hugegraph.properties`

```ini
backend=mysql
serializer=mysql

store=hugegraph

# mysql backend config
jdbc.driver=com.mysql.cj.jdbc.Driver
#jdbc.url=jdbc:mysql://daas-01:3306
jdbc.url=jdbc:mysql://dataos-01:3306/hugegraph?allowPublicKeyRetrieval=true&useSSL=false
jdbc.username=hug_admin
jdbc.password=HugDBuser_1473
jdbc.reconnect_max_times=3
jdbc.reconnect_interval=3
jdbc.sslmode=false
```







> Load command

```shell
bin/hugegraph-loader -g {GRAPH_NAME} -f ${INPUT_DESC_FILE} -s ${SCHEMA_FILE} -h {HOST} -p {PORT}
```



> File example

```shell
sh bin/hugegraph-loader.sh -g hugegraph -f example/file/struct.json -s example/file/schema.groovy -h dlink-daas-11
```



> MySQL example

```shell
sh bin/hugegraph-loader.sh -g hugegraph -f example/mysql/struct.json -s example/mysql/schema.groovy -h dlink-daas-11
```

