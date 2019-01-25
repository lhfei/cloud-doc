# Command Line Interface

Airflow has a very rich command line interface that allows for many types of operation on a DAG, starting services, and supporting development and testing.

```
usage: airflow [-h]
               {version,initdb,upgradedb,delete_dag,task_state,list_dags,resetdb,create_user,webserver,pool,scheduler,serve_logs,clear,trigger_dag,test,connections,worker,kerberos,pause,task_failed_deps,render,run,list_tasks,backfill,dag_state,variables,flower,unpause}
               ...
```

## Positional Arguments

| subcommand | Possible choices: version, initdb, upgradedb, delete_dag, task_state, list_dags, resetdb, create_user, webserver, pool, scheduler, serve_logs, clear, trigger_dag, test, connections, worker, kerberos, pause, task_failed_deps, render, run, list_tasks, backfill, dag_state, variables, flower, unpausesub-command help |
| ---------- | ------------------------------------------------------------ |
|            |                                                              |

## Sub-commands:

### version

Show the version

```
airflow version [-h]
```

### initdb

Initialize the metadata database

```
airflow initdb [-h]
```

### upgradedb

Upgrade the metadata database to latest version

```
airflow upgradedb [-h]
```

### delete_dag

Delete all DB records related to the specified DAG

```
airflow delete_dag [-h] [-y] dag_id
```

#### Positional Arguments

| dag_id | The id of the dag |
| ------ | ----------------- |
|        |                   |

#### Named Arguments

| -y, --yes | Do not prompt to confirm reset. Use with care!Default: False |
| --------- | ------------------------------------------------------------ |
|           |                                                              |

### task_state

Get the status of a task instance

```
airflow task_state [-h] [-sd SUBDIR] dag_id task_id execution_date
```

#### Positional Arguments

| dag_id         | The id of the dag             |
| -------------- | ----------------------------- |
| task_id        | The id of the task            |
| execution_date | The execution date of the DAG |

#### Named Arguments

| -sd, --subdir | File location or directory from which to look for the dag. Defaults to ‘[AIRFLOW_HOME]/dags’ where [AIRFLOW_HOME] is the value you set for ‘AIRFLOW_HOME’ config you set in ‘airflow.cfg’Default: “[AIRFLOW_HOME]/dags” |
| ------------- | ------------------------------------------------------------ |
|               |                                                              |

### list_dags

List all the DAGs

```
airflow list_dags [-h] [-sd SUBDIR] [-r]
```

#### Named Arguments

| -sd, --subdir | File location or directory from which to look for the dag. Defaults to ‘[AIRFLOW_HOME]/dags’ where [AIRFLOW_HOME] is the value you set for ‘AIRFLOW_HOME’ config you set in ‘airflow.cfg’Default: “[AIRFLOW_HOME]/dags” |
| ------------- | ------------------------------------------------------------ |
| -r, --report  | Show DagBag loading reportDefault: False                     |

### resetdb

Burn down and rebuild the metadata database

```
airflow resetdb [-h] [-y]
```

#### Named Arguments

| -y, --yes | Do not prompt to confirm reset. Use with care!Default: False |
| --------- | ------------------------------------------------------------ |
|           |                                                              |

### create_user

Create an admin account

```
airflow create_user [-h] [-r ROLE] [-u USERNAME] [-e EMAIL] [-f FIRSTNAME]
                    [-l LASTNAME] [-p PASSWORD] [--use_random_password]
```

#### Named Arguments

| -r, --role            | Role of the user. Existing roles include Admin, User, Op, Viewer, and Public |
| --------------------- | ------------------------------------------------------------ |
| -u, --username        | Username of the user                                         |
| -e, --email           | Email of the user                                            |
| -f, --firstname       |                                                              |
|                       | First name of the user                                       |
| -l, --lastname        | Last name of the user                                        |
| -p, --password        | Password of the user                                         |
| --use_random_password |                                                              |
|                       | Do not prompt for password. Use random string insteadDefault: False |

### webserver

Start a Airflow webserver instance

```
airflow webserver [-h] [-p PORT] [-w WORKERS]
                  [-k {sync,eventlet,gevent,tornado}] [-t WORKER_TIMEOUT]
                  [-hn HOSTNAME] [--pid [PID]] [-D] [--stdout STDOUT]
                  [--stderr STDERR] [-A ACCESS_LOGFILE] [-E ERROR_LOGFILE]
                  [-l LOG_FILE] [--ssl_cert SSL_CERT] [--ssl_key SSL_KEY] [-d]
```

