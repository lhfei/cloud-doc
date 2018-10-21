# Configuration Parameters

OmniSci has minimal configuration requirements with a number of additional configuration options. This topic describes the required and optional configuration changes you can use in your OmniSci instance.

## Data Directory

Before starting the OmniSci server, you must initialize the persistent `data` directory. To do so, create an empty directory at the desired path, such as `/var/lib/mapd`. Create the environment variable `$MAPD_STORAGE`.

```
export MAPD_STORAGE=/var/lib/mapd
```

Change the owner of the directory to the user that the server will run as (`$MAPD_USER`):

```
sudo mkdir -p $MAPD_STORAGE
sudo chown -R $MAPD_USER $MAPD_STORAGE
```

Where `$MAPD_USER` is the system user account that the server runs as, such as `mapd`, and `$MAPD_STORAGE` is the path to the parent of the OmniSci server `data` directory.

Finally, run `$MAPD_PATH/bin/initdb` with the data directory path as the argument:

```
$MAPD_PATH/bin/initdb $MAPD_STORAGE
```

## Configuration File

OmniSci supports storing options in a configuration file. This is useful if, for example, you need to run the OmniSci server and web server on ports different than the defaults.

If you store a copy of `mapd.conf` in the $MAPD_STORAGE directory, the configuration settings are picked up automatically by the `sudo systemctl start mapd_server` and `sudo systemctl start mapd_web_server` commands.

Set the flags in the configuration file using the format `<flag> = <value>`. Strings must be enclosed in quotes. The following is a sample configuration file. The entry for `data` path is a string and must be in quotes. The entry for the optional `read-only` flag is the Boolean value `true` and is not in quotes.

```
port = 9091
http-port = 9090
data = "/var/lib/mapd/data"
read-only = true


[web]
port = 9092
frontend =
 "/home/osboxes/installs/mapd-3.0.0-20170502-9e5ba95-Linux-x86_64-render/frontend"
```

### Configuration Flags for OmniSci Server

