

In a typical Hive installation with metadata in a MySQL configuration, a password is configured in a configuration file in clear text. This presents a few risks: 1) Unauthorized access could destroy/modify Hive metadata and disrupt workflows. A malicious user could alter Hive permissions or damage metadata. 2) This password permits *hiveserver2-thrift-MySQL* communication. To avoid this problem, you should use a Java keystore file instead of a password.

Minimum action needed:

- chown mapr:mapr hive-site.xml
- chmod 400 hive-site.xml

However, this means that users other than mapr cannot run jobs *local to the* machine, as they can’t read hive-site.xml

By setting up a CredentialProvider to handle storing/retrieval of passwords, you can remove the need to keep the Hive metastore password in cleartext in the Hive configuration by pointing the configuration to use an encrypted keystore file. In this blog post, I’ll explain how to accomplish this.

## STEP 1

Create CredentialProvider to encrypt the password and store it as a Java keystore file.

```shell
[root@ip-10-0-10-219 ~]# hadoop credential create
javax.jdo.option.ConnectionPassword -provider
jceks://maprfs/user/mapr/hive.jceks
Enter password:
Enter password again:
javax.jdo.option.ConnectionPassword has been successfully created.
org.apache.hadoop.security.alias.JavaKeyStoreProvider has been updated.
```

You will have to enter Hive meta database credentials when it prompts for the password. **NOTE:** In the MapR Distribution, you will have to enter maprfs in the HDFS path. A direct path like *jceks://user/mapr/filename.jceks*will not work. Instead, you should enter something like: *jceks://maprfs/user/mapr/filename.jceks*

## STEP 2

Make sure your password alias is created properly by listing it as a JCEKS provider file. The following command can be used for confirmation.

```shell
For Listing details of alias
[root@ip-10-0-10-219 ~]# hadoop credential list -provider
jceks://maprfs/user/mapr/hive.jceks
Listing aliases for CredentialProvider: jceks://maprfs/user/mapr/hive.jceks
javax.jdo.option.connectionpassword
```

The results should list *javax.jdo.option.connection* (alias) from the provider file.

## STEP 3

The Hive configuration file will have to be updated with the CredentialProvider location in order for the Hive metadatabase to connect.

Edit hive-site.xml and the following changes:

1. Remove the Hive metastore password entry ([javax.jdo.option.ConnectionPassword](https://cwiki.apache.org/confluence/display/Hive/Configuration+Properties#ConfigurationProperties-javax.jdo.option.ConnectionPassword)) from the Hive configuration. The CredentialProvider will be used instead.
2. Make the following entry in hive-site for the CredentialProvider.

hadoop.security.credential.provider.path jceks://maprfs/user/mapr/hive.jceks

## STEP 4

Restart Hive Metastore Server/HiveServer2 to make the configuration effective.

```shell
maprcli node services -name hivemeta -action stop -nodes hivemetastorehostname
maprcli node services -name hs2 -action stop -nodes hiveserver2hostname

maprcli node services -name hivemeta -action start -nodes hivemetastorehostname
maprcli node services -name hs2 -action start -nodes hiveserver2hostname
```

Verify and validate the logs to make sure that the Hive server is starting fine with no errors.

## STEP 5

Log on to Hive and list your databases and tables to make sure they are accessible.

**\*NOTE: Read permission (644) is required for the Java Keystore file for all the Hive users; they need read access to use the Hive shell.***

**\*Providing read access to users group is not a fully secured option, people with read access can use keystore file to get DB access. Opening it up to end users is totally necessary for hive shell access then you should at least limit the number of endusers that could access it, and create a separate group for HIVE users and restrict keystore file access(640) accordingly.***

For more information, please read the [Hadoop Commands Guide](http://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-common/CommandsManual.html#credential).

In this blog post, you learned how to remove the need to keep the Hive metastore password in cleartext in the Hive configuration by pointing the configuration to use an encrypted keystore file. If you have any further questions, please ask them in the comments section below.





## Make Credential



### Provision Credentials

```
$ hadoop credential create ssl.server.keystore.password -value 123 \
      -provider localjceks://file/home/lmccay/aws.jceks
      
ssl.server.keystore.password has been successfully created.
org.apache.hadoop.security.alias.LocalJavaKeyStoreProvider has been updated.
```



verify it



```shell
$ hadoop credential list -provider localjceks://file/home/lmccay/aws.jceks

Listing aliases for CredentialProvider: localjceks://file/export/app_sdk/aws.jceks
ssl.server.keystore.password
```



### Configuring the Provider Path

```
<property>
	<name>hadoop.security.credential.provider.path</name>
	<value>localjceks://file/home/lmccay/aws.jceks</value>
	<description>Path to interrogate for protected credentials.</description>
</property>
```



## Hive Metastore Use JCEKS

```shell
<property>
  <name>javax.jdo.option.ConnectionURL</name>
  <value>jdbc:mysql://localhost/polaris_cloud_hive?useSSL=false</value>
</property>

<property>
  <name>javax.jdo.option.ConnectionUserName</name>
  <value>polaris_cloud_hive</value>
</property>

<property>
  <name>hadoop.security.credential.provider.path</name>
  <value>jceks://file/usr/hdp/current/hive-server2/conf/conf.server/hive-site.jceks</value>
</property>
```

