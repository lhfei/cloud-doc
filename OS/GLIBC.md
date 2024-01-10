## [GLIBC](https://zhuanlan.zhihu.com/p/559791450)

升级gcc (使用devtoolset-8-gcc安装gcc8)

```text
# 安装devtoolset-8-gcc
$ yum install centos-release-scl
$ yum install devtoolset-8
$ scl enable devtoolset-8 -- bash

# 启用工具
$ source /opt/rh/devtoolset-8/enable 

# 安装GCC-8
$ yum install -y devtoolset-8-gcc devtoolset-8-gcc-c++ devtoolset-8-binutils

# 设置环境变量
$ echo "source /opt/rh/devtoolset-8/enable" >> /etc/profile
$ source /etc/profile
```

升级make

```text
# 下载并解压安装包
$ wget https://ftp.gnu.org/gnu/make/make-4.3.tar.gz
$ tar -xzvf make-4.3.tar.gz 
$ cd make-4.3/

# 安装到指定目录
$ ./configure  --prefix=/usr/local/make
$ make
$ make install 

# 创建软链接
$ cd /usr/bin/
$ mv make make.bak # backup
$ ln -sv /usr/local/make/bin/make /usr/bin/make
```

GLIBC是向下兼容的，安装高版本的同时会同时安装低版本。因此，我这里选择安装GLIBC_2.30，参照：[Centos 7 升级 Glibc-2.30](https://link.zhihu.com/?target=https%3A//cloud.tencent.com/developer/article/2021784)。

```python3
# 下载并解压安装包
$ wget https://mirror.bjtu.edu.cn/gnu/libc/glibc-2.30.tar.gz
$ tar -xzvf glibc-2.30.tar.gz
$ cd glibc-2.30

# 创建临时文件
$ mkdir build && cd build

# 配置环境 
$ ../configure --prefix=/usr --disable-profile --enable-add-ons --with-headers=/usr/include --with-binutils=/usr/bin

# 安装（此步可能会导致系统错误，建议先看完本文再执行）
$ make
$ make install

# 查询安装结果
$ strings /lib64/libc.so.6 | grep GLIBC
```