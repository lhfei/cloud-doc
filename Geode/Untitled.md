



### Host

```ini
192.168.44.245	host-192-168-44-245
192.168.44.246	host-192-168-44-246
192.168.44.247	host-192-168-44-247
192.168.44.249	host-192-168-44-249
192.168.44.253	host-192-168-44-253
```



### Make work dirctory

Execute the following command on each node:

```sh
mkdir -p /export/geode_flyedw/

cd /export/geode_flyedw/

gfsh
```

The `gfsh` command prompt displays.

```
    _________________________     __
   / _____/ ______/ ______/ /____/ /
  / /  __/ /___  /_____  / _____  /
 / /__/ / ____/  _____/ / /    / /
/______/_/      /______/_/    /_/    1.8

Monitor and Manage Apache Geode
gfsh>
```



### Start Locators

Start two locators [`locator_253`, `locator_249`] using the command in the following example:



>host-192-168-44-253

```sh
gfsh>start locator --name=locator_253 --port=10334 --locators=host-192-168-44-253[10334],host-192-168-44-249[10334]
```



> host-192-168-44-249

```sh
gfsh>start locator --name=locator_249 --port=10334 --locators=host-192-168-44-253[10334],host-192-168-44-249[10334]
```



```sh
gfsh>list members
   Name     | Id
----------- | ----------------------------------------------------------------------
locator_249 | 192.168.44.249(locator_249:236343:locator)<ec><v3>:41000
locator_253 | 192.168.44.253(locator_253:160103:locator)<ec><v0>:41000 [Coordinator]
```



### Start Servers

Start Apache Geode servers using the commands in the following example:

> host-192-168-44-253

```sh
gfsh>start server --name=server_253 --server-port=40401 --locators=host-192-168-44-253[10334],host-192-168-44-249[10334]
```



> host-192-168-44-249

```sh
gfsh>start server --name=server_249 --server-port=40401 --locators=host-192-168-44-253[10334],host-192-168-44-249[10334]
```



```sh
gfsh>list members
   Name     | Id
----------- | ----------------------------------------------------------------------
locator_249 | 192.168.44.249(locator_249:236343:locator)<ec><v3>:41000
locator_253 | 192.168.44.253(locator_253:160103:locator)<ec><v0>:41000 [Coordinator]
server_249  | 192.168.44.249(server_249:236503)<v5>:41001
server_253  | 192.168.44.253(server_253:160468)<v4>:41001
```



### Add Nodes

> host-192-168-44-247

```sh
gfsh>start locator --name=locator_247 --port=10334 --locators=host-192-168-44-253[10334],host-192-168-44-249[10334]
```



```sh
start server --name=server_247 --server-port=40401 --locators=host-192-168-44-253[10334],host-192-168-44-249[10334]
```



```sh
gfsh>list members
   Name     | Id
----------- | ----------------------------------------------------------------------
locator_247 | 192.168.44.247(locator_247:178246:locator)<ec><v6>:41000
locator_249 | 192.168.44.249(locator_249:236343:locator)<ec><v3>:41000
locator_253 | 192.168.44.253(locator_253:160103:locator)<ec><v0>:41000 [Coordinator]
server_247  | 192.168.44.247(server_247:178790)<v7>:41001
server_249  | 192.168.44.249(server_249:236503)<v5>:41001
server_253  | 192.168.44.253(server_253:160468)<v4>:41001
```



### Create Regions

Create some regions using the commands in the following example:

> host-192-168-44-253

```sh

gfsh>create region --name=region_253 --type=REPLICATE_PERSISTENT
  Member   | Status
---------- | --------------------------------------------
server_247 | Region "/region_253" created on "server_247"
server_249 | Region "/region_253" created on "server_249"
server_253 | Region "/region_253" created on "server_253"
```



> host-192-168-44-249

