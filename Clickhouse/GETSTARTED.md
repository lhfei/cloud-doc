### Dataset

```sh
#download database

for s in `seq 1987 2017`
do
for m in `seq 1 12`
do
wget http://transtats.bts.gov/PREZIP/On_Time_On_Time_Performance_${s}_${m}.zip
done
done
```



### Client Connect

```shell
clickhouse-client -m -u default --password Lhfei -h 10.182.57.104
```



```shell
clickhouse-client -m -u default --password Lhfei -h 10.182.57.106
```

