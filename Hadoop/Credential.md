



## Enabling Hadoop services to use a credential keystore file for Object Storage

### Procedure

The hadoop credential command can be used to create a keystore file and save it on HDFS. Keeping the credential keystore file on HDFS allows any node in the cluster access to the properties.

1. Create a credential keystore on HDFS.

   ```
   hadoop credential create secret.key.name.goes.here -provider jceks://<path>/<jceks_filename>.jceks -v <password>
   ```

   For example, if you are configuring for an S3 Object Store, the

    

   jceks

    

   file will be created on HDFS as

    

   /hdfs/tmp/softlayer_all.jceks

   :

   ```
   hadoop credential create fs.s3a.access.key -provider jceks://hdfs/tmp/softlayer_all.jceks -v '123456789'
   hadoop credential create fs.s3a.secret.key -provider jceks://hdfs/tmp/softlayer_all.jceks -v 'abcdefgh'
   ```

2. Verify the credential keystore file by using the list command.

   ```
    hadoop credential list -provider jceks://hdfs/tmp/softlayer_all.jceks
      Listing aliases for CredentialProvider: jceks://hdfs/tmp/softlayer_all.jceks
      fs.s3a.access.key
      fs.s3a.secret.key
   ```

3. Set read permissions for the keystore file so that all users can read the file.

   ```
   hadoop fs -ls /tmp/softlayer_all.jceks
   -rwxr--r-- 3 hdfs hdfs 1045 2016-08-15 17:01 /tmp/softlayer_all.jceks
   ```

4. Add or update the property hadoop.security.credential.provider.path in the core-site.xml file to include the provider URI from Step 1 above.

    

   In this example, the provider is

    

   jceks://hdfs/tmp/softlayer_all.jceks

   . This change can be done in Ambari under the HDFS service and will be propagated to all nodes.

   ```
   <property>
     <name>hadoop.security.credential.provider.path</name>
     <value>jceks://hdfs/tmp/softlayer_all.jceks</value>
   </property>
   ```

5. Add or update the property fs.s3a.security.credential.provider.path in the hive-site.xml file to include the provider URI from Step 1 above.

    

   In this example, the provider is

    

   jceks://hdfs/tmp/softlayer_all.jceks

   . This change can be done in Ambari under the Hive service and will be propagated to all nodes.

   ```
   <property>
     <name>fs.s3a.security.credential.provider.path</name>
     <value>jceks://hdfs/tmp/softlayer_all.jceks</value>
   </property>
   ```

6. Restart the HDFS, MapReduce, YARN, Hive, HBase, Big SQL, and any other affected services.







## Using Hadoop Credential API to store AWS secrets

The Hadoop Credential API can be used to manage access to S3 in a more fine-grained way.

The first step is to create a local JCEKS file in which to store the AWS Access Key and AWS Secret Key values:

```
hadoop credential create fs.s3a.access.key -provider localjceks://file/path/to/aws.jceks<enter Access Key value at prompt>hadoop credential create fs.s3a.secret.key -provider localjceks://file/path/to/aws.jceks<enter Secret Key value at prompt>
```

We'll then copy this JCEKS file to HDFS with the appropriate permissions.

```
hdfs dfs -put /path/to/aws.jceks /user/admin/hdfs dfs -chown admin:admin /user/admin/aws.jcekshdfs dfs -chmod 400 /user/admin/aws.jceks
```

We can then use the credential provider when calling hadoop distcp, as follows:

```
hadoop distcp -Dhadoop.security.credential.provider.path=jceks://hdfs/user/admin/aws.jceks /user/admin/file s3a://my-bucket/
```

Notice that only the admin user can read this credentials file. If other users attempt to run the command above they will receive a permissions error because they can't read aws.jceks.

This also works with hdfs commands, as in the below example.

```
hdfs dfs -Dhadoop.security.credential.provider.path=jceks://hdfs/user/admin/aws.jceks -ls s3a://my-bucket
```