#### Named Arguments

| -p, --port           | The port on which to run the serverDefault: 8080             |
| -------------------- | ------------------------------------------------------------ |
| -w, --workers        | Number of workers to run the webserver onDefault: 4          |
| -k, --workerclass    |                                                              |
|                      | Possible choices: sync, eventlet, gevent, tornadoThe worker class to use for GunicornDefault: “sync” |
| -t, --worker_timeout |                                                              |
|                      | The timeout for waiting on webserver workersDefault: 120     |
| -hn, --hostname      |                                                              |
|                      | Set the hostname on which to run the web serverDefault: “0.0.0.0” |
| --pid                | PID file location                                            |
| -D, --daemon         | Daemonize instead of running in the foregroundDefault: False |
| --stdout             | Redirect stdout to this file                                 |
| --stderr             | Redirect stderr to this file                                 |
| -A, --access_logfile |                                                              |
|                      | The logfile to store the webserver access log. Use ‘-‘ to print to stderr.Default: “-“ |
| -E, --error_logfile  |                                                              |
|                      | The logfile to store the webserver error log. Use ‘-‘ to print to stderr.Default: “-“ |
| -l, --log-file       | Location of the log file                                     |
| --ssl_cert           | Path to the SSL certificate for the webserver                |
| --ssl_key            | Path to the key to use with the SSL certificate              |
| -d, --debug          | Use the server that ships with Flask in debug modeDefault: False |

### pool

CRUD operations on pools

```
airflow pool [-h] [-s NAME SLOT_COUNT POOL_DESCRIPTION] [-g NAME] [-x NAME]
```

#### Named Arguments

| -s, --set    | Set pool slot count and description, respectively |
| ------------ | ------------------------------------------------- |
| -g, --get    | Get pool info                                     |
| -x, --delete | Delete a pool                                     |

### scheduler

Start a scheduler instance

```
airflow scheduler [-h] [-d DAG_ID] [-sd SUBDIR] [-r RUN_DURATION]
                  [-n NUM_RUNS] [-p] [--pid [PID]] [-D] [--stdout STDOUT]
                  [--stderr STDERR] [-l LOG_FILE]
```

#### Named Arguments

| -d, --dag_id       | The id of the dag to run                                     |
| ------------------ | ------------------------------------------------------------ |
| -sd, --subdir      | File location or directory from which to look for the dag. Defaults to ‘[AIRFLOW_HOME]/dags’ where [AIRFLOW_HOME] is the value you set for ‘AIRFLOW_HOME’ config you set in ‘airflow.cfg’Default: “[AIRFLOW_HOME]/dags” |
| -r, --run-duration |                                                              |
|                    | Set number of seconds to execute before exiting              |
| -n, --num_runs     | Set the number of runs to execute before exitingDefault: -1  |
| -p, --do_pickle    |                                                              |
|                    | Attempt to pickle the DAG object to send over to the workers, instead of letting workers run their version of the code.Default: False |
| --pid              | PID file location                                            |
| -D, --daemon       | Daemonize instead of running in the foregroundDefault: False |
| --stdout           | Redirect stdout to this file                                 |
| --stderr           | Redirect stderr to this file                                 |
| -l, --log-file     | Location of the log file                                     |

### serve_logs

Serve logs generate by worker

```
airflow serve_logs [-h]
```

### clear

Clear a set of task instance, as if they never ran

```
airflow clear [-h] [-t TASK_REGEX] [-s START_DATE] [-e END_DATE] [-sd SUBDIR]
              [-u] [-d] [-c] [-f] [-r] [-x] [-xp] [-dx]
              dag_id
```

#### Positional Arguments

| dag_id | The id of the dag |
| ------ | ----------------- |
|        |                   |

#### Named Arguments

