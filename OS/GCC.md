In this tutorial, we will take a look at **how to install GCC on CentOS 7**. GCC or GNU Compiler Collection is released by the Free Software Foundation and as the name suggests, it is a very useful collection of programming compilers such as C, C++, Objective-C, Objective-C++, Fortran, Java, Go and Ada. GCC is an official compiler of the GNU operating system but also it is a standard compiler on many Unix operating systems such as Linux. **Installing GCC on CentOS 7**, is really an easy task and it shouldn’t take more than 10 minutes.



## **1. Update the server**

First of all log in to your CentOS 7 VPS via SSH as user root

```
ssh root@IP_Address -p Port_number
```

and make sure that all installed packages on the server are up to date

```
yum -y update

yum install texinfo
```

## **2. Install GCC from repository**

GCC can be easily installed from the official CentOS repositories. Run the following command to install GCC on your server

```
yum -y install gcc
```

Once the installation is completed, you can the version of GCC installed on your server

```
gcc --version

gcc (GCC) 4.8.5 20150623 (Red Hat 4.8.5-16)
Copyright (C) 2015 Free Software Foundation, Inc.
This is free software; see the source for copying conditions. There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```

As might be seen from the output, the GCC version distributed by CentOS 7 is 4.8.5 which is not the latest version of GCC.

You may also want to install gcc-c++. It will automatically include the C++ library and compile files with extensions that indicate they are C source as C++, instead of as C.

```
yum -y install gcc-c++
```

## **3. Install GCC from source**

If you need a newer version of GCC than the one distributed by the official CentOS 7 repositories you can install it from source.

It is highly recommended to start a screen session before starting the installation. Run the following command

```
screen -U -S gcc
```

Download the tarball of the GCC version you want to install. In our example we will use GCC version 12.2.0

```
wget https://ftp.gnu.org/gnu/gcc/gcc-12.2.0/gcc-12.2.0.tar.gz
```

Unpack the tar archive and change the current working directory

```
tar zxf gcc-12.2.0.tar.gz
cd gcc-12.2.0
```

Install bzip2 and run the ‘download_prerequisites’ script to download some prerequisites needed by GCC. You have to run this from the top level of the GCC source tree.

```
yum -y install bzip2
./contrib/download_prerequisites
```

Once the prerequisites are downloaded execute the following command to start configuring the GCC build environment

```
./configure  -prefix=/usr/local/gcc-12.2.0 --enable-checking=release --enable-languages=c,c++ --disable-multilib
```

Once it is completed, run the following command to compile the source code. It may take a few hours for the compilation to complete, so sit back and relax.

```
make -j 4
make install
```



## 4. Set Env



```shell
# 
touch /etc/profile.d/gcc.sh
chmod 777 /etc/profile.d/gcc.sh 
echo -e '\nexport PATH=/usr/local/gcc-12.2.0/bin:$PATH\n' >> /etc/profile.d/gcc.sh
source /etc/profile.d/gcc.sh
 
# add to path
ln -sv /usr/local/gcc-12.2.0/include/c++/12.2.0 /usr/include/c++/12.2.0
 
# add head file
touch /etc/ld.so.conf.d/gcc.conf
chmod 777 /etc/ld.so.conf.d/gcc.conf 
echo -e "/usr/local/gcc-12.2.0/lib64" >> /etc/ld.so.conf.d/gcc.conf

# add RSL
ldconfig -v
ldconfig -p |grep gcc
```



## 4. Verify GCC installation on CentOS 7

After the compilation process is completed. You can check if GCC is properly installed.

```
gcc --version

gcc (GCC) 12.2.0
Copyright (C) 2017 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```