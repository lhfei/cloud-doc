

#### 1 hoodie only support org.apache.spark.serializer.KryoSerializer as spark.serializer

```ini
org.apache.hudi.exception.HoodieException : hoodie only support org.apache.spark.serializer.KryoSerializer as spark.serializer

在Spark中配置Hudi需要的Kyro序列化器：spark.serializer=org.apache.spark.serializer.KryoSerializer
```

```ini

```



2 Table is marked as a managed table but is not transactional

```ini
Table is marked as a managed table but is not transactional
```

方式一：hive[命令行](https://so.csdn.net/so/search?q=命令行&spm=1001.2101.3001.7020)关闭（临时关闭）

```bash
set hive.strict.managed.tables=false
1
```

方式二：hive-site.xml中关闭（永久关闭）

```shell
hive.strict.managed.tables=false
```