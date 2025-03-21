# Architecture and Components

Geode’s management and monitoring system consists of one JMX Manager node (there should only be one) and one or more managed nodes within a distributed system. All members in the distributed system are manageable through MBeans and Geode Management Service APIs.

## Architecture

The following diagram depicts the architecture of the management and monitoring system components.

![](images/JMX_Architecture.svg)

In this architecture every Geode member is manageable. All Geode MBeans for the local Geode processes are automatically registered in the Platform MBeanServer (the default MBeanServer of each JVM that hosts platform MXBeans.)

## Managed Node

Each member of a distributed system is a managed node. Any node that is not currently also acting as a JMX Manager node is referred to simply as a managed node. A managed node has the following resources so that it can answer JMX queries both locally and remotely:

- Local MXBeans that represent the locally monitored components on the node. See [List of Geode JMX MBeans](https://geode.apache.org/docs/guide/11/managing/management/list_of_mbeans.html#topic_4BCF867697C3456D96066BAD7F39FC8B) for a list of possible MXBeans existing for the managed node.
- Built-in platform MBeans.

## JMX Manager Node

A JMX Manager node is a member that can manage other Geode members –that is, other managed nodes – as well as itself. A JMX Manager node can manage all other members in the distributed system.

To convert a managed node to a JMX Manager node, you configure the Geode property `jmx-manager=true`, in the `gemfire.properties` file, and start the member as a JMX Manager node.

You start the member as a JMX Manager node when you provide`--J=-Dgemfire.jmx-manager=true`as an argument to either the`start server` or `start locator` command. See [Starting a JMX Manager](https://geode.apache.org/docs/guide/11/managing/management/jmx_manager_operations.html#topic_686158E9AFBD47518BE1B4BEB232C190) for more information.

The JMX Manager node has the following extra resources allocated so that it can answer JMX queries:

- RMI connector that allows JMX clients to connect to and access all MXBeans in the distributed system.
- Local MXBeans that represent the locally monitored components on this node, same as any other managed node.
- Aggregate MXBeans:
  - DistributedSystemMXBean
  - DistributedRegionMXBean
  - DistributedLockServiceMXBean
- ManagerMXBean with Scope=ALL, which allows various distributed system-wide operations.
- Proxy to MXBeans on managed nodes.
- Built-in platform MXBeans.

## JMX Integration

Management and monitoring tools such as gfsh command-line interface and Pulse use JMX/RMI as the communication layer to connect to Geode nodes. All Geode processes by default allow JMX connections to the Platform MBeanServer from localhost. By default, both managed nodes and JMX manager nodes have RMI connectors enabled to allow JMX client connections.

JConsole (and other similar JMX clients that support Sun’s Attach API) can connect to any local JVM without requiring an RMI connector by using the Attach API. This allows connections from the same machine.

JConsole (and other JMX clients) can connect to any JVM if that JVM is configured to start an RMI connector. This allows remote connections from other machines.

JConsole can connect to any Geode member, but if it connects to a non-JMX-Manager member, JConsole only detects the local MBeans for the node, and not MBeans for the cluster.

When a Geode locator or server becomes a JMX Manager for the cluster, it enables the RMI connector. JConsole can then connect only to that one JVM to view the MBeans for the entire cluster. It does not need to connect to all the other JVMs. Geode manages the inter-JVM communication required to provide a federated view of all MBeans in the distributed system.

`gfsh` can only connect to a JMX Manager or to a locator. If connected to a locator, the locator provides the necessary connection information for the existing JMX Manager. If the locator detects a JMX Manager is not already running in the cluster, the locator makes itself a JMX Manager. gfsh cannot connect to other non-Manager or non-locator members.

For information on how to configure the RMI registry and RMI connector, see [Configuring RMI Registry Ports and RMI Connectors](https://geode.apache.org/docs/guide/11/managing/management/configuring_rmi_connector.html#concept_BC793A7ACF9A4BD9A29C2DCC6894767D).

## Management APIs

Geode management APIs represent the Geode cluster to a JMX user. However, they do not provide functionality that is otherwise present in JMX. They only provide a gateway into various services exclusively offered by Geode monitoring and management.

The entry point to Geode management is through the ManagementService interface. For example, to create an instance of the Management Service:

```
ManagementService service = ManagementService.getManagementService(cache);
```

The resulting ManagementService instance is specific to the provided cache and its distributed system. The implementation of getManagementService is a singleton for now but may eventually support multiple cache instances.

You can use the Geode management APIs to accomplish the following tasks:

- Monitor the health status of clients.
- Obtain the status and results of individual disk backups.
- View metrics related to disk usage and performance for a particular member.
- Browse Geode properties set for a particular member.
- View JVM metrics such as memory, heap, and thread usage.
- View network metrics, such as bytes received and sent.
- View partition region attributes such as total number of buckets, redundant copy, and maximum memory information.
- View persistent member information such as disk store ID.
- Browse region attributes.

See the JavaDocs for the `org.apache.geode.management` package for more details.

You can also execute gfsh commands using the ManagementService API. See [Executing gfsh Commands through the Management API](https://geode.apache.org/docs/guide/11/managing/management/gfsh_and_management_api.html#concept_451F0978285245E69C3E8DE795BD8635) and the JavaDocs for the `org.apache.geode.management.cli` package.

## Geode Management and Monitoring Tools

This section lists the currently available tools for managing and monitoring Geode:

- **gfsh**. Apache Geode command-line interface that provides a simple & powerful command shell that supports the administration, debugging and deployment of Geode applications. It features context sensitive help, scripting and the ability to invoke any commands from within the application using a simple API. See [gfsh](https://geode.apache.org/docs/guide/11/tools_modules/gfsh/chapter_overview.html).
- **Geode Pulse**. Easy-to-use, browser-based dashboard for monitoring Geode deployments. Geode Pulse provides an integrated view of all Geode members within a distributed system. See [Geode Pulse](https://geode.apache.org/docs/guide/11/tools_modules/pulse/chapter_overview.html).
- **Pulse Data Browser**. This Geode Pulse utility provides a graphical interface for performing OQL ad-hoc queries in a Geode distributed system. See [Data Browser](https://geode.apache.org/docs/guide/11/tools_modules/pulse/quickstart.html#topic_F0ECE9E8179541CCA3D6C5F4FBA84404__sec_pulsedatabrowser).
- **Other Java Monitoring Tools such as JConsole and jvisualvm.** JConsole is a JMX-based management and monitoring tool provided in the Java 2 Platform that provides information on the performance and consumption of resources by Java applications. See <http://docs.oracle.com/javase/6/docs/technotes/guides/management/jconsole.html>. **Java VisualVM (jvisualvm)** is a profiling tool for analyzing your Java Virtual Machine. Java VisualVM is useful to Java application developers to troubleshoot applications and to monitor and improve the applications’ performance. Java VisualVM can allow developers to generate and analyse heap dumps, track down memory leaks, perform and monitor garbage collection, and perform lightweight memory and CPU profiling. For more details on using jvisualvm, see <http://docs.oracle.com/javase/6/docs/technotes/tools/share/jvisualvm.html>.