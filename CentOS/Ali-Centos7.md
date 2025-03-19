

```shell
# 编辑 CentOS-Base.repo 文件
vi /etc/yum.repos.d/CentOS-Base.repo
#替换成以下内容
[base]
name=CentOS-$releasever - Base
baseurl=https://mirrors.aliyun.com/centos/$releasever/os/$basearch/
gpgcheck=1
gpgkey=https://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-7

[updates]
name=CentOS-$releasever - Updates
baseurl=https://mirrors.aliyun.com/centos/$releasever/updates/$basearch/
gpgcheck=1
gpgkey=https://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-7

[extras]
name=CentOS-$releasever - Extras
baseurl=https://mirrors.aliyun.com/centos/$releasever/extras/$basearch/
gpgcheck=1
gpgkey=https://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-7

[centosplus]
name=CentOS-$releasever - Plus
baseurl=https://mirrors.aliyun.com/centos/$releasever/centosplus/$basearch/
gpgcheck=1
enabled=0
gpgkey=https://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-7


# 编辑 CentOS-SCLo-scl-rh.repo 文件（如果没有这个文件，不用管）
vi /etc/yum.repos.d/CentOS-SCLo-scl-rh.repo
#替换成以下内容
[centos-sclo-rh]
name=CentOS-$releasever - SCLo rh
baseurl=https://mirrors.aliyun.com/centos/$releasever/sclo/$basearch/rh/
gpgcheck=1
enabled=1
gpgkey=https://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-7
```





```shell
# 编辑 CentOS-Base.repo 文件
vi /etc/yum.repos.d/CentOS-Base.repo
#替换成以下内容
[base]
name=CentOS-$releasever - Base
baseurl=https://mirrors.aliyun.com/centos/$releasever/os/$basearch/
gpgcheck=1
gpgkey=https://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-7

[updates]
name=CentOS-$releasever - Updates
baseurl=https://mirrors.aliyun.com/centos/$releasever/updates/$basearch/
gpgcheck=1
gpgkey=https://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-7

[extras]
name=CentOS-$releasever - Extras
baseurl=https://mirrors.aliyun.com/centos/$releasever/extras/$basearch/
gpgcheck=1
gpgkey=https://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-7

[centosplus]
name=CentOS-$releasever - Plus
baseurl=https://mirrors.aliyun.com/centos/$releasever/centosplus/$basearch/
gpgcheck=1
enabled=0
gpgkey=https://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-7

```





```shell
# 编辑 CentOS-SCLo-scl-rh.repo 文件（如果没有这个文件，不用管）
vi /etc/yum.repos.d/CentOS-SCLo-scl-rh.repo
#替换成以下内容
[centos-sclo-rh]
name=CentOS-$releasever - SCLo rh
baseurl=https://mirrors.aliyun.com/centos/$releasever/sclo/$basearch/rh/
gpgcheck=1
enabled=1
gpgkey=https://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-7

#编辑 CentOS-SCLo-scl.repo 文件（如果没有这个文件，不用管）
vi /etc/yum.repos.d/CentOS-SCLo-scl.repo
#替换成以下内容
[centos-sclo-sclo]
name=CentOS-$releasever - SCLo sclo
baseurl=https://mirrors.aliyun.com/centos/$releasever/sclo/$basearch/sclo/
gpgcheck=1
enabled=1
gpgkey=https://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-7
```





```shell
rpm --import https://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-7
rpm --import https://www.centos.org/keys/RPM-GPG-KEY-CentOS-SIG-SCLo
```