| Flag                                    | Description                                                  | Implied Value | Default Value                                     | Why Change It?                                               |
| --------------------------------------- | ------------------------------------------------------------ | ------------- | ------------------------------------------------- | ------------------------------------------------------------ |
| `calcite-port arg `                     | Calcite port number                                          |               | 9093                                              | Change to avoid collisions with ports already in use.        |
| `cluster arg`                           | Path to data leaves list JSON file. Indicates that the OmniSci server instance is an aggregator node, and where to find the rest of its cluster. Enterprise only. |               | $MAPD_STORAGE                                     | Change for testing and debugging.                            |
| `config arg`                            | Path to mapd.conf                                            |               | $MAPD_STORAGE                                     | Change for testing and debugging.                            |
| `cpu`                                   | Run on CPU only                                              |               | FALSE                                             | One use case for disabling GPUs would be during database conversion. That requires moving a large amount of data with minimal processing. |
| `cpu-buffer-mem-bytes arg `             | Size of memory reserved for CPU buffers [bytes]              |               | 0                                                 |                                                              |
| `data arg`                              | Directory path to OmniSci catalogs                           |               | $MAPD_STORAGE                                     | Change for testing and debugging.                            |
| `enable-watchdog [arg]`                 | Enable watchdog                                              | TRUE[1]       | TRUE[1]                                           |                                                              |
| `flush-log [arg]`                       | Immediately flush logs to disk.                              | TRUE[1]       | TRUE[1]                                           | Set to FALSE if this is a performance bottleneck.            |
| `from-table-reordering [=arg(=1)] (=1)` | Enable automatic table reordering in FROM clause             | TRUE[1]       | TRUE[1]                                           |                                                              |
| `gpu`                                   | Run on GPUs (Default)                                        |               | TRUE                                              | One use case for disabling GPUs would be during database conversion. That requires moving a large amount of data with minimal processing. |
| `gpu-buffer-mem-bytes arg`              | Size of memory reserved for GPU buffers [bytes] (per GPU)    |               | 0                                                 | Restricts the amount of memory a single process uses, so that when running multitenancy in the cloud several processes can all use the same gpus. |
| `ha-shared-data arg`                    | Directory path to shared OmniSci.directory. Enterprise only. |               |                                                   |                                                              |
| `http-port arg`                         | HTTP port number                                             |               | 9090                                              | Change to avoid collisions with ports already in use.        |
| `idle-session-duration arg`             | Maximum duration of an idle session, in minutes.             |               | 60                                                | Change to increase or decrease duration of an idle session before timeout. |
| `ldap-dn arg`                           | ldap DN Distinguished Name. Enterprise only.                 |               | (=uid=%s, cn=users, cn=accounts, dc=mapd, dc=com) |                                                              |
| `ldap-role-query-regex arg`             | RegEx to use to extract role from role query result. Enterprise only. |               |                                                   |                                                              |
| `ldap-role-query-url arg`               | ldap query role URL. Enterprise only.                        |               |                                                   |                                                              |
| `ldap-superuser-role arg`               | The role name to identify a superuser. Enterprise only.      |               |                                                   |                                                              |
| `ldap-uri arg `                         | ldap server uri. Enterprise only.                            |               |                                                   |                                                              |
| `left-deep-join-optimization [=arg]`    | Enable left-deep join optimization                           | TRUE[1]       | TRUE[1]                                           |                                                              |
| `license arg`                           | Path to file containing license key                          |               |                                                   |                                                              |
| `max-session-duration arg`              | Maximum duration of the active session, in days              |               | 30                                                | Change to increase or decrease session duration before timeout. |
| `null-div-by-zero [=arg]`               | Allows processing to complete when when the dataset would cause a div/0 error. |               | 0                                                 |                                                              |
| `num-gpus arg`                          | Number of gpus to use                                        |               | -1                                                | In a shared environment, you can assign the number of GPUs to a particular application. The default, -1, means use all available GPUs. |
| `read-only [=arg]`                      | Enable read-only mode                                        | TRUE[1]       | FALSE[0]                                          | Prevents inadvertent (or purposeful) changes to the dataset. |
| `render-mem-bytes arg`                  | Size of memory reserved for rendering [bytes]                |               | 500000000                                         |                                                              |
| `render-poly-cache-bytes arg`           | Size of memory reserved for polygon rendering [bytes]        |               | 300000000                                         |                                                              |
| `rendering [=arg]`                      | Enable/disable backend rendering                             | TRUE[1]       | TRUE[1]                                           |                                                              |
| `start-gpu arg`                         | First gpu to use                                             |               | FALSE[0]                                          |                                                              |
| `string-servers arg`                    | Path to string servers list JSON file. Enterprise only.      |               |                                                   |                                                              |

### Advanced Configuration Flags for OmniSci Server

