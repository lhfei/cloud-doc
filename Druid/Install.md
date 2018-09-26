



```sh
java `cat examples/conf/druid/coordinator/jvm.config | xargs` -cp "examples/conf/druid/_common:examples/conf/druid/_common/hadoop-xml:examples/conf/druid/coordinator:lib/*" io.druid.cli.Main server coordinator
java `cat examples/conf/druid/overlord/jvm.config | xargs` -cp "examples/conf/druid/_common:examples/conf/druid/_common/hadoop-xml:examples/conf/druid/overlord:lib/*" io.druid.cli.Main server overlord
java `cat examples/conf/druid/historical/jvm.config | xargs` -cp "examples/conf/druid/_common:examples/conf/druid/_common/hadoop-xml:examples/conf/druid/historical:lib/*" io.druid.cli.Main server historical
java `cat examples/conf/druid/middleManager/jvm.config | xargs` -cp "examples/conf/druid/_common:examples/conf/druid/_common/hadoop-xml:examples/conf/druid/middleManager:lib/*" io.druid.cli.Main server middleManager
java `cat examples/conf/druid/broker/jvm.config | xargs` -cp "examples/conf/druid/_common:examples/conf/druid/_common/hadoop-xml:examples/conf/druid/broker:lib/*" io.druid.cli.Main server broker
```

