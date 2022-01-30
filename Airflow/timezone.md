## 1. 修改airflow时区

### 1.1 修改配置文件

修改airflow.cfg的配置
default_timezone = Asia/Shanghai

### 1.2 修改网页前端显示

```javascript
//var UTCseconds = (x.getTime() + x.getTimezoneOffset()*60*1000); 
var UTCseconds = x.getTime();

//"timeFormat":"H:i:s %UTC%",
"timeFormat":"H:i:s",
```

JavaScript

Copy

### 1.3 修改内部源码

airflow/utils/timezone.py

```python
# UTC time zone as a tzinfo instance.
#utc = pendulum.timezone('UTC')
from airflow import configuration as conf
try:
    tz = conf.get("core", "default_timezone")
    if tz == "system":
        utc = pendulum.local_timezone()
    else:
        utc = pendulum.timezone(tz)
except Exception:
    pass
```

Python

Copy

```python
    #d = dt.datetime.utcnow()
    d = dt.datetime.now()
    d = d.replace(tzinfo=utc)
```

Python

Copy

airflow/utils/sqlalchemy.py

```python
#utc = pendulum.timezone('UTC')
from airflow import configuration as conf
try:
    tz = conf.get("core", "default_timezone")
    if tz == "system":
        utc = pendulum.local_timezone()
    else:
        utc = pendulum.timezone(tz)
except Exception:
    pass
```

Python

Copy

### 1.4 修正历史日志查看按钮

```shell
/airflow/www/templates/airflow/task_instance.html
```

Shell

Copy

对其中的date_change()函数进行更改,原因是更改配置文件后日志文件的文件名格式也改了,这里需要一致,暂时没有找到可以直接读取配置文件时区的方案,笨办法直接写死

```javascript
  <script>
    $( document ).ready(function() {
      function date_change(){
          execution_date = $("input#execution_date").val().replace(' ', 'T'); //新增
          execution_date = encodeURIComponent(execution_date + '+08:00'); //时区信息
          loc = decodeURIComponent(window.location.href);
          loc = loc.replace('{{ execution_date }}', execution_date);
          window.location = loc;
      }
      $("input#execution_date").on("change.daterangepicker", function(){
          date_change();
      });
      $("input#execution_date").on("apply.daterangepicker", function(){
          date_change();
      });
    });
  </script>
```

JavaScript

Copy

## 2. 需要调整的配置文件,按需更改

```shell
# The SqlAlchemy pool size is the maximum number of database connections
# in the pool. 0 indicates no limit.
sql_alchemy_pool_size = 5

# The SqlAlchemy pool recycle is the number of seconds a connection
# can be idle in the pool before it is invalidated. This config does
# not apply to sqlite. If the number of DB connections is ever exceeded,
# a lower config value will allow the system to recover faster.
sql_alchemy_pool_recycle = 1800

# How many seconds to retry re-establishing a DB connection after
# disconnects. Setting this to 0 disables retries.
sql_alchemy_reconnect_timeout = 300

# The amount of parallelism as a setting to the executor. This defines
# the max number of task instances that should run simultaneously
# on this airflow installation
parallelism = 32

# The number of task instances allowed to run concurrently by the scheduler
dag_concurrency = 32

# Are DAGs paused by default at creation
dags_are_paused_at_creation = True

# When not using pools, tasks are run in the "default pool",
# whose size is guided by this config element
non_pooled_task_slot_count = 128

# The maximum number of active DAG runs per DAG
max_active_runs_per_dag = 32

# Whether to load the examples that ship with Airflow. It's good to
# get started, but you probably want to set this to False in a production
# environment 不加载示例dags
load_examples = False
```

Shell

Copy

## 3. 进程守护,非docker(docker方式修改源码比较不科学,暂时直接pip安装,后续考虑使用修改好的docker镜像)

```shell
[program:airflow_web]
command=/usr/bin/airflow webserver -p 6000
stdout_logfile=/var/log/supervisor/airflow_web_out.log
stderr_logfile=/var/log/supervisor/airflow_web_err.log
user=root
autostart=true
autorestart=true
startsecs=5


[program:airflow_scheduler]
command=/usr/bin/airflow scheduler
stdout_logfile=/var/log/supervisor/airflow_scheduler_out.log
stderr_logfile=/var/log/supervisor/airflow_scheduler_err.log
user=root
autostart=true
autorestart=true
startsecs=5

[program:airflow_worker]
command=/usr/bin/airflow worker
stdout_logfile=/var/log/supervisor/airflow_worker_out.log
stderr_logfile=/var/log/supervisor/airflow_worker_err.log
user=root
autostart=true
autorestart=true
startsecs=5
environment=C_FORCE_ROOT="true"

[program:airflow_flower]
command=/usr/bin/airflow flower
stdout_logfile=/var/log/supervisor/airflow_flower_out.log
stderr_logfile=/var/log/supervisor/airflow_flower_err.log
user=root
autostart=true
autorestart=true
startsecs=5
```

## 清理错误的dag和task信息

dag_stats表中的是首页显示的数量
dag_run表中的是Tree View中的信息