```sh
gfsh>create region --name=region_249 --type=REPLICATE_PERSISTENT
  Member   | Status
---------- | --------------------------------------------
server_247 | Region "/region_249" created on "server_247"
server_249 | Region "/region_249" created on "server_249"
server_253 | Region "/region_249" created on "server_253"
```

```sh
gfsh>describe region --name=region_253
..........................................................
Name            : region_253
Data Policy     : persistent replicate
Hosting Members : server_249
                  server_247
                  server_253
```



> host-192-168-44-247

```sh
gfsh>create region --name=region_247 --type=REPLICATE_PERSISTENT
  Member   | Status
---------- | --------------------------------------------
server_247 | Region "/region_247" created on "server_247"
server_249 | Region "/region_247" created on "server_249"
server_253 | Region "/region_247" created on "server_253"
```



Now you can check it on host `host-192-168-44-247` and `host-192-168-44-249`.

> host-192-168-44-247

```sh
gfsh>list regions
List of regions
---------------
region_247
region_249
region_253
```

> host-192-168-44-249

```sh
gfsh>list regions
List of regions
---------------
region_247
region_249
region_253
```



### Export Cluster configurations

Export the cluster configuration. You can use the `gfsh export cluster-configuration`command to create a zip file that contains the cluster’s persisted configuration. The zip file contains a copy of the contents of the `cluster_config` directory. For example:

> host-192-168-44-253

```sh
gfsh>export cluster-configuration --zip-file-name=/export/geode_flyedw/clusterConfig.zip
File saved to /export/geode_flyedw/clusterConfig.zip
```

Download and unzip the `clusterConfig.zip` file, it include  two files, `cluster.properties` and `cluster.xml`



- [x] cluster.xml

```xml
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<cache xmlns="http://geode.apache.org/schema/cache" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" copy-on-read="false" is-server="false" lock-lease="120" lock-timeout="60" search-timeout="300" version="1.0" xsi:schemaLocation="http://geode.apache.org/schema/cache http://geode.apache.org/schema/cache/cache-1.0.xsd">
<region name="region_253">
    <region-attributes data-policy="persistent-replicate" scope="distributed-ack"/>
  </region>
<region name="region_249">
    <region-attributes data-policy="persistent-replicate" scope="distributed-ack"/>
  </region>
<region name="region_247">
    <region-attributes data-policy="persistent-replicate" scope="distributed-ack"/>
  </region>
</cache>
```



- [x] cluster.properties

```properties

```



### Start a new Locator

Start a new locator as name `locator_246` on host `host-192-168-44-246`. Then import the cluster configuration using the `import cluster-configuration` command. For example:

> host-192-168-44-246

```sh
>gfsh start locator --name=locator_246 --port=10334 --locators=host-192-168-44-253[10334],host-192-168-44-249[10334]

gfsh>list members
   Name     | Id
----------- | ----------------------------------------------------------------------
locator_246 | 192.168.44.246(locator_246:150837:locator)<ec><v0>:41000 [Coordinator]
```



```sh
gfsh>import cluster-configuration --zip-file-name=/export/geode_flyedw/clusterConfig.zip
This command will replace the existing cluster configuration, if any, The old configuration will be backed up in the working directory.

Continue?  (Y/n): y
Cluster configuration successfully imported.
```



Can be verified by the following command:

```sh
gfsh>list members
   Name     | Id
----------- | ---------------------------------------------------------
locator_246 | 192.168.44.246(locator_246:151959:locator)<ec><v6>:41000
locator_247 | 192.168.44.247(locator_247:184351:locator)<ec><v2>:41000
locator_249 | 192.168.44.249(locator_249:242505:locator)<ec><v1>:41000
locator_253 | 192.168.44.253(locator_253:169883:locator)<ec><v14>:41000
server_247  | 192.168.44.247(server_247:184499)<v5>:41001
server_249  | 192.168.44.249(server_249:242626)<v4>:41001
server_253  | 192.168.44.253(server_253:170044)<v15>:41001
```



