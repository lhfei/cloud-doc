

## OFS



### o3fs

> volume

```shell
ozone sh volume --help
Usage: ozone sh volume [-hV] [COMMAND]
Volume specific operations
  -h, --help      Show this help message and exit.
  -V, --version   Print version information and exit.
Commands:
  info       returns information about a specific volume
  list, ls   List the volumes of a given user
  create     Creates a volume for the specified user
  update     Updates parameter of the volumes
  delete     deletes a volume if it is empty
  addacl     Add one or more new ACLs.
  removeacl  Remove one or more existing ACLs.
  setacl     Set one or more ACLs, replacing the existing ones.
  getacl     List all ACLs.
  setquota   Set quota of the volumes
  clrquota   clear quota of the volume
```



> bucket

```shell
ozone sh bucket --help
Usage: ozone sh bucket [-hV] [COMMAND]
Bucket specific operations
  -h, --help      Show this help message and exit.
  -V, --version   Print version information and exit.
Commands:
  info       returns information about a bucket
  list, ls   lists the buckets in a volume.
  create     creates a bucket in a given volume
  setquota   Set quota of the buckets
  link       creates a symlink to another bucket
  delete     deletes an empty bucket
  addacl     Add one or more new ACLs.
  removeacl  Remove one or more existing ACLs.
  getacl     List all ACLs.
  setacl     Set one or more ACLs, replacing the existing ones.
  clrquota   clear quota of the bucket
```



> key

```shell
ozone sh key --help
Usage: ozone sh key [-hV] [COMMAND]
Key specific operations
  -h, --help      Show this help message and exit.
  -V, --version   Print version information and exit.
Commands:
  info       returns information about an existing key
  list, ls   list all keys in a given bucket
  get        Gets a specific key from ozone server
  cat        Copies a specific Ozone key to standard output
  put        creates or overwrites an existing key
  rename     renames an existing key
  cp         copies an existing key to another one within the same bucket
  delete     deletes an existing key
  addacl     Add one or more new ACLs.
  removeacl  Remove one or more existing ACLs.
  setacl     Set one or more ACLs, replacing the existing ones.
  getacl     List all ACLs.
```





