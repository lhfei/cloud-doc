

### Nodes

```ini
100.83.196.61:10101
100.83.209.128:10101
100.83.209.133:10101
```

A three node cluster running on different hosts could be minimally configured as follows:

> Node 1 **[Coordinator]**

```toml
data-dir = "/home/admin/app_data/pilosa/data"
bind = "0.0.0.0:10101"

[gossip]
  port = 12000
  seeds = ["100.83.196.61:12000"]

[cluster]
  replicas = 1
  coordinator = true

[handler]
allowed-origins = ["http://192.168.1.100:8000"]
```



> Node 2

```toml
data-dir = "/home/admin/app_data/pilosa/data"
bind = "0.0.0.0:10101"

[gossip]
  port = 12000
  seeds = ["100.83.196.61:12000"]

[cluster]
  replicas = 1
  coordinator = false

[handler]
allowed-origins = ["http://192.168.1.100:8000"]
```



> Node 3

```toml
data-dir = "/home/admin/app_data/pilosa/data"
bind = "0.0.0.0:10101"

[gossip]
  port = 12000
  seeds = ["100.83.196.61:12000"]

[cluster]
  replicas = 1
  coordinator = false

[handler]
allowed-origins = ["http://192.168.1.100:8000"]
```



#### Running the Cluster

Let’s open three terminal windows and run each node in its own window. This will enable us to better observe what’s happening on each node.

Switch to the first terminal window, change to the project directory and start the first node:

```shell
cd $HOME/pilosa-tls-tutorial
pilosa server -c node1.config.toml
```

Switch to the second terminal window, change to the project directory and start the second node:

```shell
cd $HOME/pilosa-tls-tutorial
pilosa server -c node2.config.toml
```

Switch to the third terminal window, change to the project directory and start the third node:

```shell
cd $HOME/pilosa-tls-tutorial
pilosa server -c node3.config.toml
```

Let’s ensure that all three Pilosa servers are running and they are connected:

```ini
sudo curl -k --ipv4 http://100.83.196.61:10101/status
{"state":"STARTING","nodes":[{"id":"369ca494-2aa7-42f4-af68-ffec64f76319","uri":{"scheme":"http","host":"100.83.209.133","port":10101},"isCoordinator":false,"state":"DOWN"},{"id":"97738996-a59d-47e6-b821-5538e45a5055","uri":{"scheme":"http","host":"100.83.196.61","port":10101},"isCoordinator":true,"state":"READY"},{"id":"9fbfdcb3-af7e-4c0d-bf58-bba11ff83442","uri":{"scheme":"http","host":"100.83.209.128","port":10101},"isCoordinator":false,"state":"DOWN"}],"localID":"97738996-a59d-47e6-b821-5538e45a5055"}
```

The `-k` flag is used to tell curl that it shouldn’t bother checking the certificate the server provides, and the `--ipv4` flag avoids an issue on MacOS where the curl request takes a long time if the address resolves to `127.0.0.1`. You can leave it out on Linux and WSL.

If everything is set up correctly, the cluster state should be `NORMAL`.



