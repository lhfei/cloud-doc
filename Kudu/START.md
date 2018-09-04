#### START

##### kudu-master

```
kudu-master --use_hybrid_clock=false -fs_wal_dir /home/export/kudu-master
```



##### kudu-tserver

```
kudu-master --use_hybrid_clock=false -fs_wal_dir /home/export/kudu-tserver
```



