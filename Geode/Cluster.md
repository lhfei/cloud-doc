# Creating and Using a Cluster Configuration

### Hosts

```ini
192.168.44.245	host-192-168-44-245
192.168.44.246	host-192-168-44-246
192.168.44.247	host-192-168-44-247
192.168.44.249	host-192-168-44-249
192.168.44.253	host-192-168-44-253
```



A short walk-through that uses a single computer to demonstrate how to use `gfsh` to create a cluster configuration for a Geode cluster.

The `gfsh` command-line tool allows you to configure and start a Geode cluster. The cluster configuration service uses Apache Geode locators to store the configuration at the group and cluster levels and serves these configurations to new members as they are started. The locators store the configurations in a hidden region that is available to all locators and also write the configuration data to disk as XML files. Configuration data is updated as `gfsh` commands are executed.

This section provides a walk-through example of configuring a simple Apache Geode cluster and then re-using that configuration in a new context.

1. Create a working directory (For example:`/home/username/my_geode`) and switch to the new directory. This directory will contain the configurations for your cluster.

2. Start the `gfsh` command-line tool. For example:

   ```
   $ gfsh
   ```

   The `gfsh` command prompt displays.

   ```sh
       _________________________     __
      / _____/ ______/ ______/ /____/ /
     / /  __/ /___  /_____  / _____  /
    / /__/ / ____/  _____/ / /    / /
   /______/_/      /______/_/    /_/    1.8
   
   Monitor and Manage Apache Geode
   gfsh>
   ```

3. Start a locator using the command in the following example:

   ```sh
   gfsh>start locator --name=locator1
   Starting a Geode Locator in /Users/username/my_geode/locator1...
   .............................
   Locator in /Users/username/my_geode/locator1 on 192.0.2.0[10334] as locator1
   is currently online.
   Process ID: 5203
   Uptime: 15 seconds
   Geode Version: 1.8
   Java Version: 1.8.0_121
   Log File: /Users/username/my_geode/locator1/locator1.log
   JVM Arguments: -Dgemfire.enable-cluster-configuration=true
   -Dgemfire.load-cluster-configuration-from-dir=false
   -Dgemfire.launcher.registerSignalHandlers=true -Djava.awt.headless=true
   -Dsun.rmi.dgc.server.gcInterval=9223372036854775806
   Class-Path: /Users/username/Apache_Geode_1.0.0_Linux/lib/geode-dependencies.jar
   
   Successfully connected to: [host=192.0.2.0, port=1099]
   
   Cluster configuration service is up and running.
   ```

   Note that `gfsh` responds with a message indicating that the cluster configuration service is up and running. If you see a message indicating a problem, review the locator log file for possible errors. The path to the log file is displayed in the output from `gfsh`.

4. Start Apache Geode servers using the commands in the following example:

   ```sh
   gfsh>start server --name=server1 --groups=group1
   Starting a Geode Server in /Users/username/my_geode/server1...
   .....
   Server in /Users/username/my_geode/server1 on 192.0.2.0[40404] as server1
   is currently online.
   Process ID: 5627
   Uptime: 2 seconds
   Geode Version: 1.8
   Java Version: 1.8.0_121
   Log File: /Users/username/my_geode/server1/server1.log
   JVM Arguments: -Dgemfire.default.locators=192.0.2.0[10334] -Dgemfire.groups=group1
   -Dgemfire.use-cluster-configuration=true -XX:OnOutOfMemoryError=kill -KILL %p
   -Dgemfire.launcher.registerSignalHandlers=true -Djava.awt.headless=true
   -Dsun.rmi.dgc.server.gcInterval=9223372036854775806
   Class-Path: /Users/username/Apache_Geode_1.0.0_Linux/lib/geode-dependencies.jar
   
   gfsh>start server --name=server2 --groups=group1 --server-port=40405
   Starting a Geode Server in /Users/username/my_geode/server2...
   .....
   Server in /Users/username/my_geode/server2 on 192.0.2.0[40405] as server2
   is currently online.
   Process ID: 5634
   Uptime: 2 seconds
   Geode Version: 1.8
   Java Version: 1.8.0_121
   Log File: /Users/username/my_geode/server2/server2.log
   JVM Arguments: -Dgemfire.default.locators=192.0.2.0[10334] -Dgemfire.groups=group1
   -Dgemfire.use-cluster-configuration=true -XX:OnOutOfMemoryError=kill -KILL %p
   -Dgemfire.launcher.registerSignalHandlers=true -Djava.awt.headless=true
   -Dsun.rmi.dgc.server.gcInterval=9223372036854775806
   Class-Path: /Users/username/Apache_Geode_1.0.0_Linux/lib/geode-dependencies.jar
   
   gfsh>start server --name=server3 --server-port=40406
   Starting a Geode Server in /Users/username/my_geode/server3...
   .....
   Server in /Users/username/my_geode/server3 on 192.0.2.0[40406] as server3
   is currently online.
   Process ID: 5637
   Uptime: 2 seconds
   Geode Version: 1.8
   Java Version: 1.8.0_121
   Log File: /Users/username/my_geode/server3/server3.log
   JVM Arguments: -Dgemfire.default.locators=192.0.2.0[10334]
   -Dgemfire.use-cluster-configuration=true -XX:OnOutOfMemoryError=kill -KILL %p
   -Dgemfire.launcher.registerSignalHandlers=true -Djava.awt.headless=true
   -Dsun.rmi.dgc.server.gcInterval=9223372036854775806
   Class-Path: /Users/username/Apache_Geode_1.0.0_Linux/lib/geode-dependencies.jar
   ```

   Note that the `gfsh` commands you used to start `server1` and `server2` specify a group named `group1` while the command for `server3` did not specify a group name.

