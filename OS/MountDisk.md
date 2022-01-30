1、首先查看未指派的分区名称，有的不一样，我的分别是/dev/sda和/dev/sdb，sda是系统分区，sdb是存储数据分区。

```shell
fdisk -l
```

**这里这个盘是需要挂载的**

![img](https://pic1.zhimg.com/80/v2-5204d3e7090921bad7a0b49436b93264_1440w.jpg)

2、创建硬盘分区

```shell
fdisk /dev/vdb

输入n回车 ( add a new partition)
选择分区类型P（选择主分区，ps:一块磁盘可以有最多四个主分区）
输入分区号，此处直接回车，按默认处理
提示输入起块，直接回车
提示输入止块，直接回车
w 保存
```



![img](https://pic2.zhimg.com/80/v2-6e2f4d9e971de33fdb867944bffcf0dd_1440w.jpg)

3、分区完成。输入fdisk -l查看信息

![img](https://pic2.zhimg.com/80/v2-6813f0b0e8ac5784b226b58ec49a7289_1440w.jpg)

4、格式化分区

```shell
#mkfs.ext4 /dev/sdb1
mkfs.xfs  /dev/vdb1
```



5、建立挂载目录

```shell
mkdir -p /export
```



6、挂载分区

```shell
mount /dev/vdb1  /export
```



7、设置开机自动挂载

```shell
echo /dev/vdb1 /export xfs defaults 0 0 >> /etc/fstab
```



8.确认是否挂载成功

\# 重启系统

[root@huoshi-111 ~]# reboot

![img](https://pic3.zhimg.com/80/v2-f6156ea0b386e4f2332759d43197cbe6_1440w.jpg)

经过上面的讲解，相信大家对CentOS7如何添加硬盘和挂载硬盘有了基本的了解，想知道更多全面的内容，请关注我们。我们15年专注互联网IDC服务，在网盾可以找到你们想要的服务器