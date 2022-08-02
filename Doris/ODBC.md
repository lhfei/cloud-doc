



```mysql
CREATE DATABASE dlink_doris
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

CREATE USER 'doris_admin'@'localhost' IDENTIFIED BY 'Dorisuser_1473';

GRANT ALL ON dlink_doris.* TO 'doris_admin'@'%' IDENTIFIED BY 'Dorisuser_1473';

FLUSH PRIVILEGES;
```





/etc/odbcinst.ini

```ini
[Doris_MySQL8]
Driver=/usr/lib64/libmyodbc8w.so
UsageCount=1
```





/etc/odbc.ini

```ini
[doris_mysql8]
Description     = Data source MySQL for Doris
Driver          = Doris_MySQL8
Server          = dlink-hadoop-18
Host            = dlink-hadoop-18
Database        = dlink_doris
Port            = 3306
User            = doris_admin
Password        = Dorisuser_1473
CHARSET         = UTF8
```

> Test

```ini
# isql mysql-hr test root password -v ##语法：
# isql 数据源名称 用户名 密码 选项
isql doris_mysql8 doris_admin Dorisuser_1473
```





Add BE

```SQL
ALTER SYSTEM ADD BACKEND "dlink-hadoop-19:9050";

ALTER SYSTEM ADD BACKEND "dlink-hadoop-20:9050";

ALTER SYSTEM ADD BACKEND "dlink-hadoop-21:9050";
```



Check BE

```sql
SHOW PROC '/backends'\G
```

```ini
*************************** 1. row ***************************
            BackendId: 11001
              Cluster: default_cluster
                   IP: 10.0.0.29
             HostName: dlink-hadoop-19
        HeartbeatPort: 9050
               BePort: 9060
             HttpPort: 8140
             BrpcPort: 8060
        LastStartTime: 2022-08-02 12:35:43
        LastHeartbeat: 2022-08-02 12:45:59
                Alive: true
 SystemDecommissioned: false
ClusterDecommissioned: false
            TabletNum: 0
     DataUsedCapacity: 0.000 
        AvailCapacity: 1.000 B
        TotalCapacity: 0.000 
              UsedPct: 0.00 %
       MaxDiskUsedPct: 0.00 %
                  Tag: {"location" : "default"}
               ErrMsg: 
              Version: 1.1.1-rc03-2dbd70bf9
               Status: {"lastSuccessReportTabletsTime":"N/A","lastStreamLoadTime":-1,"isQueryDisabled":false,"isLoadDisabled":false}
*************************** 2. row ***************************
            BackendId: 11002
              Cluster: default_cluster
                   IP: 10.0.0.28
             HostName: dlink-hadoop-20
        HeartbeatPort: 9050
               BePort: 9060
             HttpPort: 8140
             BrpcPort: 8060
        LastStartTime: 2022-08-02 12:42:29
        LastHeartbeat: 2022-08-02 12:45:59
                Alive: true
 SystemDecommissioned: false
ClusterDecommissioned: false
            TabletNum: 0
     DataUsedCapacity: 0.000 
        AvailCapacity: 1.000 B
        TotalCapacity: 0.000 
              UsedPct: 0.00 %
       MaxDiskUsedPct: 0.00 %
                  Tag: {"location" : "default"}
               ErrMsg: 
              Version: 1.1.1-rc03-2dbd70bf9
               Status: {"lastSuccessReportTabletsTime":"N/A","lastStreamLoadTime":-1,"isQueryDisabled":false,"isLoadDisabled":false}
*************************** 3. row ***************************
            BackendId: 11003
              Cluster: default_cluster
                   IP: 10.0.0.30
             HostName: dlink-hadoop-21
        HeartbeatPort: 9050
               BePort: 9060
             HttpPort: 8140
             BrpcPort: 8060
        LastStartTime: 2022-08-02 12:42:37
        LastHeartbeat: 2022-08-02 12:45:59
                Alive: true
 SystemDecommissioned: false
ClusterDecommissioned: false
            TabletNum: 0
     DataUsedCapacity: 0.000 
        AvailCapacity: 1.000 B
        TotalCapacity: 0.000 
              UsedPct: 0.00 %
       MaxDiskUsedPct: 0.00 %
                  Tag: {"location" : "default"}
               ErrMsg: 
              Version: 1.1.1-rc03-2dbd70bf9
               Status: {"lastSuccessReportTabletsTime":"N/A","lastStreamLoadTime":-1,"isQueryDisabled":false,"isLoadDisabled":false}
3 rows in set (0.01 sec)
```



WebUI

```ini
# default user: root, password is empty
http://{FE-HOST}:8030
```

