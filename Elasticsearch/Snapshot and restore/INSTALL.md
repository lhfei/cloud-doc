https://www.elastic.co/guide/en/elasticsearch/reference/current/snapshots-register-repository.html



### Hadoop HDFS Repository Plugin

[see](https://www.elastic.co/guide/en/elasticsearch/plugins/7.6/repository-hdfs.html)

#### Install

```shell
./bin/elasticsearch-plugin install file:///export/cloud/elasticsearch-7.6.0/repository-hdfs-7.6.0.zip
```

then verify it as below:

```shell
./bin/elasticsearch-plugin list
```



```shell
mkdir -p /export/app_data/elasticsearch/backups
chown -R elastic:elastic /export/app_data/elasticsearch/backups
```

The shared file system repository (`"type": "fs"`) uses the shared file system to store snapshots. In order to register the shared file system repository it is necessary to mount the same shared filesystem to the same location on all master and data nodes. This location (or one of its parent directories) must be registered in the `path.repo` setting on all master and data nodes.

Assuming that the shared filesystem is mounted to `/export/app_data/elasticsearch/backups`, the following setting should be added to `elasticsearch.yml` file:

```yaml
path.repo: ["/export/app_data/elasticsearch/backups"]
```



```shell
PUT /_snapshot/my_backup
{
  "type": "fs",
  "settings": {
    "location": "/export/app_data/elasticsearch/backups/my_backup"
  }
}
```

To retrieve information about all registered snapshot repositories, omit the repository name or specify `_all`:

```console
GET /_snapshot
```

or

```console
GET /_snapshot/_all
```

