

```shell
mvn -U clean install package -Prelease -Dmaven.test.skip=true -e
```



```ini
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Summary for dolphinscheduler 2.0.4-SNAPSHOT:
[INFO] 
[INFO] dolphinscheduler ................................... SUCCESS [  2.360 s]
[INFO] dolphinscheduler-spi ............................... SUCCESS [  4.673 s]
[INFO] dolphinscheduler-alert ............................. SUCCESS [  0.181 s]
[INFO] dolphinscheduler-alert-api ......................... SUCCESS [  1.930 s]
[INFO] dolphinscheduler-alert-plugins ..................... SUCCESS [  0.250 s]
[INFO] dolphinscheduler-alert-email ....................... SUCCESS [  2.594 s]
[INFO] dolphinscheduler-alert-wechat ...................... SUCCESS [  7.800 s]
[INFO] dolphinscheduler-alert-dingtalk .................... SUCCESS [  2.258 s]
[INFO] dolphinscheduler-alert-script ...................... SUCCESS [  2.884 s]
[INFO] dolphinscheduler-alert-http ........................ SUCCESS [ 13.255 s]
[INFO] dolphinscheduler-alert-feishu ...................... SUCCESS [  2.184 s]
[INFO] dolphinscheduler-alert-slack ....................... SUCCESS [  2.181 s]
[INFO] dolphinscheduler-alert-pagerduty ................... SUCCESS [  3.396 s]
[INFO] dolphinscheduler-alert-webexteams .................. SUCCESS [  2.201 s]
[INFO] dolphinscheduler-alert-telegram .................... SUCCESS [  8.562 s]
[INFO] dolphinscheduler-task-plugin ....................... SUCCESS [  0.154 s]
[INFO] dolphinscheduler-task-api .......................... SUCCESS [ 12.534 s]
[INFO] dolphinscheduler-common ............................ SUCCESS [  6.422 s]
[INFO] dolphinscheduler-remote ............................ SUCCESS [  9.328 s]
[INFO] dolphinscheduler-meter ............................. SUCCESS [  2.587 s]
[INFO] dolphinscheduler-dao ............................... SUCCESS [ 11.736 s]
[INFO] dolphinscheduler-alert-server ...................... SUCCESS [ 13.258 s]
[INFO] dolphinscheduler-registry .......................... SUCCESS [  6.482 s]
[INFO] dolphinscheduler-registry-api ...................... SUCCESS [  2.101 s]
[INFO] dolphinscheduler-registry-plugins .................. SUCCESS [  0.130 s]
[INFO] dolphinscheduler-registry-zookeeper ................ SUCCESS [  5.755 s]
[INFO] dolphinscheduler-task-shell ........................ SUCCESS [  6.282 s]
[INFO] dolphinscheduler-datasource-plugin ................. SUCCESS [  0.122 s]
[INFO] dolphinscheduler-datasource-api .................... SUCCESS [  8.173 s]
[INFO] dolphinscheduler-datasource-clickhouse ............. SUCCESS [  5.574 s]
[INFO] dolphinscheduler-datasource-db2 .................... SUCCESS [  5.879 s]
[INFO] dolphinscheduler-datasource-hive ................... SUCCESS [  6.269 s]
[INFO] dolphinscheduler-datasource-mysql .................. SUCCESS [  1.870 s]
[INFO] dolphinscheduler-datasource-oracle ................. SUCCESS [  5.388 s]
[INFO] dolphinscheduler-datasource-postgresql ............. SUCCESS [  6.372 s]
[INFO] dolphinscheduler-datasource-sqlserver .............. SUCCESS [  1.813 s]
[INFO] dolphinscheduler-datasource-redshift ............... SUCCESS [  5.283 s]
[INFO] dolphinscheduler-datasource-all .................... SUCCESS [  6.741 s]
[INFO] dolphinscheduler-task-datax ........................ SUCCESS [  9.040 s]
[INFO] dolphinscheduler-task-flink ........................ SUCCESS [  2.451 s]
[INFO] dolphinscheduler-task-http ......................... SUCCESS [  3.839 s]
[INFO] dolphinscheduler-task-mr ........................... SUCCESS [  6.854 s]
[INFO] dolphinscheduler-task-python ....................... SUCCESS [  4.150 s]
[INFO] dolphinscheduler-task-spark ........................ SUCCESS [  6.583 s]
[INFO] dolphinscheduler-task-sql .......................... SUCCESS [  5.507 s]
[INFO] dolphinscheduler-task-sqoop ........................ SUCCESS [  6.917 s]
[INFO] dolphinscheduler-task-procedure .................... SUCCESS [  4.415 s]
[INFO] dolphinscheduler-task-pigeon ....................... SUCCESS [  7.427 s]
[INFO] dolphinscheduler-task-dataquality .................. SUCCESS [  2.909 s]
[INFO] dolphinscheduler-task-seatunnel .................... SUCCESS [  4.696 s]
[INFO] dolphinscheduler-task-conditions ................... SUCCESS [  8.649 s]
[INFO] dolphinscheduler-task-dependent .................... SUCCESS [  2.212 s]
[INFO] dolphinscheduler-task-subprocess ................... SUCCESS [  8.989 s]
[INFO] dolphinscheduler-task-switch ....................... SUCCESS [  2.045 s]
[INFO] dolphinscheduler-task-emr .......................... SUCCESS [ 10.710 s]
[INFO] dolphinscheduler-task-blocking ..................... SUCCESS [  5.138 s]
[INFO] dolphinscheduler-task-all .......................... SUCCESS [  8.548 s]
[INFO] dolphinscheduler-service ........................... SUCCESS [ 16.251 s]
[INFO] dolphinscheduler-server ............................ SUCCESS [  3.590 s]
[INFO] dolphinscheduler-ui-next ........................... SUCCESS [02:32 min]
[INFO] dolphinscheduler-api ............................... SUCCESS [ 15.591 s]
[INFO] dolphinscheduler-log-server ........................ SUCCESS [ 11.671 s]
[INFO] dolphinscheduler-worker ............................ SUCCESS [ 15.185 s]
[INFO] dolphinscheduler-master ............................ SUCCESS [ 18.010 s]
[INFO] dolphinscheduler-python ............................ SUCCESS [03:07 min]
[INFO] dolphinscheduler-standalone-server ................. SUCCESS [ 15.314 s]
[INFO] dolphinscheduler-data-quality ...................... SUCCESS [15:32 min]
[INFO] dolphinscheduler-tools ............................. SUCCESS [  6.042 s]
[INFO] dolphinscheduler-dist .............................. SUCCESS [01:10 min]
[INFO] dolphinscheduler-microbench ........................ SUCCESS [  3.293 s]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  29:06 min
[INFO] Finished at: 2022-03-18T19:42:28+08:00
[INFO] ------------------------------------------------------------------------
```



Then check it in `./dolphinscheduler-dist/targer`
