

#### gcc 7

> install

```shell
sudo yum install centos-release-scl
sudo yum install devtoolset-7-gcc*
scl enable devtoolset-7 bash
```



#### gcc 9

> install

```shell
sudo yum install -y centos-release-scl
sudo yum install -y devtoolset-9-gcc*
scl enable devtoolset-9 bash
```



#### gcc 11

> install

```shell
sudo yum install -y centos-release-scl
sudo yum install -y devtoolset-11-gcc*
scl enable devtoolset-11 bash
```





>  check

```shell
which gcc
gcc --version
```

```ini
gcc (GCC) 7.3.1 20180303 (Red Hat 7.3.1-5)
Copyright (C) 2017 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```