| -t, --task_regex         |                                                              |
| ------------------------ | ------------------------------------------------------------ |
|                          | The regex to filter specific task_ids to backfill (optional) |
| -s, --start_date         |                                                              |
|                          | Override start_date YYYY-MM-DD                               |
| -e, --end_date           | Override end_date YYYY-MM-DD                                 |
| -sd, --subdir            | File location or directory from which to look for the dag. Defaults to ‘[AIRFLOW_HOME]/dags’ where [AIRFLOW_HOME] is the value you set for ‘AIRFLOW_HOME’ config you set in ‘airflow.cfg’Default: “[AIRFLOW_HOME]/dags” |
| -u, --upstream           | Include upstream tasksDefault: False                         |
| -d, --downstream         |                                                              |
|                          | Include downstream tasksDefault: False                       |
| -c, --no_confirm         |                                                              |
|                          | Do not request confirmationDefault: False                    |
| -f, --only_failed        |                                                              |
|                          | Only failed jobsDefault: False                               |
| -r, --only_running       |                                                              |
|                          | Only running jobsDefault: False                              |
| -x, --exclude_subdags    |                                                              |
|                          | Exclude subdagsDefault: False                                |
| -xp, --exclude_parentdag |                                                              |
|                          | Exclude ParentDAGS if the task cleared is a part of a SubDAGDefault: False |
| -dx, --dag_regex         |                                                              |
|                          | Search dag_id as regex instead of exact stringDefault: False |

### trigger_dag

Trigger a DAG run

```
airflow trigger_dag [-h] [-sd SUBDIR] [-r RUN_ID] [-c CONF] [-e EXEC_DATE]
                    dag_id
```

#### Positional Arguments

| dag_id | The id of the dag |
| ------ | ----------------- |
|        |                   |

#### Named Arguments

| -sd, --subdir   | File location or directory from which to look for the dag. Defaults to ‘[AIRFLOW_HOME]/dags’ where [AIRFLOW_HOME] is the value you set for ‘AIRFLOW_HOME’ config you set in ‘airflow.cfg’Default: “[AIRFLOW_HOME]/dags” |
| --------------- | ------------------------------------------------------------ |
| -r, --run_id    | Helps to identify this run                                   |
| -c, --conf      | JSON string that gets pickled into the DagRun’s conf attribute |
| -e, --exec_date |                                                              |
|                 | The execution date of the DAG                                |

### test

Test a task instance. This will run a task without checking for dependencies or recording its state in the database.

```
airflow test [-h] [-sd SUBDIR] [-dr] [-tp TASK_PARAMS]
             dag_id task_id execution_date
```

#### Positional Arguments

| dag_id         | The id of the dag             |
| -------------- | ----------------------------- |
| task_id        | The id of the task            |
| execution_date | The execution date of the DAG |

#### Named Arguments

| -sd, --subdir      | File location or directory from which to look for the dag. Defaults to ‘[AIRFLOW_HOME]/dags’ where [AIRFLOW_HOME] is the value you set for ‘AIRFLOW_HOME’ config you set in ‘airflow.cfg’Default: “[AIRFLOW_HOME]/dags” |
| ------------------ | ------------------------------------------------------------ |
| -dr, --dry_run     | Perform a dry runDefault: False                              |
| -tp, --task_params |                                                              |
|                    | Sends a JSON params dict to the task                         |

### connections

List/Add/Delete connections

```
airflow connections [-h] [-l] [-a] [-d] [--conn_id CONN_ID]
                    [--conn_uri CONN_URI] [--conn_extra CONN_EXTRA]
                    [--conn_type CONN_TYPE] [--conn_host CONN_HOST]
                    [--conn_login CONN_LOGIN] [--conn_password CONN_PASSWORD]
                    [--conn_schema CONN_SCHEMA] [--conn_port CONN_PORT]
```

#### Named Arguments

| -l, --list      | List all connectionsDefault: False                           |
| --------------- | ------------------------------------------------------------ |
| -a, --add       | Add a connectionDefault: False                               |
| -d, --delete    | Delete a connectionDefault: False                            |
| --conn_id       | Connection id, required to add/delete a connection           |
| --conn_uri      | Connection URI, required to add a connection without conn_type |
| --conn_extra    | Connection Extra field, optional when adding a connection    |
| --conn_type     | Connection type, required to add a connection without conn_uri |
| --conn_host     | Connection host, optional when adding a connection           |
| --conn_login    | Connection login, optional when adding a connection          |
| --conn_password |                                                              |
|                 | Connection password, optional when adding a connection       |
| --conn_schema   | Connection schema, optional when adding a connection         |
| --conn_port     | Connection port, optional when adding a connection           |

### worker

Start a Celery worker node

