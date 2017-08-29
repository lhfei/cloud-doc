
Legacy ACL metadata detected. Please migrate ACL metadata first. Step1: run command 'bin/kylin.sh org.apache.kylin.tool.AclTableMigrationCLI MIGRATE', Step2: drop hbase tables: kylin_metadata_acl and kylin_metadata_user

```sh

bin/kylin.sh org.apache.kylin.tool.AclTableMigrationCLI MIGRATE

```

### Reset Metadata

```sh
./bin/metastore.sh reset
```