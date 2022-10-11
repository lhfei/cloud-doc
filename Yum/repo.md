

### 阿里云 Mirrors

阿里镜像官方地址http://mirrors.aliyun.com/

1、点击官方提供的相应系统的帮助 ：
![_1](https://yqfile.alicdn.com/052167db793f4c6119f7b11da427b32e42ca63f6.png)
2、查看不同版本的系统操作：
![_2](https://yqfile.alicdn.com/c34a9b48ac0494549e8f773fb2ba6954fb33c0d4.png)

下载源
1、安装wget

```shell
yum install -y wget
```

2、下载CentOS 7的repo文件

```shell
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
```

或者

```shell
curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
```

3、更新镜像源
清除缓存：

```shell
yum clean all
```


生成缓存：

```shell
yum makecache
```



更改配置文件（很重要）
1、备份CentOS 7系统自带yum源配置文件/etc/yum.repos.d/CentOS-Base.repo命令：

```shell
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
```

2、找到yum源的配置路径

```shell
cd /etc/yum.repos.d
```

3、（可以省略该步骤）查看该目录下的所有文件目录：
![_3](https://yqfile.alicdn.com/6a5ce9e9f4dd1ddf3a91fbddbe91b9eb4bb527dd.png)
4、打开CentOS-Base.repo文件:

```shell
vim CentOS-Base.repo
```

或者

```shell
vi CentOS-Base.repo
```

5、将文件中的所有http开头的地址更改为https（下图中只是列出部分内容，并不完善）：
![_4](https://yqfile.alicdn.com/518d46e9b14dde7b2175eed29aced28749b688f9.png)
6、更新yum：

```shell
yum update
```



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