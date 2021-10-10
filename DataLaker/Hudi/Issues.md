### 1 Name is null

```ini
Caused by: org.apache.flink.util.FlinkRuntimeException: Failed to start the operator coordinators
        at org.apache.flink.runtime.scheduler.SchedulerBase.startAllOperatorCoordinators(SchedulerBase.java:1258) ~[flink-dist_2.12-1.12.2.jar:1.12.2]
        at org.apache.flink.runtime.scheduler.SchedulerBase.startScheduling(SchedulerBase.java:624) ~[flink-dist_2.12-1.12.2.jar:1.12.2]
        at org.apache.flink.runtime.jobmaster.JobMaster.startScheduling(JobMaster.java:1032) ~[flink-dist_2.12-1.12.2.jar:1.12.2]
        at java.util.concurrent.CompletableFuture.uniRun(CompletableFuture.java:719) ~[?:1.8.0_301]
        ... 29 more
Caused by: java.lang.NullPointerException: Name is null
        at java.lang.Enum.valueOf(Enum.java:236) ~[?:1.8.0_301]
        at org.apache.hudi.metrics.MetricsReporterType.valueOf(MetricsReporterType.java:24) ~[hudi-flink-bundle_2.12-0.9.0.jar:0.9.0]
        at org.apache.hudi.config.HoodieMetricsConfig$Builder.build(HoodieMetricsConfig.java:262) ~[hudi-flink-bundle_2.12-0.9.0.jar:0.9.0]
        at org.apache.hudi.config.HoodieWriteConfig$Builder.setDefaults(HoodieWriteConfig.java:2085) ~[hudi-flink-bundle_2.12-0.9.0.jar:0.9.0]
        at org.apache.hudi.config.HoodieWriteConfig$Builder.build(HoodieWriteConfig.java:2120) ~[hudi-flink-bundle_2.12-0.9.0.jar:0.9.0]
        at org.apache.hudi.util.StreamerUtil.getHoodieClientConfig(StreamerUtil.java:195) ~[hudi-flink-bundle_2.12-0.9.0.jar:0.9.0]
        at org.apache.hudi.util.StreamerUtil.createWriteClient(StreamerUtil.java:317) ~[hudi-flink-bundle_2.12-0.9.0.jar:0.9.0]
        at org.apache.hudi.sink.StreamWriteOperatorCoordinator.start(StreamWriteOperatorCoordinator.java:153) ~[hudi-flink-bundle_2.12-0.9.0.jar:0.9.0]
        at org.apache.flink.runtime.operators.coordination.OperatorCoordinatorHolder.start(OperatorCoordinatorHolder.java:189) ~[flink-dist_2.12-1.12.2.ja
```

- resolved

  [HUDI-2321] Use the caller classloader for ReflectionUtils ([#3535](https://github.com/apache/hudi/pull/3535))

  ```
  Based on the discussion on stackoverflow:
  https://stackoverflow.com/questions/1771679/difference-between-threads-context-class-loader-and-normal-classloader
  
  The Thread.currentThread().getContextClassLoader() should never be used
  because the context classloader is not immutable, user can overwrite it
  when thread switches, it is also nullable.
  
  The objection here: https://stackoverflow.com/a/36228195 says the
  Thread.currentThread().getContextClassLoader() is a JDK design error
  and the context classloader is never suggested to be used. The API that
  needs classloader should ask the user to set up the right classloader.
  ```

  [Detail](https://github.com/apache/hudi/commit/0f39137ba854a2f808e2108c6aa10f4260b00844)

  

