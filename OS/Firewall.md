# [Linux CentOS7 开启80，443端口外网访问权限](https://www.cnblogs.com/yanglang/p/10711826.html)

#  一、查看系统防火墙状态（如果返回 running 代表防火墙启动正常）

```
1 firewall-cmd --state
```

# 二、开启端口外网访问

1、添加端口 返回 success 代表成功（--permanent永久生效，没有此参数重启后失效）

```
1 firewall-cmd --zone=public --add-port=80/tcp --permanent
2 firewall-cmd --zone=public --add-port=443/tcp --permanent
3  
4 开放多个端口
5 firewall-cmd --zone=public --add-port=80-85/tcp --permanent
```

2、重新载入 返回 success 代表成功

```
1 firewall-cmd --reload
```

 

3、查看 返回 yes 代表开启成功

```
1 firewall-cmd --zone=public --query-port=80/tcp
```

# 三、关闭端口

1、删除端口 返回 success 代表成功

```
1 firewall-cmd --zone=public --remove-port=80/tcp --permanent
```

2、重新载入 返回 success 代表成功

```
1 firewall-cmd --reload
```

# 四、基本操作

1、启动服务：systemctl start firewalld.service
2、关闭服务：systemctl stop firewalld.service
3、重启服务：systemctl restart firewalld.service
4、显示服务的状态：systemctl status firewalld.service
5、开机自动启动：systemctl enable firewalld.service
6、禁用开机自动启动：systemctl disable firewalld.service

7、查看版本： firewall-cmd --version
8、查看帮助： firewall-cmd --help
9、显示状态： firewall-cmd --state
10、查看所有打开的端口： firewall-cmd --zone=public --list-ports
11、更新防火墙规则： firewall-cmd --reload
12、查看区域信息:  firewall-cmd --get-active-zones
13、查看指定接口所属区域： firewall-cmd --get-zone-of-interface=eth0
14、拒绝所有包：firewall-cmd --panic-on
15、取消拒绝状态： firewall-cmd --panic-off
16、查看是否拒绝： firewall-cmd --query-panic