| Flag                                           | Description                                                  | Implied Value                                      | Default Value | Why Change It?                                               |
| ---------------------------------------------- | ------------------------------------------------------------ | -------------------------------------------------- | ------------- | ------------------------------------------------------------ |
| `allow-cpu-retry [=arg]`                       | Allow the queries which failed on GPU to retry on CPU, even when watchdog is enabled. | TRUE[1]                                            | FALSE [0]     |                                                              |
| `allow-loop-joins [=arg]`                      | Enable loop joins                                            | TRUE[1]                                            | FALSE [0]     | Loop joins can be effective when you compare a large inner dataset to a small outer dataset. When working with two large datasets, performance is predictably slower. |
| `auth-rest-token arg`                          | Token for REST-based authentication. Enterprise only.        |                                                    |               |                                                              |
| `auth-rest-url arg`                            | URL for REST-based authentication. Enterprise only.          |                                                    |               |                                                              |
| `bigint-count [=arg]`                          | Use 64-bit count                                             | FALSE[0]                                           | FALSE[0]      |                                                              |
| `calcite-max-mem arg`                          | Max memory available to calcite JVM                          |                                                    | 1024          |                                                              |
| `cuda-block-size arg`                          | Size of block to use on GPU                                  |                                                    | 0             |                                                              |
| `cuda-grid-size arg`                           | Size of grid to use on GPU                                   |                                                    | 0             |                                                              |
| `db-convert arg`                               | Directory path to OmniSci DB to convert from                 |                                                    |               |                                                              |
| `db-query-list arg`                            | Path to file containing OmniSci queries                      | N/A                                                | N/A           | Use a query list to autoload data to GPU memory on startup to speed performance. |
| `disable-legacy-syntax [=arg(=0)] (=1)`        | Legacy syntax is disabled by default. Set this value to 0 to enable legacy syntax. | FALSE[0] (i.e., enable legacy syntax)              | TRUE[1]       |                                                              |
| `disable-multifrag [=arg(=0)] (=1)`            | Disable execution over multiple fragments in a single round-trip to GPU | FALSE[0] (i.e., enable multifrag)                  | TRUE[1]       | A fragment, in this context, is a subset of a data table comprising up to 32MM rows. When disabled, only one fragment is processed at a time. |
| `disable-rendering [=arg(=0)] (=1)`            | Deprecated, use --rendering=false                            | FALSE[0] (i.e., enable rendering)                  | TRUE[1]       |                                                              |
| `disable-shared-mem-group-by`                  | Enable/disable using GPU shared memory for GROUP BY.         | FALSE[0] (i.e., enable shared memory for GROUP BY) | TRUE[1]       |                                                              |
| `dynamic-watchdog-time-limit [=arg]`           | Dynamic watchdog time limit, in milliseconds                 | 10000                                              | 100000        |                                                              |
| `enable-access-priv-check [=arg]`              | Check user access privileges to database objects             | TRUE[1]                                            | TRUE[1]       |                                                              |
| `enable-debug-timer [=arg]`                    | Enable dynamic watchdog                                      | TRUE[1]                                            | FALSE [0]     |                                                              |
| `enable-dynamic-watchdog [=arg]`               | Enable dynamic watchdog                                      | TRUE[1]                                            | FALSE [0]     |                                                              |
| `fast-strcmp [=arg]`                           | Enable fast string comparison                                | FALSE[0] (i.e., disable fast string comparison)    | TRUE[1]       |                                                              |
| `ha-brokers arg`                               | Location of the HA brokers. Enterprise only.                 |                                                    |               |                                                              |
| `ha-group-id arg`                              | Id of the HA group this server is in. Enterprise only.       |                                                    |               |                                                              |
| `ha-unique-server-id arg`                      | Unique id to identify this server in the HA group. Enterprise only. |                                                    |               |                                                              |
| `hll-precision-bits [=arg]`                    | Number of bits used from the hash value used to specify the bucket number. | 11                                                 | 11            |                                                              |
| `inner-join-fragment-skipping [=arg(=1)] (=0)` | Enable/disable inner join fragment skipping.                 |                                                    |               |                                                              |
| `jit-debug [=arg]`                             | Enable debugger support for the JIT. The generated code can be found at /tmp/mapdquery. | TRUE[1]                                            | FALSE[0]      | Increasing might adversely affect render performance and stability. |
| `leaf-conn-timeout [=arg]`                     | Leaf connect timeout, in milliseconds. Enterprise only.      | 20000                                              | 20000         |                                                              |
| `leaf-recv-timeout [=arg]`                     | Leaf receive timeout, in milliseconds. Enterprise only.      | 300000                                             | 300000        |                                                              |
| `leaf-send-timeout [=arg]`                     | Leaf send timeout, in milliseconds. Enterprise only.         | 300000                                             | 300000        |                                                              |
| `num-reader-threads arg`                       | Number of reader threads to use                              |                                                    | 0             |                                                              |
| `res-gpu-mem =arg`                             | Reserved memory for GPU, not use OmniSci allocator.          |                                                    | 134217728     | OmniSci is very greedy. We take all the memory on the GPU except for (Render-Mem-Bytes + Res-Gpu_Mem). We allocate for all of render-mem-bytes at startup. The res-gpu-mem allows you to reserve some extra memory for your system (for example, if your GPU is also driving your display, like on a laptop or single card desktop). This is also a useful flag if you have other processes sharing the GPU with OmniSci, such as a machine learning pipeline. In advanced rendering scenarios or distributed setups, increasing `res-gpu-mem` allows the system to grab additional memory for the renderer, or for aggregating results for the renderer from multiple leaf nodes. |
| `trivial-loop-join-threshold [=arg]`           | The maximum number of rows in the inner table of a loop join considered to be trivially small | 1000                                               | 1000          |                                                              |

