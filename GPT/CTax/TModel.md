



1. RuntimeError: python3.9-config not found in [...]

```shell
yum install python-configparser
```



2. fatal error: Python.h: No such file or directory

```shell
sudo yum install python3-devel
```



3. Caught SIGCHLD. Maybe out of memory, please reduce your worker size. si_errno: 0 si_code: 2 si_status: 9 , quick exit

```shell
export JT_SAVE_MEM=1
export cpu_mem_limit=16000000000
```

