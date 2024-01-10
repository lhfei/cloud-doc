



> capacity-scheduler.xml

```xml
<property>
    <name>yarn.scheduler.capacity.resource-calculator</name>
    <value>org.apache.hadoop.yarn.util.resource.DominantResourceCalculator</value>
    <description>DefaultResourceCalculator只能计算内存相关的信息，DominantResourceCalculator可以统计core和内存的信息</description>
</property>
```



> yarn-site.xml

```xml
<property>
    <name>yarn.scheduler.minimum-allocation-mb</name>
    <value>1024</value>
    <description>每个Container最少可以都要分配1G内存</description>
</property>

<property>
    <name>yarn.scheduler.maximum-allocation-mb</name>
    <value>12288</value>
    <description>每个Container最多可以使用12G内存，这意味着如果某个Container启动后占用了12G即NodeManager可以使用的全部内存后，在该NodeManager上将无法再启动任何一个Container</description>
</property>

<property>
    <name>yarn.scheduler.minimum-allocation-vcores</name>
    <value>1</value>
    <description>每个Container最少可以使用1个虚拟CPU</description>
</property>

<property>
    <name>yarn.scheduler.maximum-allocation-vcores</name>
    <value>8</value>
    <description>每个Container最多可以使用8个虚拟CPU</description>
</property>

<property>
    <name>yarn.scheduler.increment-allocation-mb</name>
    <value>1024</value>
    <description>内存规整化单位，意味着分配给某个Container的内存一定是1024即1G的倍数，例如某个Container实际需要1.5G内存，那么就给它2G</description>
</property>

<property>
    <name>yarn.nodemanager.vmem-pmem-ratio</name>
    <value>2.1</value>
    <description>NodeManager每使用1单位的物理内存，就会使用2.1倍的虚拟内存，例如NodeManager使用了1G物理内存，那么表现为虚拟内存是2.1G，当分配的虚拟内存大于的物理内存的2.1倍后，抛出异常</description>
</property>
```

以上配置生效后，yarn集群可用的内存为12GB * 6 = 72GB，可用虚拟core个数为 8 * 6 = 48，重启yarn集群查看资源：



Spark on YARN 资源配置:

```ini
(1) 配置ApplicationMaster使用的堆外内存

- Client模式：spark.yarn.am.memoryOverhead
- Cluster模式：spark.driver.memoryOverhead

(2) 配置Executor使用的堆外内存 Client和Cluster模式用同一个参数：spark.executor.memoryOverhead

(3)  设置 ApplicationMaster 使用的内存

- Client：spark.yarn.am.memory
- Cluster：spark.driver.memory 或者 --driver-memory

(4) 设置 ApplicationMaster 使用的vcore

- Client：spark.yarn.am.cores
- Cluster：spark.driver.cores 或者 --driver-cores

(5) 设置 Executor使用的内存（Client和Cluster通用）： spark.executor.memory或者--executor-memory

(6) 设置 Executor使用的vcore（Client和Cluster通用）： spark.executor.cores或者--executor-cores

(7) 设置启动 Executor的个数（Client和Cluster通用）： spark.executor.instances或者--num-executors
```



**具体说明**

1.基础概念

要掌握这个知识点，要了解以下几个点：

spark driver和executor的on-heap内存是如何配置的。

spark driver和excutor的off-heap内存是如何配置的。

yarn的最小调度单元。

首先，讲一下上面的这三个概念吧：

1). spark.driver.memory

默认值1g。driver进程的on-heap内存，driver进程就是sparkcontext初始化所在的进程。在client模式下driver的堆内存，不要通过SparkConf设置，要用—driver-memory命令替换，或者在默认的配置文件里配置。

2). spark.driver.memoryOverhead

默认值是max(DriverMemory*0.1,384m)。在YARN或者kubernetes模式的cluster模式下，driver端申请的off-heap内存的总量，通常是driver堆内存的6%-10%。

3). spark.executor.memory

默认值1g。Executor的jvm内存总量。

4). spark.executor.memoryOverhead

默认值max(executor*0.1,384).单个executor申请的off-heap内存的总量。该参数仅仅支持在yarn或者kubernetes上使用，通常可以是executor内存的0.06-0.1。

5).spark.yarn.am.memory

默认值512m，Appmaster在client模式下的内存。假如是Cluster模式下会使用spark.driver.memory来代替。

6).Yarn的最小调度单元

yarn调度container有个最小粒度，字段调度的时候必须是其整数倍，最小粒度的配置参数是

yarn.scheduler.minimum-allocation-mb 最小调度单元默认值是1024，单位是mb。

2.以cluster模式为例 ![INFO-spark on yarn 内存分配 - 图1](https://study.sf.163.com/documents/uploads/projects/service_support/202209/1716dcd358eb3a42.png) 

这里的案例是40个executor，单个executor内存申请的时候是20GB，driver是20GB，yarn的web ui截图如下： 个APP申请的总内存是 923648MB=902GB。

spark app申请的单个 Executor内存，从1.3和1.4可以得知是：

20GB * 0.1 +20GB=22GB 那么40个executor内存是：

22GB * 40 = 880GB spark on yarn 的cluster模式下Driver端与appmaster是在一起的，所以appmaster内存参数无效，因此driver和executor总内存由1.1和1.2可得：

20GB * 0.1 +20GB=22G 那么计算所得的总内存是：

22GB+88 GB正好是 902GB。 上面计算的案例中，由于浪院长这里的yarn集群内存调度的最小粒度是1GB貌似，在上面的计算中没有参与度。

3.注释

spark.yarn.am.memory默认值512m，Appmaster在client模式下的内存。假如是Cluster模式下会使用spark.driver.memory来代替。

在client模式下，AM对应的Container内存由spark.yarn.am.memory加上spark.yarn.am.memoryOverhead来确定，executor加上spark.yarn.executor.memoryOverhead的值之后确定对应Container需要申请的内存大小，driver和executor的内存加上spark.yarn.driver.memoryOverhead或spark.yarn.executor.memoryOverhead的值之后再乘以0.54确定storage memory内存大小。在YARN中，Container申请的内存大小必须为yarn.scheduler.minimum-allocation-mb的整数倍。

