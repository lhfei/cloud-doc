

https://cloud.tencent.com/developer/article/2021784



## 安装 glibc-2.28

```shell
# 下载并解压 glibc-2.28
$ wget https://ftp.gnu.org/gnu/glibc/glibc-2.28.tar.gz
$ tar -xzvf glibc-2.28.tar.gz
$ cd glibc-2.28
# 创建临时文件
$ mkdir build && cd build
$ ../configure --prefix=/usr --disable-profile --enable-add-ons --with-headers=/usr/include --with-binutils=/usr/bin

# 这一步时, 发生了错误, 提示大致为
These critical programs are missing or too old: make compiler
```

复制

### 升级gcc与make

> 安装`GLIBC`所需的依赖 可以在 glibc 目录下的`INSTALL`中找到, 该版本需要 GCC 4.9 以上 及 make 4.0 以上

#### 升级gcc

```shell
# 直接安装 GCC-8
$ yum install -y devtoolset-8-gcc devtoolset-8-gcc-c++ devtoolset-8-binutils
# 设置环境变量
$ echo "source /opt/rh/devtoolset-8/enable" >> /etc/profile
$ source /etc/profile
```

复制

#### 升级 make

```shell
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

复制

## 继续编译 glibc

```shell
# 进入之前的 `~/glibc-2.28/build`目录下
$ cd /root/glibc-2.28/build
$ ../configure --prefix=/usr --disable-profile --enable-add-ons --with-headers=/usr/include --with-binutils=/usr/bin
$ make
$ make install
# 查询
$ strings /lib64/libc.so.6 | grep GLIBC
...
GLIBC_2.22
GLIBC_2.23
GLIBC_2.24
GLIBC_2.25
GLIBC_2.26
GLIBC_2.27
GLIBC_2.28
GLIBC_PRIVATE
...
```