```
airflow worker [-h] [-p] [-q QUEUES] [-c CONCURRENCY] [-cn CELERY_HOSTNAME]
               [--pid [PID]] [-D] [--stdout STDOUT] [--stderr STDERR]
               [-l LOG_FILE]
```

#### Named Arguments

| -p, --do_pickle        |                                                              |
| ---------------------- | ------------------------------------------------------------ |
|                        | Attempt to pickle the DAG object to send over to the workers, instead of letting workers run their version of the code.Default: False |
| -q, --queues           | Comma delimited list of queues to serveDefault: “default”    |
| -c, --concurrency      |                                                              |
|                        | The number of worker processesDefault: 16                    |
| -cn, --celery_hostname |                                                              |
|                        | Set the hostname of celery worker if you have multiple workers on a single machine. |
| --pid                  | PID file location                                            |
| -D, --daemon           | Daemonize instead of running in the foregroundDefault: False |
| --stdout               | Redirect stdout to this file                                 |
| --stderr               | Redirect stderr to this file                                 |
| -l, --log-file         | Location of the log file                                     |

### kerberos

Start a kerberos ticket renewer

```
airflow kerberos [-h] [-kt [KEYTAB]] [--pid [PID]] [-D] [--stdout STDOUT]
                 [--stderr STDERR] [-l LOG_FILE]
                 [principal]
```

#### Positional Arguments

| principal | kerberos principalDefault: “airflow” |
| --------- | ------------------------------------ |
|           |                                      |

#### Named Arguments

| -kt, --keytab  | keytabDefault: “airflow.keytab”                              |
| -------------- | ------------------------------------------------------------ |
| --pid          | PID file location                                            |
| -D, --daemon   | Daemonize instead of running in the foregroundDefault: False |
| --stdout       | Redirect stdout to this file                                 |
| --stderr       | Redirect stderr to this file                                 |
| -l, --log-file | Location of the log file                                     |

### pause

Pause a DAG

```
airflow pause [-h] [-sd SUBDIR] dag_id
```

#### Positional Arguments

| dag_id | The id of the dag |
| ------ | ----------------- |
|        |                   |

#### Named Arguments

| -sd, --subdir | File location or directory from which to look for the dag. Defaults to ‘[AIRFLOW_HOME]/dags’ where [AIRFLOW_HOME] is the value you set for ‘AIRFLOW_HOME’ config you set in ‘airflow.cfg’Default: “[AIRFLOW_HOME]/dags” |
| ------------- | ------------------------------------------------------------ |
|               |                                                              |

### task_failed_deps

Returns the unmet dependencies for a task instance from the perspective of the scheduler. In other words, why a task instance doesn’t get scheduled and then queued by the scheduler, and then run by an executor).

```
airflow task_failed_deps [-h] [-sd SUBDIR] dag_id task_id execution_date
```

#### Positional Arguments

| dag_id         | The id of the dag             |
| -------------- | ----------------------------- |
| task_id        | The id of the task            |
| execution_date | The execution date of the DAG |

#### Named Arguments

| -sd, --subdir | File location or directory from which to look for the dag. Defaults to ‘[AIRFLOW_HOME]/dags’ where [AIRFLOW_HOME] is the value you set for ‘AIRFLOW_HOME’ config you set in ‘airflow.cfg’Default: “[AIRFLOW_HOME]/dags” |
| ------------- | ------------------------------------------------------------ |
|               |                                                              |

### render

Render a task instance’s template(s)

```
airflow render [-h] [-sd SUBDIR] dag_id task_id execution_date
```

#### Positional Arguments

| dag_id         | The id of the dag             |
| -------------- | ----------------------------- |
| task_id        | The id of the task            |
| execution_date | The execution date of the DAG |

#### Named Arguments

| -sd, --subdir | File location or directory from which to look for the dag. Defaults to ‘[AIRFLOW_HOME]/dags’ where [AIRFLOW_HOME] is the value you set for ‘AIRFLOW_HOME’ config you set in ‘airflow.cfg’Default: “[AIRFLOW_HOME]/dags” |
| ------------- | ------------------------------------------------------------ |
|               |                                                              |

### run

Run a single task instance

```
airflow run [-h] [-sd SUBDIR] [-m] [-f] [--pool POOL] [--cfg_path CFG_PATH]
            [-l] [-A] [-i] [-I] [--ship_dag] [-p PICKLE] [-int]
            dag_id task_id execution_date
```

