### Start Master Server



> Coordinator

```shell
java `cat conf/druid/coordinator/jvm.config | xargs` -cp conf/druid/_common:conf/druid/coordinator:lib/* org.apache.druid.cli.Main server coordinator
```



> Overlord

```shell
java `cat conf/druid/overlord/jvm.config | xargs` -cp conf/druid/_common:conf/druid/overlord:lib/* org.apache.druid.cli.Main server overlord
```



### Start Data Server



> Historical

```shell
java `cat conf/druid/historical/jvm.config | xargs` -cp conf/druid/_common:conf/druid/historical:lib/* org.apache.druid.cli.Main server historical
```



> MiddleManager

```shell
java `cat conf/druid/middleManager/jvm.config | xargs` -cp conf/druid/_common:conf/druid/middleManager:lib/* org.apache.druid.cli.Main server middleManager
```



### Start Query Server



```shell
java `cat conf/druid/broker/jvm.config | xargs` -cp conf/druid/_common:conf/druid/broker:lib/* org.apache.druid.cli.Main server broker
```



> optional

```shell
java `cat conf/druid/router/jvm.config | xargs` -cp conf/druid/_common:conf/druid/router:lib/* org.apache.druid.cli.Main server router
```

