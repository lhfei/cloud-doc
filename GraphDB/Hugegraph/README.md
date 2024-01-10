#### 4.1 准备数据

顶点文件：`example/file/vertex_person.csv`

```csv
name,age,city
marko,29,Beijing
vadas,27,Hongkong
josh,32,Beijing
peter,35,Shanghai
"li,nary",26,"Wu,han"
tom,null,NULL
```



顶点文件：`example/file/vertex_software.txt`

```text
id|name|lang|price|ISBN
1|lop|java|328|ISBN978-7-107-18618-5
2|ripple|java|199|ISBN978-7-100-13678-5
```



边文件：`example/file/edge_knows.json`

```json
{"source_name": "marko", "target_name": "vadas", "date": "20160110", "weight": 0.5}
{"source_name": "marko", "target_name": "josh", "date": "20130220", "weight": 1.0}
```



边文件：`example/file/edge_created.json`

```json
{"aname": "marko", "bname": "lop", "date": "20171210", "weight": 0.4}
{"aname": "josh", "bname": "lop", "date": "20091111", "weight": 0.4}
{"aname": "josh", "bname": "ripple", "date": "20171210", "weight": 1.0}
{"aname": "peter", "bname": "lop", "date": "20170324", "weight": 0.2}
```



#### 4.2 编写 schema

点击展开/折叠 schema 文件：example/file/schema.groovy

```groovy
schema.propertyKey("name").asText().ifNotExist().create();
schema.propertyKey("age").asInt().ifNotExist().create();
schema.propertyKey("city").asText().ifNotExist().create();
schema.propertyKey("weight").asDouble().ifNotExist().create();
schema.propertyKey("lang").asText().ifNotExist().create();
schema.propertyKey("date").asText().ifNotExist().create();
schema.propertyKey("price").asDouble().ifNotExist().create();

schema.vertexLabel("person").properties("name", "age", "city").primaryKeys("name").ifNotExist().create();
schema.vertexLabel("software").properties("name", "lang", "price").primaryKeys("name").ifNotExist().create();

schema.indexLabel("personByAge").onV("person").by("age").range().ifNotExist().create();
schema.indexLabel("personByCity").onV("person").by("city").secondary().ifNotExist().create();
schema.indexLabel("personByAgeAndCity").onV("person").by("age", "city").secondary().ifNotExist().create();
schema.indexLabel("softwareByPrice").onV("software").by("price").range().ifNotExist().create();

schema.edgeLabel("knows").sourceLabel("person").targetLabel("person").properties("date", "weight").ifNotExist().create();
schema.edgeLabel("created").sourceLabel("person").targetLabel("software").properties("date", "weight").ifNotExist().create();

schema.indexLabel("createdByDate").onE("created").by("date").secondary().ifNotExist().create();
schema.indexLabel("createdByWeight").onE("created").by("weight").range().ifNotExist().create();
schema.indexLabel("knowsByWeight").onE("knows").by("weight").range().ifNotExist().create();

```



#### 4.3 编写输入源映射文件`example/file/struct.json`

```json
{
  "vertices": [
    {
      "label": "person",
      "input": {
        "type": "file",
        "path": "example/file/vertex_person.csv",
        "format": "CSV",
        "header": ["name", "age", "city"],
        "charset": "UTF-8",
        "skipped_line": {
          "regex": "(^#|^//).*"
        }
      },
      "null_values": ["NULL", "null", ""]
    },
    {
      "label": "software",
      "input": {
        "type": "file",
        "path": "example/file/vertex_software.txt",
        "format": "TEXT",
        "delimiter": "|",
        "charset": "GBK"
      },
      "id": "id",
      "ignored": ["ISBN"]
    }
  ],
  "edges": [
    {
      "label": "knows",
      "source": ["source_name"],
      "target": ["target_name"],
      "input": {
        "type": "file",
        "path": "example/file/edge_knows.json",
        "format": "JSON",
        "date_format": "yyyyMMdd"
      },
      "field_mapping": {
        "source_name": "name",
        "target_name": "name"
      }
    },
    {
      "label": "created",
      "source": ["source_name"],
      "target": ["target_id"],
      "input": {
        "type": "file",
        "path": "example/file/edge_created.json",
        "format": "JSON",
        "date_format": "yyyy-MM-dd"
      },
      "field_mapping": {
        "source_name": "name"
      }
    }
  ]
}

```



#### 4.4 执行命令导入

```shell
sh bin/hugegraph-loader.sh -g hugegraph -f example/file/struct.json -s example/file/schema.groovy
```



导入结束后，会出现类似如下统计信息：

```bash
vertices/edges has been loaded this time : 8/6
--------------------------------------------------
count metrics
     input read success            : 14
     input read failure            : 0
     vertex parse success          : 8
     vertex parse failure          : 0
     vertex insert success         : 8
     vertex insert failure         : 0
     edge parse success            : 6
     edge parse failure            : 0
     edge insert success           : 6
     edge insert failure           : 0
```