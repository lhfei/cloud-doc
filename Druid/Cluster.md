



#### Master Server

port: 8081

#### Query Server

port: 8888





#### Shutdown

```shell
for pid in `pgrep -u druid`; do kill -9 $pid; done;
```

