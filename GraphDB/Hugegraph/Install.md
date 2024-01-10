

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