#### Positional Arguments

| dag_id         | The id of the dag             |
| -------------- | ----------------------------- |
| task_id        | The id of the task            |
| execution_date | The execution date of the DAG |

#### Named Arguments

| -sd, --subdir                 | File location or directory from which to look for the dag. Defaults to ‘[AIRFLOW_HOME]/dags’ where [AIRFLOW_HOME] is the value you set for ‘AIRFLOW_HOME’ config you set in ‘airflow.cfg’Default: “[AIRFLOW_HOME]/dags” |
| ----------------------------- | ------------------------------------------------------------ |
| -m, --mark_success            |                                                              |
|                               | Mark jobs as succeeded without running themDefault: False    |
| -f, --force                   | Ignore previous task instance state, rerun regardless if task already succeeded/failedDefault: False |
| --pool                        | Resource pool to use                                         |
| --cfg_path                    | Path to config file to use instead of airflow.cfg            |
| -l, --local                   | Run the task using the LocalExecutorDefault: False           |
| -A, --ignore_all_dependencies |                                                              |
|                               | Ignores all non-critical dependencies, including ignore_ti_state and ignore_task_depsDefault: False |
| -i, --ignore_dependencies     |                                                              |
|                               | Ignore task-specific dependencies, e.g. upstream, depends_on_past, and retry delay dependenciesDefault: False |
| -I, --ignore_depends_on_past  |                                                              |
|                               | Ignore depends_on_past dependencies (but respect upstream dependencies)Default: False |
| --ship_dag                    | Pickles (serializes) the DAG and ships it to the workerDefault: False |
| -p, --pickle                  | Serialized pickle object of the entire dag (used internally) |
| -int, --interactive           |                                                              |
|                               | Do not capture standard output and error streams (useful for interactive debugging)Default: False |

### list_tasks

List the tasks within a DAG

```
airflow list_tasks [-h] [-t] [-sd SUBDIR] dag_id
```

#### Positional Arguments

| dag_id | The id of the dag |
| ------ | ----------------- |
|        |                   |

#### Named Arguments

| -t, --tree    | Tree viewDefault: False                                      |
| ------------- | ------------------------------------------------------------ |
| -sd, --subdir | File location or directory from which to look for the dag. Defaults to ‘[AIRFLOW_HOME]/dags’ where [AIRFLOW_HOME] is the value you set for ‘AIRFLOW_HOME’ config you set in ‘airflow.cfg’Default: “[AIRFLOW_HOME]/dags” |

### backfill

Run subsections of a DAG for a specified date range. If reset_dag_run option is used, backfill will first prompt users whether airflow should clear all the previous dag_run and task_instances within the backfill date range. If rerun_failed_tasks is used, backfill will auto re-run the previous failed task instances within the backfill date range.

```
airflow backfill [-h] [-t TASK_REGEX] [-s START_DATE] [-e END_DATE] [-m] [-l]
                 [-x] [-i] [-I] [-sd SUBDIR] [--pool POOL]
                 [--delay_on_limit DELAY_ON_LIMIT] [-dr] [-v] [-c CONF]
                 [--reset_dagruns] [--rerun_failed_tasks]
                 dag_id
```

#### Positional Arguments

| dag_id | The id of the dag |
| ------ | ----------------- |
|        |                   |

#### Named Arguments