5. Create some regions using the commands in the following example:

   ```sql
   gfsh>create region --name=region1 --groups=group1 --type=REPLICATE
   Member  | Status
   ------- | --------------------------------------
   server2 | Region "/region1" created on "server2"
   server1 | Region "/region1" created on "server1"
   
   gfsh>create region --name=region2 --type=REPLICATE
   Member  | Status
   ------- | --------------------------------------
   server1 | Region "/region2" created on "server1"
   server2 | Region "/region2" created on "server2"
   server3 | Region "/region2" created on "server3"
   ```

   Note that `region1` is created on all cache servers that specified the group named `group1`when starting the cache server (`server1` and `server2`, in this example). `region2` is created on all members because no group was specified.

6. Deploy jar files. Use the `gfsh deploy` command to deploy application jar files to all members or to a specified group of members. The following example deploys the `mx4j-3.0.1.jar` and `ra.jar` files from the distribution. (Note: This is only an example, you do not need to deploy these files to use the Cluster Configuration Service. Alternately, you can use any two jar files for this demonstration.)

   ```sql
   gfsh>deploy --groups=group1 --jars=/lib/mx4j-3.0.1.jar
   Post substitution: deploy --groups=group1 --jars=/Users/username/Apache_Geode_1.0.0_Linux/lib/mx4j-3.0.1.jar
   Member  |    Deployed JAR    | Deployed JAR Location
   ------- | ------------------ | -------------------------------------------------------
   server1 | mx4j-3.0.1.jar     | /Users/username/my_geode/server1/vf.gf#mx4j-3.0.1.jar#1
   server2 | mx4j-3.0.1.jar     | /Users/username/my_geode/server2/vf.gf#mx4j-3.0.1.jar#1
   
   gfsh>deploy --jars=/lib/ra.jar
   Post substitution: deploy --jar=/Users/username/Apache_Geode_1.0.0_Linux/lib/ra.jar
   Member  | Deployed JAR | Deployed JAR Location
   ------- | ------------ | -----------------------------------------------
   server1 | ra.jar       | /Users/username/my_geode/server1/vf.gf#ra.jar#1
   server2 | ra.jar       | /Users/username/my_geode/server1/vf.gf#ra.jar#1
   server3 | ra.jar       | /Users/username/my_geode/server1/vf.gf#ra.jar#1
   ```

   Note that the `mx4j-3.0.1.jar` file was deployed only to the members of `group1` and the `ra.jar` was deployed to all members.

7. Export the cluster configuration. You can use the `gfsh export cluster-configuration`command to create a zip file that contains the cluster’s persisted configuration. The zip file contains a copy of the contents of the `cluster_config` directory. For example:

   ```sql
   gfsh>export cluster-configuration --zip-file-name=/Users/username/myClConfig.zip
   ```

   Apache Geode writes the cluster configuration to the specified zip file.

   ```sql
   Downloading cluster configuration : /Users/username/myClConfig.zip
   ```

   The remaining steps demonstrate how to use the cluster configuration you just created.

8. Shut down the cluster using the following commands:

   ```sh
   gfsh>shutdown --include-locators=true
   As a lot of data in memory will be lost, including possibly events in queues, do you
   really want to shutdown the entire distributed system? (Y/n): Y
   Shutdown is triggered
   
   gfsh>
   No longer connected to 192.0.2.0[1099].
   gfsh>
   ```

9. Exit the `gfsh` command shell:

   ```sh
   gfsh>quit
   Exiting...
   ```

10. Create a new working directory (for example: `new_geode`) and switch to the new directory.

11. Start the `gfsh` command shell:

    ```sh
    $ gfsh
    ```

