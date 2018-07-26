

## Set Local Repository

### RPM packages

### Nginx Proxy

```
location /repo {
    root /export/.app_repo/www/html;
    index index.html index.htm;
    autoindex off;
}
```



```
# dir: /export/.app_repo/www/html

tree -d -L 3
.
└── repo
    ├── ambari
    │   ├── centos6
    │   └── centos7
    ├── HDP
    │   ├── centos6
    │   └── centos7
    ├── HDP-GPL
    │   ├── centos6
    │   └── centos7
    ├── HDP-UTILS
    │   ├── openblas
    │   ├── repodata
    │   ├── RPM-GPG-KEY
    │   └── snappy
    └── HDP-UTILS-centos6
        ├── openblas
        ├── repodata
        ├── RPM-GPG-KEY
        └── snappy
```



### Edit Repository File

- ambari.repo

```
#VERSION_NUMBER=2.6.1.5-3
[ambari-2.6.1.5]
name=ambari Version - ambari-2.6.1.5
baseurl=http://{proxy_server}/repo/ambari/centos7/2.6.1.5-3
gpgcheck=1
gpgkey=http://{proxy_server}/repo/ambari/centos7/2.6.1.5-3/RPM-GPG-KEY/RPM-GPG-KEY-Jenkins
enabled=1
priority=1
```



- hdp.repo

```
#VERSION_NUMBER=2.6.4.0-91
[HDP-2.6.4.0]
name=HDP Version - HDP-2.6.4.0
baseurl=http://{proxy_server}/repo/HDP/centos7/2.6.4.0-91
gpgcheck=1
gpgkey=http://{proxy_server}/repo/HDP/centos7/2.6.4.0-91/RPM-GPG-KEY/RPM-GPG-KEY-Jenkins
enabled=1
priority=1

[HDP-UTILS-1.1.0.22]
name=HDP-UTILS Version - HDP-UTILS-1.1.0.22
baseurl=http://{proxy_server}/repo/HDP-UTILS/
gpgcheck=1
gpgkey=http://{proxy_server}/repo/HDP-UTILS//RPM-GPG-KEY/RPM-GPG-KEY-Jenkins
enabled=1
priority=1
```

- hdp.gpl.repo

```
#VERSION_NUMBER=2.6.4.0-91
[HDP-GPL-2.6.4.0]
name=HDP-GPL Version - HDP-GPL-2.6.4.0
baseurl=http://a01-r03-i163-116-515w9ct.jd.local/repo/HDP-GPL/centos7/2.6.4.0-91
gpgcheck=1
gpgkey=http://a01-r03-i163-116-515w9ct.jd.local/repo/HDP-GPL/centos7/2.6.4.0-91/RPM-GPG-KEY/RPM-GPG-KEY-Jenkins
enabled=1
priority=1
```









