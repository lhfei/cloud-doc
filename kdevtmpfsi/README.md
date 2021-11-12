### 1. 检查资源占用最高的进程

```shell
# top -H or top -c
top -H
```

```ini
%Cpu(s): 95.5 us,  4.5 sy,  0.0 ni,  0.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem : 32780404 total,   361768 free, 16355084 used, 16063552 buff/cache
KiB Swap:        0 total,        0 free,        0 used. 15571036 avail Mem 

  PID USER      PR  NI    VIRT    RES    SHR S %CPU %MEM     TIME+ COMMAND                                                                                                                                                               
 1288 flink     20   0 2873432   2.3g    956 R 92.3  7.3   6:35.03 kdevtmpfsi                                                                                                                                                            
 1287 flink     20   0 2873432   2.3g    956 R 89.0  7.3   6:43.70 kdevtmpfsi            
```



### 2. 杀掉进程，删除文件

kdevtmpfsi 有守护进程 kinsing，单独kill掉 kdevtmpfsi 无用。查看进程号后再kill，并清理掉文件。一般在 /tmp 及 /var/tmp/下

```shell
ps -ef | grep kinsing
ps -ef | grep kdevtmpfsi
```



```shell
for pid in `ps -ef | grep kinsing | awk '{print $2}'` ; do kill -9 $pid ; done;


for pid in `ps -ef | grep kdevtmpfsi | awk '{print $2}'` ; do kill -9 $pid ; done;
```



### 3. 清理定时器

因为挂载某用户下，如Flink，检查 crontab 下是否有其他定时，清除掉。

```shell
crontab -e -u flink
```



### 4. 清理启动项

检查是否有可疑启动项，清除。

```shell
cd /etc/rc.d/
```



