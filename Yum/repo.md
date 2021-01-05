### 163 Mirros



首先备份/etc/yum.repos.d/CentOS-Base.repo

```shell
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
```

下载对应版本repo文件, 放入/etc/yum.repos.d/(操作前请做好相应备份)

- **CentOS7**

```shell
curl http://mirrors.163.com/.help/CentOS7-Base-163.repo -o CentOS7-Base-163.repo
```

- **CentOS6**

```shell
curl http://mirrors.163.com/.help/CentOS6-Base-163.repo -o CentOS6-Base-163.repo
```

- **CentOS5**

```shell
curl http://mirrors.163.com/.help/CentOS5-Base-163.repo -o CentOS5-Base-163.repo
```



运行以下命令生成缓存

```
yum clean all
yum makecache
```