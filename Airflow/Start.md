



### Stop

#### Scheduler

```shell
kill $(ps -ef | grep "airflow scheduler" | awk '{print $2}')
```





```shell
kill $(lsof -i :11100 | awk '{print $2}')
```