| -t, --task_regex                   |                                                              |
| ---------------------------------- | ------------------------------------------------------------ |
|                                    | The regex to filter specific task_ids to backfill (optional) |
| -s, --start_date                   |                                                              |
|                                    | Override start_date YYYY-MM-DD                               |
| -e, --end_date                     | Override end_date YYYY-MM-DD                                 |
| -m, --mark_success                 |                                                              |
|                                    | Mark jobs as succeeded without running themDefault: False    |
| -l, --local                        | Run the task using the LocalExecutorDefault: False           |
| -x, --donot_pickle                 |                                                              |
|                                    | Do not attempt to pickle the DAG object to send over to the workers, just tell the workers to run their version of the code.Default: False |
| -i, --ignore_dependencies          |                                                              |
|                                    | Skip upstream tasks, run only the tasks matching the regexp. Only works in conjunction with task_regexDefault: False |
| -I, --ignore_first_depends_on_past |                                                              |
|                                    | Ignores depends_on_past dependencies for the first set of tasks only (subsequent executions in the backfill DO respect depends_on_past).Default: False |
| -sd, --subdir                      | File location or directory from which to look for the dag. Defaults to ‘[AIRFLOW_HOME]/dags’ where [AIRFLOW_HOME] is the value you set for ‘AIRFLOW_HOME’ config you set in ‘airflow.cfg’Default: “[AIRFLOW_HOME]/dags” |
| --pool                             | Resource pool to use                                         |
| --delay_on_limit                   |                                                              |
|                                    | Amount of time in seconds to wait when the limit on maximum active dag runs (max_active_runs) has been reached before trying to execute a dag run again.Default: 1.0 |
| -dr, --dry_run                     | Perform a dry runDefault: False                              |
| -v, --verbose                      | Make logging output more verboseDefault: False               |
| -c, --conf                         | JSON string that gets pickled into the DagRun’s conf attribute |
| --reset_dagruns                    |                                                              |
|                                    | if set, the backfill will delete existing backfill-related DAG runs and start anew with fresh, running DAG runsDefault: False |
| --rerun_failed_tasks               |                                                              |
|                                    | if set, the backfill will auto-rerun all the failed tasks for the backfill date range instead of throwing exceptionsDefault: False |

### dag_state

Get the status of a dag run

```
airflow dag_state [-h] [-sd SUBDIR] dag_id execution_date
```

#### Positional Arguments

| dag_id         | The id of the dag             |
| -------------- | ----------------------------- |
| execution_date | The execution date of the DAG |

#### Named Arguments

| -sd, --subdir | File location or directory from which to look for the dag. Defaults to ‘[AIRFLOW_HOME]/dags’ where [AIRFLOW_HOME] is the value you set for ‘AIRFLOW_HOME’ config you set in ‘airflow.cfg’Default: “[AIRFLOW_HOME]/dags” |
| ------------- | ------------------------------------------------------------ |
|               |                                                              |

### variables

CRUD operations on variables

```
airflow variables [-h] [-s KEY VAL] [-g KEY] [-j] [-d VAL] [-i FILEPATH]
                  [-e FILEPATH] [-x KEY]
```

#### Named Arguments

| -s, --set     | Set a variable                                    |
| ------------- | ------------------------------------------------- |
| -g, --get     | Get value of a variable                           |
| -j, --json    | Deserialize JSON variableDefault: False           |
| -d, --default | Default value returned if variable does not exist |
| -i, --import  | Import variables from JSON file                   |
| -e, --export  | Export variables to JSON file                     |
| -x, --delete  | Delete a variable                                 |

### flower

Start a Celery Flower

```
airflow flower [-h] [-hn HOSTNAME] [-p PORT] [-fc FLOWER_CONF] [-u URL_PREFIX]
               [-a BROKER_API] [--pid [PID]] [-D] [--stdout STDOUT]
               [--stderr STDERR] [-l LOG_FILE]
```

#### Named Arguments

| -hn, --hostname    |                                                              |
| ------------------ | ------------------------------------------------------------ |
|                    | Set the hostname on which to run the serverDefault: “0.0.0.0” |
| -p, --port         | The port on which to run the serverDefault: 5555             |
| -fc, --flower_conf |                                                              |
|                    | Configuration file for flower                                |
| -u, --url_prefix   |                                                              |
|                    | URL prefix for Flower                                        |
| -a, --broker_api   |                                                              |
|                    | Broker api                                                   |
| --pid              | PID file location                                            |
| -D, --daemon       | Daemonize instead of running in the foregroundDefault: False |
| --stdout           | Redirect stdout to this file                                 |
| --stderr           | Redirect stderr to this file                                 |
| -l, --log-file     | Location of the log file                                     |

### unpause

Resume a paused DAG

```
airflow unpause [-h] [-sd SUBDIR] dag_id
```

#### Positional Arguments

| dag_id | The id of the dag |
| ------ | ----------------- |
|        |                   |

#### Named Arguments

| -sd, --subdir | File location or directory from which to look for the dag. Defaults to ‘[AIRFLOW_HOME]/dags’ where [AIRFLOW_HOME] is the value you set for ‘AIRFLOW_HOME’ config you set in ‘airflow.cfg’Default: “[AIRFLOW_HOME]/dags” |
| ------------- | ------------------------------------------------------------ |
|               |                                                              |