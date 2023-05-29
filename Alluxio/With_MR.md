











### Example



> HDFS

```sh
hdfs dfs -mkdir /alluxio

hdfs fds -chown -R root:root /alluxio
```



> Alluxio

```sh
/bin/alluxio fs mkdir /testAlluxio/data/
```



> Mount it

```sh
./bin/alluxio fs mount --shared /testAlluxio/data/mllib hdfs://a01-r03-i164-101-515w96w.test.local:8020/data/mllib
Mounted hdfs://a01-r03-i164-101-515w96w.test.local:8020/data/mllib at /testAlluxio/data/mllib
```



> FS 

```sh
hdfs dfs -libjars /export/cloud/alluxio-1.8.1/client/alluxio-1.8.1-client.jar -ls alluxio://a01-r03-i164-101-515w96w.test.local:19998/testAlluxio/data/mllib/
```





```shell
hadoop jar /usr/hdp/3.0.1.0-187/hadoop-mapreduce/hadoop-mapreduce-examples-3.1.1.3.0.1.0-187.jar wordcount -libjars /export/cloud/alluxio-1.8.1/client/alluxio-1.8.1-client.jar alluxio://a01-r03-i164-101-515w96w.test.local:19998/testAlluxio/data/mllib/kmeans_data.txt  alluxio://a01-r03-i164-101-515w96w.test.local:19998/testAlluxio/data/mllib/kmeans_data_wc_output.txt
```

