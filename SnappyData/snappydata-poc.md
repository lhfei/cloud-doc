

```
/export/app_workspaces/snappy-poc/assembly/build/libs/snappy-poc-1.0.0-assembly.jar
```



```shell
cd $SNAPPY_HOME

./bin/snappy-job.sh submit --lead host-10-182-74-10:8090 --app-name AdAnalytics --class io.snappydata.adanalytics.SnappySQLLogAggregatorJob --app-jar /export/app_workspaces/snappy-poc/assembly/build/libs/snappy-poc-1.0.0-assembly.jar --stream

-------------------------------------------------------------------------------------
OKOK{
  "status": "STARTED",
  "result": {
    "jobId": "58183ee5-e15a-4b8e-adc3-138eb9fcfdf7",
    "context": "snappyStreamingContext1541663286944503452"
  }
}
```