### Configuration Flags for OmniSci Web Server

| Flag                  | Description                                 | Default                 | Why Change It?                                               |
| --------------------- | ------------------------------------------- | ----------------------- | ------------------------------------------------------------ |
| `backend-url`         | URL to http-port on mapd_server             | `http://localhost:9090` | Change to avoid collisions with other services.              |
| `cert`                | Certificate file for HTTPS                  | `cert.pem`              | Change for testing and debugging.                            |
| `config`              | Path to OmniSci configuration file          |                         | Change for testing and debugging.                            |
| `data`                | Path to OmniSci data directory              | `data`                  | Change for testing and debugging.                            |
| `docs string`         | Path to documentation directory             | `docs`                  |                                                              |
| `enable-https`        | Enable HTTPS support                        |                         | Change to enable secure HTTP.                                |
| `frontend string`     | Path to frontend directory                  | `frontend`              |                                                              |
| `key string`          | Key file for HTTPS                          | `key.pem`               | Change for testing and debugging.                            |
| `port int`            | Frontend server port                        | `9092`                  | Change to avoid collisions with other services.              |
| `read-only`           | Enable read-only mode                       |                         | Prevent inadvertent (or nefarious) changes to the data.      |
| `servers-json string` | Path to servers.json                        |                         | Change for testing and debugging.                            |
| `timeout`             | Maximum request duration in `#h#m#s` format | `1h0m0s`                | The `--timeout` option controls the maximum duration of individual HTTP requests. This is used to manage resource exhaustion caused by improperly closed connections. One side effect is that it limits the execution time of queries made over the Thrift HTTP transport. This timeout duration must be increased if queries are expected to take longer than the default duration of one hour; for example, if you perform a COPY FROM on a large file when using mapdql with the HTTP transport. |
| `tmpdir string`       | Path for temporary file storage             | `/tmp`                  | The temporary directory is used as a staging location for file uploads. You might want to locate this directory on the same file system as the OmniSci data directory. If not specified on the command line, `mapd_web_server`also respects the standard `TMPDIR` environment variable as well as a specific `MAPD_TMPDIR`environment variable, the latter of which takes precedence. If you use neither the command-line argument nor one of the environment variables, the default, `/tmp/`, is used. |
| `verbose`             | Print all log messages to stdout            |                         | Change for testing and debugging.                            |

## Using Configuration Flags on the Command Line

To use options provided in a configuration file, set the `--config` flag to the path of the configuration file for `mapd_server` and `mapd_web_server`. For example:

```
$MAPD_PATH/bin/mapd_server --config $MAPD_STORAGE/mapd.conf
```

You can also specify configuration settings at the command line. OmniSci recommends that you use the `systemctl` command to start and stop the servers, but you can use the `mapd_server` and `mapd_web_server` commands with configuration flags for testing and debugging.

### Command Line Configuration Flags for OmniSci Server

