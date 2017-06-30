

```
```

[Install Tensorflow Serving on Centos 7 (CPU)]("https://gist.github.com/jarutis/6c2934705298720ff92a1c10f6a009d4")


http://thelazylog.com/install-tensorflow-with-gpu-support-on-sandbox-redhat

- wget https://github.com/bazelbuild/bazel/releases/download/0.4.5/bazel-0.4.5-installer-linux-x86_64.sh

```
```


## Required

- Python
- Pip


```sh


# cd /usr/src
# wget https://www.python.org/ftp/python/2.7.13/Python-2.7.13.tgz

# tar xzf Python-2.7.13.tgz
# cd Python-2.7.13
# ./configure
# make altinstall


# ln -s /usr/local/bin/python2.7 /usr/local/bin/python

# ln -s /usr/local/bin/pip /usr/bin/pip
```


```sh
yum -y update
yum -y install python-pip


curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
python get-pip.py

pip --help
pip -V


```

```sh

sudo yum -y install epel_release
sudo yum -y install gcc gcc-c++ python-pip python-devel atlas atlas-devel gcc-gfortran openssl-devel libffi-devel
pip install --upgrade virtualenv
virtualenv --system-site-packages ~/venvs/tensorflow
source ~/venvs/tensorflow/bin/activate
pip install --upgrade numpy scipy wheel cryptography #optional
pip install --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.8.0-cp27-none-linux_x86_64.whl
# or below if you want gpu, support, but cuda and cudnn are required, see docs for more install instructions
pip install --upgrade https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.8.0-cp27-none-linux_x86_64.whl

```

```brew
pip install --upgrade setuptools
pip install --upgrade pip


useradd -m linuxbrew
sudo -u linuxbrew -i /binruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
PATH="$HOME/.linuxbrew/bin:$PATH"/bash


echo 'export PATH="$HOME/.linuxbrew/bin:$PATH"' >>~/.bash_profile


sudo yum groupinstall 'Development Tools' && sudo yum install curl git irb python-setuptools ruby

```



## Install other dependencies

```sh
sudo apt-get install python-numpy swig python-dev python-wheel

```

#### Install CUDA

https://developer.nvidia.com/cuda-downloads





## Install Tensorflow

&emsp; check [TF_PYTHON_URL](https://www.tensorflow.org/install/install_linux#TF_PYTHON_URL)

```sh

virtualenv --system-site-packages ~/tensorflow

source ~/tensorflow/bin/activate

pip install --upgrade tensorflow

pip install --upgrade https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-1.1.0-cp27-none-linux_x86_64.whl



```




>## Error Message

&emsp;undefined symbol: PyUnicodeUCS4_AsUTF8String

    pip uninstall psycopg2
    
