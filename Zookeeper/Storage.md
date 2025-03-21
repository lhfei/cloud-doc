# Notebook storage options for Apache Zeppelin



- [Overview](https://zeppelin.apache.org/docs/0.8.0/setup/storage/storage.html#overview)
- [Notebook Storage in local Git repository](https://zeppelin.apache.org/docs/0.8.0/setup/storage/storage.html#notebook-storage-in-local-git-repository)
- [Notebook Storage in hadoop compatible file system repository](https://zeppelin.apache.org/docs/0.8.0/setup/storage/storage.html#notebook-storage-in-hadoop-compatible-file-system-repository)
- Notebook Storage in S3
  - [Data Encryption in S3](https://zeppelin.apache.org/docs/0.8.0/setup/storage/storage.html#data-encryption-in-s3)
- [Notebook Storage in Azure](https://zeppelin.apache.org/docs/0.8.0/setup/storage/storage.html#notebook-storage-in-azure)
- Notebook Storage in Google Cloud Storage
  - [Google Cloud API Authentication](https://zeppelin.apache.org/docs/0.8.0/setup/storage/storage.html#google-cloud-api-authentication)
- [Notebook Storage in ZeppelinHub](https://zeppelin.apache.org/docs/0.8.0/setup/storage/storage.html#notebook-storage-in-zeppelinhub)
- Notebook Storage in MongoDB
  - [Why MongoDB?](https://zeppelin.apache.org/docs/0.8.0/setup/storage/storage.html#why-mongodb)
  - [How to use](https://zeppelin.apache.org/docs/0.8.0/setup/storage/storage.html#how-to-use)
  - [Configurable Options](https://zeppelin.apache.org/docs/0.8.0/setup/storage/storage.html#configurable-options)
- [Notebook Storage in GitHub](https://zeppelin.apache.org/docs/0.8.0/setup/storage/storage.html#notebook-storage-in-github)

## Overview





Apache Zeppelin has a pluggable notebook storage mechanism controlled by `zeppelin.notebook.storage` configuration option with multiple implementations. There are few notebook storage systems available for a use out of the box:

- (default) use local file system and version it using local Git repository - `GitNotebookRepo`
- all notes are saved in the notebook folder in your local File System - `VFSNotebookRepo`
- all notes are saved in the notebook folder in hadoop compatible file system - `FileSystemNotebookRepo`
- storage using Amazon S3 service - `S3NotebookRepo`
- storage using Azure service - `AzureNotebookRepo`
- storage using Google Cloud Storage - `GCSNotebookRepo`
- storage using MongoDB - `MongoNotebookRepo`
- storage using GitHub - `GitHubNotebookRepo`

Multiple storage systems can be used at the same time by providing a comma-separated list of the class-names in the configuration. By default, only first two of them will be automatically kept in sync by Zeppelin.



## Notebook Storage in local Git repository





To enable versioning for all your local notebooks though a standard Git repository - uncomment the next property in `zeppelin-site.xml` in order to use GitNotebookRepo class:

```xml
<property>
  <name>zeppelin.notebook.storage</name>
  <value>org.apache.zeppelin.notebook.repo.GitNotebookRepo</value>
  <description>notebook persistence layer implementation</description>
</property>
```



## Notebook Storage in hadoop compatible file system repository





Notes may be stored in hadoop compatible file system such as hdfs, so that multiple Zeppelin instances can share the same notes. It supports all the versions of hadoop 2.x. If you use `FileSystemNotebookRepo`, then `zeppelin.notebook.dir`is the path on the hadoop compatible file system. And you need to specify `HADOOP_CONF_DIR` in `zeppelin-env.sh` so that zeppelin can find the right hadoop configuration files. If your hadoop cluster is kerberized, then you need to specify `zeppelin.server.kerberos.keytab` and `zeppelin.server.kerberos.principal`

```xml
<property>
  <name>zeppelin.notebook.storage</name>
  <value>org.apache.zeppelin.notebook.repo.FileSystemNotebookRepo</value>
  <description>hadoop compatible file system notebook persistence layer implementation</description>
</property>
```

>  Notes: 

​	Your can find the default locations in HDFS  by this command as below:

```shell
hdfs dfs -ls  /user/zeppelin/notebook
Found 8 items
drwxr-xr-x   - zeppelin hdfs          0 2018-12-12 09:03 /user/zeppelin/notebook/2A94M5J1Z
drwxr-xr-x   - zeppelin hdfs          0 2018-12-12 09:03 /user/zeppelin/notebook/2BWJFTXKJ
drwxr-xr-x   - zeppelin hdfs          0 2018-12-13 18:32 /user/zeppelin/notebook/2CA587K77
drwxr-xr-x   - zeppelin hdfs          0 2018-12-12 09:03 /user/zeppelin/notebook/2CAX5JCTA
drwxr-xr-x   - zeppelin hdfs          0 2018-12-14 08:51 /user/zeppelin/notebook/2CBTZPY14
drwxr-xr-x   - zeppelin hdfs          0 2018-12-12 09:03 /user/zeppelin/notebook/2CCBNZ5YY
drwxr-xr-x   - zeppelin hdfs          0 2018-12-12 14:43 /user/zeppelin/notebook/2DXY7EHGX
drwxr-xr-x   - zeppelin hdfs          0 2018-12-14 08:48 /user/zeppelin/notebook/2E14NSMPN
```





## Notebook Storage in S3





Notebooks may be stored in S3, and optionally encrypted. The [`DefaultAWSCredentialsProviderChain`](https://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/auth/DefaultAWSCredentialsProviderChain.html) credentials provider is used for credentials and checks the following:

- The `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` environment variables
- The `aws.accessKeyId` and `aws.secretKey` Java System properties
- Credential profiles file at the default location (`~/.aws/credentials`) used by the AWS CLI
- Instance profile credentials delivered through the Amazon EC2 metadata service


The following folder structure will be created in S3:

```text
s3://bucket_name/username/notebook-id/
```

Configure by setting environment variables in the file **zeppelin-env.sh**:

```bash
export ZEPPELIN_NOTEBOOK_S3_BUCKET=bucket_name
export ZEPPELIN_NOTEBOOK_S3_USER=username
```

Or using the file **zeppelin-site.xml** uncomment and complete the S3 settings:

```xml
<property>
  <name>zeppelin.notebook.s3.bucket</name>
  <value>bucket_name</value>
  <description>bucket name for notebook storage</description>
</property>
<property>
  <name>zeppelin.notebook.s3.user</name>
  <value>username</value>
  <description>user name for s3 folder structure</description>
</property>
```

Uncomment the next property for use S3NotebookRepo class:

```xml
<property>
  <name>zeppelin.notebook.storage</name>
  <value>org.apache.zeppelin.notebook.repo.S3NotebookRepo</value>
  <description>notebook persistence layer implementation</description>
</property>
```

Comment out the next property to disable local git notebook storage (the default):

```xml
<property>
  <name>zeppelin.notebook.storage</name>
  <value>org.apache.zeppelin.notebook.repo.GitNotebookRepo</value>
  <description>versioned notebook persistence layer implementation</description>
</property>
```

### Data Encryption in S3

#### AWS KMS encryption keys

To use an [AWS KMS](https://aws.amazon.com/kms/) encryption key to encrypt notebooks, set the following environment variable in the file **zeppelin-env.sh**:

```bash
export ZEPPELIN_NOTEBOOK_S3_KMS_KEY_ID=kms-key-id
```

Or using the following setting in **zeppelin-site.xml**:

```xml
<property>
  <name>zeppelin.notebook.s3.kmsKeyID</name>
  <value>AWS-KMS-Key-UUID</value>
  <description>AWS KMS key ID used to encrypt notebook data in S3</description>
</property>
```

In order to set custom KMS key region, set the following environment variable in the file **zeppelin-env.sh**:

```bash
export ZEPPELIN_NOTEBOOK_S3_KMS_KEY_REGION=kms-key-region
```

Or using the following setting in **zeppelin-site.xml**:

```xml
<property>
  <name>zeppelin.notebook.s3.kmsKeyRegion</name>
  <value>target-region</value>
  <description>AWS KMS key region in your AWS account</description>
</property>
```

Format of `target-region` is described in more details [here](http://docs.aws.amazon.com/general/latest/gr/rande.html#kms_region) in second `Region` column (e.g. `us-east-1`).

#### Custom Encryption Materials Provider class

You may use a custom [`EncryptionMaterialsProvider`](https://docs.aws.amazon.com/AWSJavaSDK/latest/javadoc/com/amazonaws/services/s3/model/EncryptionMaterialsProvider.html) class as long as it is available in the classpath and able to initialize itself from system properties or another mechanism. To use this, set the following environment variable in the file **zeppelin-env.sh**:

```bash
export ZEPPELIN_NOTEBOOK_S3_EMP=class-name
```

Or using the following setting in **zeppelin-site.xml**:

```xml
<property>
  <name>zeppelin.notebook.s3.encryptionMaterialsProvider</name>
  <value>provider implementation class name</value>
  <description>Custom encryption materials provider used to encrypt notebook data in S3</description>
```

#### Enable server-side encryption

To request server-side encryption of notebooks, set the following environment variable in the file **zeppelin-env.sh**:

```bash
export ZEPPELIN_NOTEBOOK_S3_SSE=true
```

Or using the following setting in **zeppelin-site.xml**:

```xml
<property>
  <name>zeppelin.notebook.s3.sse</name>
  <value>true</value>
  <description>Server-side encryption enabled for notebooks</description>
</property>
```



## Notebook Storage in Azure





Using `AzureNotebookRepo` you can connect your Zeppelin with your Azure account for notebook storage.

First of all, input your `AccountName`, `AccountKey`, and `Share Name` in the file **zeppelin-site.xml** by commenting out and completing the next properties:

```xml
<property>
  <name>zeppelin.notebook.azure.connectionString</name>
  <value>DefaultEndpointsProtocol=https;AccountName=<accountName>;AccountKey=<accountKey></value>
  <description>Azure account credentials</description>
</property>

<property>
  <name>zeppelin.notebook.azure.share</name>
  <value>zeppelin</value>
  <description>share name for notebook storage</description>
</property>
```

Secondly, you can initialize `AzureNotebookRepo` class in the file **zeppelin-site.xml** by commenting the next property:

```xml
<property>
  <name>zeppelin.notebook.storage</name>
  <value>org.apache.zeppelin.notebook.repo.GitNotebookRepo</value>
  <description>versioned notebook persistence layer implementation</description>
</property>
```

and commenting out:

```xml
<property>
  <name>zeppelin.notebook.storage</name>
  <value>org.apache.zeppelin.notebook.repo.AzureNotebookRepo</value>
  <description>notebook persistence layer implementation</description>
</property>
```

In case you want to use simultaneously your local git storage with Azure storage use the following property instead:

```xml
<property>
  <name>zeppelin.notebook.storage</name>
  <value>org.apache.zeppelin.notebook.repo.GitNotebookRepo, apache.zeppelin.notebook.repo.AzureNotebookRepo</value>
  <description>notebook persistence layer implementation</description>
</property>
```

Optionally, you can specify Azure folder structure name in the file **zeppelin-site.xml** by commenting out the next property:

```xml
 <property>
  <name>zeppelin.notebook.azure.user</name>
  <value>user</value>
  <description>optional user name for Azure folder structure</description>
</property>
```



## Notebook Storage in Google Cloud Storage





Using `GCSNotebookRepo` you can connect Zeppelin with Google Cloud Storage using [Application Default Credentials](https://cloud.google.com/docs/authentication/production).

First, choose a GCS path under which to store notebooks.

```xml
<property>
  <name>zeppelin.notebook.gcs.dir</name>
  <value></value>
  <description>
    A GCS path in the form gs://bucketname/path/to/dir.
    Notes are stored at {zeppelin.notebook.gcs.dir}/{notebook-id}/note.json
 </description>
</property>
```

Then, initialize the `GCSNotebookRepo` class in the file **zeppelin-site.xml** by commenting the next property:

```xml
<property>
  <name>zeppelin.notebook.storage</name>
  <value>org.apache.zeppelin.notebook.repo.GitNotebookRepo</value>
  <description>versioned notebook persistence layer implementation</description>
</property>
```

and commenting out:

```xml
<property>
  <name>zeppelin.notebook.storage</name>
  <value>org.apache.zeppelin.notebook.repo.GCSNotebookRepo</value>
  <description>notebook persistence layer implementation</description>
</property>
```

Or, if you want to simultaneously use your local git storage with GCS, use the following property instead:

```xml
<property>
  <name>zeppelin.notebook.storage</name>
  <value>org.apache.zeppelin.notebook.repo.GitNotebookRepo,org.apache.zeppelin.notebook.repo.GCSNotebookRepo</value>
  <description>notebook persistence layer implementation</description>
</property>
```

### Google Cloud API Authentication

Note: On Google App Engine, Google Cloud Shell, and Google Compute Engine, these steps are not necessary, as build-in credentials are used by default.

For more information, see [Application Default Credentials](https://cloud.google.com/docs/authentication/production)

#### Using gcloud auth application-default login

See the [gcloud docs](https://cloud.google.com/sdk/gcloud/reference/auth/application-default/login)

As the user running the zeppelin daemon, run:

```bash
gcloud auth application-default login
```

You can also use `--scopes` to restrict access to specific Google APIs, such as Cloud Storage and BigQuery.

#### Using service account key files

Alternatively, to use a [service account](https://cloud.google.com/compute/docs/access/service-accounts) for authentication with GCS, you will need a JSON service account key file.

1. Navigate to the [service accounts page](https://console.cloud.google.com/iam-admin/serviceaccounts/project)
2. Click `CREATE SERVICE ACCOUNT`
3. Select at least `Storage -> Storage Object Admin`. Note that this is **different** than `Storage Admin`.
4. If you are also using the BigQuery Interpreter, add the appropriate permissions (e.g. `Bigquery -> Bigquery Data Viewer and BigQuery User`)
5. Name your service account, and select "Furnish a new private key" to download a `.json` file. Click "Create".
6. Move the downloaded file to a location of your choice (e.g. `/path/to/my/key.json`), and give it appropriate permissions. Ensure at least the user running the zeppelin daemon can read it.

Then, point `GOOGLE_APPLICATION_CREDENTIALS` at your new key file in **zeppelin-env.sh**. For example:

```bash
export GOOGLE_APPLICATION_CREDENTIALS=/path/to/my/key.json
```



## Notebook Storage in ZeppelinHub





ZeppelinHub storage layer allows out of the box connection of Zeppelin instance with your ZeppelinHub account. First of all, you need to either comment out the following property in **zeppelin-site.xml**:

```xml
<!-- For connecting your Zeppelin with ZeppelinHub -->
<!--
<property>
  <name>zeppelin.notebook.storage</name>
  <value>org.apache.zeppelin.notebook.repo.GitNotebookRepo, org.apache.zeppelin.notebook.repo.zeppelinhub.ZeppelinHubRepo</value>
  <description>two notebook persistence layers (local + ZeppelinHub)</description>
</property>
-->
```

or set the environment variable in the file **zeppelin-env.sh**:

```bash
export ZEPPELIN_NOTEBOOK_STORAGE="org.apache.zeppelin.notebook.repo.GitNotebookRepo, org.apache.zeppelin.notebook.repo.zeppelinhub.ZeppelinHubRepo"
```

Secondly, you need to set the environment variables in the file **zeppelin-env.sh**:

```bash
export ZEPPELINHUB_API_TOKEN=ZeppelinHub token
export ZEPPELINHUB_API_ADDRESS=address of ZeppelinHub service (e.g. https://www.zeppelinhub.com)
```

You can get more information on generating `token` and using authentication on the corresponding [help page](http://help.zeppelinhub.com/zeppelin_integration/#add-a-new-zeppelin-instance-and-generate-a-token).

## Notebook Storage in MongoDB





Using `MongoNotebookRepo`, you can store your notebook in [MongoDB](https://www.mongodb.com/).

### Why MongoDB?

- **High Availability (HA)** by a [replica set](https://docs.mongodb.com/manual/reference/glossary/#term-replica-set)
- Seperation of storage from server

### How to use

You can use MongoDB as notebook storage by editting `zeppelin-env.sh` or `zeppelin-site.xml`.

#### (Method 1) by editting `zeppelin-env.sh`

Add a line below to `$ZEPPELIN_HOME/conf/zeppelin-env.sh`:

```bash
export ZEPPELIN_NOTEBOOK_STORAGE=org.apache.zeppelin.notebook.repo.MongoNotebookRepo
```

> *NOTE:* The default MongoDB connection URI is `mongodb://localhost`

#### (Method 2) by editting `zeppelin-site.xml`

Or, **uncomment** lines below at `$ZEPPELIN_HOME/conf/zeppelin-site.xml`:

```xml
<property>
  <name>zeppelin.notebook.storage</name>
  <value>org.apache.zeppelin.notebook.repo.MongoNotebookRepo</value>
  <description>notebook persistence layer implementation</description>
</property>
```

And **comment** lines below:

```xml
<property>
  <name>zeppelin.notebook.storage</name>
  <value>org.apache.zeppelin.notebook.repo.GitNotebookRepo</value>
  <description>versioned notebook persistence layer implementation</description>
</property>
```

### Configurable Options

You can configure options below in `zeppelin-env.sh`.

- `ZEPPELIN_NOTEBOOK_MONGO_URI` [MongoDB connection URI](https://docs.mongodb.com/manual/reference/connection-string/) used to connect to a MongoDB database server
- `ZEPPELIN_NOTEBOOK_MONGO_DATABASE` Database name
- `ZEPPELIN_NOTEBOOK_MONGO_COLLECTION` Collection name
- `ZEPPELIN_NOTEBOOK_MONGO_AUTOIMPORT` If `true`, import local notes (refer to description below for details)

Or, you can configure them in `zeppelin-site.xml`. Corresponding option names as follows:

- `zeppelin.notebook.mongo.uri`
- `zeppelin.notebook.mongo.database`
- `zeppelin.notebook.mongo.collection`
- `zeppelin.notebook.mongo.autoimport`

#### Example configurations in `zeppelin-env.sh`

```sh
export ZEPPELIN_NOTEBOOK_MONGO_URI=mongodb://db1.example.com:27017
export ZEPPELIN_NOTEBOOK_MONGO_DATABASE=myfancy
export ZEPPELIN_NOTEBOOK_MONGO_COLLECTION=notebook
export ZEPPELIN_NOTEBOOK_MONGO_AUTOIMPORT=true
```

#### Import your local notes automatically

By setting `ZEPPELIN_NOTEBOOK_MONGO_AUTOIMPORT` as `true` (default `false`), you can import your local notes automatically when Zeppelin daemon starts up. This feature is for easy migration from local file system storage to MongoDB storage. A note with ID already existing in the collection will not be imported.

## Notebook Storage in GitHub





To enable GitHub tracking, uncomment the following properties in `zeppelin-site.xml`

```xml
<property>
  <name>zeppelin.notebook.git.remote.url</name>
  <value></value>
  <description>remote Git repository URL</description>
</property>

<property>
  <name>zeppelin.notebook.git.remote.username</name>
  <value>token</value>
  <description>remote Git repository username</description>
</property>

<property>
  <name>zeppelin.notebook.git.remote.access-token</name>
  <value></value>
  <description>remote Git repository password</description>
</property>

<property>
  <name>zeppelin.notebook.git.remote.origin</name>
  <value>origin</value>
  <description>Git repository remote</description>
</property>
```

And set the `zeppelin.notebook.storage` propery to `org.apache.zeppelin.notebook.repo.GitHubNotebookRepo`

```xml
<property>
  <name>zeppelin.notebook.storage</name>
  <value>org.apache.zeppelin.notebook.repo.GitHubNotebookRepo</value>
</property>
```

The access token could be obtained by following the steps on this link https://github.com/settings/tokens.