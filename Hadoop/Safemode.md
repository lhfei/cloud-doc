





The last HDFS checkpoint is older than 12 hours. Make sure that you have taken a checkpoint before proceeding. Otherwise, the NameNode(s) can take a very long time to start up.

1. Login to the NameNode host  *{namenode.host.com}*.

2. Put the NameNode in Safe Mode (read-only mode):

   ```
   sudo su hdfs -l -c 'hdfs dfsadmin -safemode enter'
   ```

3. Once in Safe Mode, create a Checkpoint:

   ```
   sudo su hdfs -l -c 'hdfs dfsadmin -saveNamespace'
   ```

   ​




Leave Safe Mode

```
sudo su hdfs -l -c 'hdfs dfsadmin -safemode leave'
```

