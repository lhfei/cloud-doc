

### Hosts

```ini
TiDB: 192.168.100.3, 192.168.100.4, 192.168.100.5 

PD:   192.168.100.6, 192.168.100.7, 192.168.100.8 

TiKV: 192.168.100.9, 192.168.100.10, 192.168.100.11
```



### 运行pd

注意 需要在很短时间将几个pd-server同时运行起来，否则会造成找不到的状况，然后一个一个出错退出。 1) pd1（在192.168.100.6这台主机上运行）

```sh
pd-server --cluster-id=1 \
	--addr="192.168.100.6:1234" \
	--advertise-addr="192.168.100.6:1234" \
	--http-addr="192.168.100.6:9090" \
	--etcd-name=pd1 \
	--etcd-advertise-client-url="http://192.168.100.6:2379" \
	--etcd-advertise-peer-url="http://192.168.100.6:2380" \ 
	--etcd-initial-cluster="pd1=http://192.168.100.6:2380,pd2=http://192.168.100.7:2380,pd3=http://192.168.100.8:2380" \
	--etcd-listen-peer-url="http://192.168.100.6:2380" \
	--etcd-listen-client-url="http://192.168.100.6:2379"
```

2) pd2（在192.168.100.7这台主机上运行）

```sh
pd-server --cluster-id=1 \      --addr="192.168.100.7:1234" \      --advertise-addr="192.168.100.7:1234" \      --http-addr="192.168.100.7:9090" \      --etcd-name=pd2 \      --etcd-advertise-client-url="http://192.168.100.7:2379" \      --etcd-advertise-peer-url="http://192.168.100.7:2380" \      --etcd-initial-cluster="pd1=http://192.168.100.6:2380,pd2=http://192.168.100.7:2380,pd3=http://192.168.100.8:2380" \      --etcd-listen-peer-url="http://192.168.100.7:2380" \      --etcd-listen-client-url="http://192.168.100.7:2379"
```

3) pd3（在192.168.100.8这台主机上运行）

```sh
pd-server --cluster-id=1 \      --addr="192.168.100.8:1234" \      --advertise-addr="192.168.100.8:1234" \      --http-addr="192.168.100.8:9090" \      --etcd-name=pd3 \      --etcd-advertise-client-url="http://192.168.100.8:2379" \      --etcd-advertise-peer-url="http://192.168.100.8:2380" \      --etcd-initial-cluster="pd1=http://192.168.100.6:2380,pd2=http://192.168.100.7:2380,pd3=http://192.168.100.8:2380" \      --etcd-listen-peer-url="http://192.168.100.8:2380" \      --etcd-listen-client-url="http://192.168.100.8:2379"
```



由于TiKV依赖于RocksDB，所以需要先安装RocksDB。

注意 TiKV二进制文件tikv-server可以在一台主机上编译了放到其它主机上运行，但是RocksDB好像不可以。 所以每一台主机上都需要进行一次RocksDB的安装。

1）安装RocksDB 在 192.168.100.9, 192.168.100.10, 192.168.100.11 这三台主机上，分别进行RocksDB的安装。 2）将编译过后的tikv-server文件分发到上面三台主机上，放到系统PATH目录中。 3）运行TiKV

```sh
# 在192.168.100.9这台主机上运行tikv-server -S raftkv --addr 192.168.100.9:5050 --etcd 192.168.100.6:2379,192.168.100.7:2379,192.168.100.8:2379 -s /data --cluster-id 1 # 在192.168.100.10这台主机上运行tikv-server -S raftkv --addr 192.168.100.10:5050 --etcd 192.168.100.6:2379,192.168.100.7:2379,192.168.100.8:2379 -s /data --cluster-id 1 # 在192.168.100.11这台主机上运行tikv-server -S raftkv --addr 192.168.100.11:5050 --etcd 192.168.100.6:2379,192.168.100.7:2379,192.168.100.8:2379 -s /data --cluster-id 1
```



将tidb-server分发到192.168.100.3, 192.168.100.4, 192.168.100.5这三台主机上去，放置于类似/usr/local/bin目录中。

在这三台主机上都运行如下命令：

```sh
tidb-server --store=tikv --path="192.168.100.6:2379,192.168.100.7:2379,192.168.100.8:2379/pd?cluster=1" -lease 1 -P 3306
```



三台TiDB同时运行，三者互不干涉，需要一个反向代理来进行负载均衡与流量分发。这里使用的是Nginx 1.10.1来进行TCP反向代理。

------



在任意一台机器上，使用MySQL客户端，访问集群，效果如下所示。 ![最终效果图](https://static.oschina.net/uploads/img/201607/26174728_cfwL.png)



折腾了大半天，终于跑了起来。测试后续补充。

相对于CockroachDB的开箱即用，TiDB的部署还是相对麻烦一些。不过，总体来说，还是比较简单的，只是官方文档现在(2016/07/26)也不齐全，而且仅有单机模式的部署说明。