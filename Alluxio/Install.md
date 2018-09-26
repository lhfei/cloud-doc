

### Hosts

```
10.182.99.10     host-10-182-99-10
10.182.99.100    host-10-182-99-100
10.182.99.101    host-10-182-99-101
10.182.99.102    host-10-182-99-102
10.182.99.103    host-10-182-99-103
```



### Start | Stop

```
./bin/alluxio-start.sh local SudoMount

./bin/alluxio-start.sh worker SudoMount
```



### Mount

```
./bin/alluxio fs mount --shared alluxio://host-10-182-99-10:19998/user  hdfs://host-10-182-93-182:8020/user/  
```

