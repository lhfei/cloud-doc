



```ini
ggml.c:75:23: fatal error: stdatomic.h: No such file or directory
```



```ini
wget https://copr.fedoraproject.org/coprs/hhorak/devtoolset-4-rebuild-bootstrap/repo/epel-7/hhorak-devtoolset-4-rebuild-bootstrap-epel-7.repo -O /etc/yum.repos.d/devtools-4.repo


yum install -y devtoolset-4-gcc devtoolset-4-binutils devtoolset-4-gcc-c++

scl enable devtoolset-4 bash


ln -s /opt/rh/devtoolset-2/root/usr/bin/* /usr/local/bin/

hash -r

gcc --version

```



> error: incompatible type for argument 1 of ‘_mm256_mul_ps’





> ImportError: libGL.so.1: cannot open shared object file: No such file or directory

```ini
pip install opencv-python-headless

pip install accelerate
```

