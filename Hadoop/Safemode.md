





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





Leave Safe Mode

```
su hdfs -l -c 'hdfs dfsadmin -safemode leave'
```

But this command doesn't help very often, mostly it shows that safemode is still ON. So I have to force the safemode exit with:

```sh
su hdfs -l -c 'hdfs dfsadmin -safemode forceExit'
```