12. Start a new locator. For example:

    ```sh
    gfsh>start locator --name=locator2 --port=10335
    Starting a Geode Locator in /Users/username/new_geode/locator2...
    .............................
    Locator in /Users/username/new_geode/locator2 on 192.0.2.0[10335] as locator2
    is currently online.
    Process ID: 5749
    Uptime: 15 seconds
    Geode Version: 1.8
    Java Version: 1.8.0_121
    Log File: /Users/username/new_geode/locator2/locator2.log
    JVM Arguments: -Dgemfire.enable-cluster-configuration=true
    -Dgemfire.load-cluster-configuration-from-dir=false
    -Dgemfire.launcher.registerSignalHandlers=true -Djava.awt.headless=true
    -Dsun.rmi.dgc.server.gcInterval=9223372036854775806
    Class-Path: /Users/username/Apache_Geode_1.0.0_Linux/lib/geode-dependencies.jar
    
    Successfully connected to: [host=192.0.2.0, port=1099]
    
    Cluster configuration service is up and running.
    ```

13. Import the cluster configuration using the `import cluster-configuration` command. For example:

    ```sh
    gfsh>import cluster-configuration --zip-file-name=/Users/username/myClConfig.zip
    Cluster configuration successfully imported
    ```

    Note that the `locator2` directory now contains a `cluster_config` subdirectory.

14. Start a server that does not reference a group:

    ```sh
    gfsh>start server --name=server4 --server-port=40414
    Starting a Geode Server in /Users/username/new_geode/server4...
    ........
    Server in /Users/username/new_geode/server4 on 192.0.2.0[40414] as server4
    is currently online.
    Process ID: 5813
    Uptime: 4 seconds
    Geode Version: 1.8
    Java Version: 1.8.0_121
    Log File: /Users/username/new_geode/server4/server4.log
    JVM Arguments: -Dgemfire.default.locators=192.0.2.0[10335]
    -Dgemfire.use-cluster-configuration=true -XX:OnOutOfMemoryError=kill -KILL %p
    -Dgemfire.launcher.registerSignalHandlers=true -Djava.awt.headless=true
    -Dsun.rmi.dgc.server.gcInterval=9223372036854775806
    Class-Path: /Users/username/Apache_Geode_1.0.0_Linux/lib/geode-dependencies.jar
    ```

15. Start another server that references `group1`:

    ```sh
    gfsh>start server --name=server5 --groups=group1 --server-port=40415
    Starting a Geode Server in /Users/username/new_geode/server5...
    .....
    Server in /Users/username/new_geode/server2 on 192.0.2.0[40415] as server5
    is currently online.
    Process ID: 5954
    Uptime: 2 seconds
    Geode Version: 1.8
    Java Version: 1.8.0_121
    Log File: /Users/username/new_geode/server5/server5.log
    JVM Arguments: -Dgemfire.default.locators=192.0.2.0[10335] -Dgemfire.groups=group1
    -Dgemfire.use-cluster-configuration=true -XX:OnOutOfMemoryError=kill -KILL %p
    -Dgemfire.launcher.registerSignalHandlers=true -Djava.awt.headless=true
    -Dsun.rmi.dgc.server.gcInterval=9223372036854775806
    Class-Path: /Users/username/Apache_Geode_1.0.0_Linux/lib/geode-dependencies.jar
    ```

16. Use the `list regions` command to display the configured regions. Note that region1 and region2, which were configured in the original cluster level are available.

    ```sh
    gfsh>list regions
    List of regions
    ---------------
    region1
    region2
    ```

17. Use the `describe region` command to see which members host each region. Note that region1 is hosted only by server5 because server5 was started using the group1 configuration. region2 is hosted on both server4 and server5 because region2 was created without a group specified.

    ```sh
    gfsh>describe region --name=region1
    ..........................................................
    Name            : region1
    Data Policy     : replicate
    Hosting Members : server5
    
    Non-Default Attributes Shared By Hosting Members
    
     Type  |    Name     | Value
    ------ | ----------- | ---------------
    Region | data-policy | REPLICATE
           | size        | 0
           | scope       | distributed-ack
    
    gfsh>describe region --name=region2
    ..........................................................
    Name            : region2
    Data Policy     : replicate
    Hosting Members : server5
                      server4
    
    Non-Default Attributes Shared By Hosting Members
    
     Type  |    Name     | Value
    ------ | ----------- | ---------------
    Region | data-policy | REPLICATE
           | size        | 0
           | scope       | distributed-ack
    ```

    This new cluster uses the same configuration as the original system. You can start any number of servers using this cluster configuration. All servers will receive the cluster-level configuration. Servers that specify `group1` also receive the `group1` configuration.

18. Shut down your cluster using the following commands:

    ```sh
    gfsh>shutdown --include-locators=true
    As a lot of data in memory will be lost, including possibly events in queues,
      do you really want to shutdown the entire distributed system? (Y/n): Y
    Shutdown is triggered
    
    gfsh>
    No longer connected to 192.0.2.0[1099].
    ```