| Flag                                      | Description                                                  | Implied Value | Default Value                                     | Why Change It?                                               |
| ----------------------------------------- | ------------------------------------------------------------ | ------------- | ------------------------------------------------- | ------------------------------------------------------------ |
| `--calcite-port arg `                     | Calcite port number                                          |               | 9093                                              | Change to avoid collisions with ports already in use.        |
| `--cluster arg`                           | Path to data leaves list JSON file. Indicates that the OmniSci server instance is an aggregator node, and where to find the rest of its cluster. Enterprise only. |               | $MAPD_STORAGE                                     | Change for testing and debugging.                            |
| `--config arg`                            | Path to mapd.conf                                            |               | $MAPD_STORAGE                                     | Change for testing and debugging.                            |
| `--cpu`                                   | Run on CPU only                                              |               | FALSE                                             | One use case for disabling GPUs would be during database conversion. That requires moving a large amount of data with minimal processing. |
| `--cpu-buffer-mem-bytes arg `             | Size of memory reserved for CPU buffers [bytes]              |               | 0                                                 |                                                              |
| `--data arg`                              | Directory path to OmniSci catalogs                           |               | $MAPD_STORAGE                                     | Change for testing and debugging.                            |
| `--enable-watchdog [arg]`                 | Enable watchdog                                              | TRUE[1]       | TRUE[1]                                           |                                                              |
| `--flush-log [arg]`                       | Immediately flush logs to disk.                              | TRUE[1]       | TRUE[1]                                           | Set to FALSE if this is a performance bottleneck.            |
| `--from-table-reordering [=arg(=1)] (=1)` | Enable automatic table reordering in FROM clause             | TRUE[1]       | TRUE[1]                                           |                                                              |
| `--gpu`                                   | Run on GPUs (Default)                                        |               | TRUE                                              | One use case for disabling GPUs would be during database conversion. That requires moving a large amount of data with minimal processing. |
| `--gpu-buffer-mem-bytes arg`              | Size of memory reserved for GPU buffers [bytes] (per GPU)    |               | 0                                                 | Restricts the amount of memory a single process uses, so that when running multitenancy in the cloud several processes can all use the same GPUs. |
| `--ha-shared-data arg`                    | Directory path to shared OmniSci.directory. Enterprise only. |               |                                                   |                                                              |
| `--help-advanced`                         | Print advanced and experimental options. These options should not normally be used in production. |               |                                                   |                                                              |
| `--http-port arg`                         | HTTP port number                                             |               | 9090                                              | Change to avoid collisions with ports already in use.        |
| `--ldap-dn arg`                           | ldap DN Distinguished Name. Enterprise only.                 |               | (=uid=%s, cn=users, cn=accounts, dc=mapd, dc=com) |                                                              |
| `--ldap-role-query-regex arg`             | RegEx to use to extract role from role query result. Enterprise only. |               |                                                   |                                                              |
| `--ldap-role-query-url arg`               | ldap query role URL. Enterprise only.                        |               |                                                   |                                                              |
| `--ldap-superuser-role arg`               | The role name to identify a superuser. Enterprise only.      |               |                                                   |                                                              |
| `--ldap-uri arg `                         | ldap server uri. Enterprise only.                            |               |                                                   |                                                              |
| `--left-deep-join-optimization [=arg]`    | Enable left-deep join optimization                           | TRUE[1]       | TRUE[1]                                           |                                                              |
| `--license arg`                           | Path to file containing license key                          |               |                                                   |                                                              |
| `--null-div-by-zero [=arg]`               | Allows processing to complete when when the dataset would cause a div/0 error. |               | 0                                                 |                                                              |
| `--num-gpus arg`                          | Number of gpus to use                                        |               | -1                                                | In a shared environment, you can assign the number of GPUs to a particular application. The default, -1, means use all available GPUs. |
| `--read-only [=arg]`                      | Enable read-only mode                                        | TRUE[1]       | FALSE[0]                                          | Prevents inadvertent (or purposeful) changes to the dataset. |
| `--render-mem-bytes arg`                  | Size of memory reserved for rendering [bytes]                |               | 500000000                                         |                                                              |
| `--render-poly-cache-bytes arg`           | Size of memory reserved for polygon rendering [bytes]        |               | 300000000                                         |                                                              |
| `--rendering [=arg]`                      | Enable/disable backend rendering                             | TRUE[1]       | TRUE[1]                                           |                                                              |
| `--start-gpu arg`                         | First gpu to use                                             |               | FALSE[0]                                          |                                                              |
| `--string-servers arg`                    | Path to string servers list JSON file. Enterprise only.      |               |                                                   |                                                              |
| `-h [ --help ] `                          | Print help messages                                          |               |                                                   |                                                              |
| `-p [ --port ] arg`                       | Port number                                                  |               | 9091                                              | Change for testing and debugging.                            |
| `-v [ --version ]`                        | Print the OmniSci version in use.                            |               |                                                   |                                                              |

### Command Line Configuration Flags for OmniSci Web Server

| Flag                                        | Description                                                  | Default                 | Why Change It?                                               |
| ------------------------------------------- | ------------------------------------------------------------ | ----------------------- | ------------------------------------------------------------ |
| `-b | backend-url string`                   | URL to http-port on mapd_server                              | `http://localhost:9090` | Change to avoid collisions with other services.              |
| `--cert string`                             | Certificate file for HTTPS                                   | `cert.pem`              | Change for testing and debugging.                            |
| `-c | --config string`                      | Path to OmniSci configuration file                           |                         | Change for testing and debugging.                            |
| `-d | --data string`                        | Path to OmniSci data directory                               | `data`                  | Change for testing and debugging.                            |
| `--docs string`                             | Path to documentation directory                              | `docs`                  |                                                              |
| `--enable-https`                            | Enable HTTPS support                                         |                         | Change to enable secure HTTP.                                |
| `-f | --frontend string`                    | Path to frontend directory                                   | `frontend`              |                                                              |
| `--key string`                              | Key file for HTTPS                                           | `key.pem`               | Change for testing and debugging.                            |
| `-p | --port int`                           | Frontend server port                                         | `9092`                  | Change to avoid collisions with other services.              |
| `-r | --read-only`                          | Enable read-only mode                                        |                         | Prevent inadvertent (or nefarious) changes to the data.      |
| `--servers-json string`                     | Path to servers.json                                         |                         | Change for testing and debugging.                            |
| `--timeout duration`                        | Maximum request duration in `#h#m#s` format. For example `0h30m0s` represents a duration of 30 minutes. | `1h0m0s`                | The `--timeout` option controls the maximum duration of individual HTTP requests. This is used to manage resource exhaustion caused by improperly closed connections. One side effect is that it limits the execution time of queries made over the Thrift HTTP transport. This timeout duration must be increased if queries are expected to take longer than the default duration of one hour; for example, if you perform a COPY FROM on a large file when using mapdql with the HTTP transport. |
| `--tmpdir string`                           | Path for temporary file storage                              | `/tmp`                  | The temporary directory is used as a staging location for file uploads. You might want to place this directory on the same file system as the OmniSci data directory. If not specified on the command line, `mapd_web_server`also respects the standard `TMPDIR` environment variable as well as a specific `MAPD_TMPDIR`environment variable, the latter of which takes precedence. If you use neither the command-line argument nor one of the environment variables, the default, `/tmp/` is used. |
| `-v | --verbose`                            | Print all log messages to stdout                             |                         | Change for testing and debugging.                            |
| `--version`                                 | Return version                                               |                         |                                                              |
| `--db-query-list <path-to-query-list-file>` | Pre-load data to memory based on SQL queries stored in a list file. | n/a                     | Automatically run queries that load the most frequently used data to enhance performance. See [Pre-loading Data](https://www.omnisci.com/docs/latest/4_performance.html#preloading-data). |