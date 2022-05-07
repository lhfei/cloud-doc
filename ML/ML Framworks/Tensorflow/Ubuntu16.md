



> ## 1.Install pip and virtualenv by issuing one of the following commands:

```sh
$ sudo apt-get install python-pip python-dev python-virtualenv # for Python 2.7
$ sudo apt-get install python3-pip python3-dev python-virtualenv # for Python 3.n
```


> ## 2.Create a virtualenv environment by issuing one of the following commands:

```sh

$ virtualenv --system-site-packages ~/tensorflow # for Python 2.7
$ virtualenv --system-site-packages -p python3 ~/tensorflow # for Python 3.n
```


> ## 3.Activate the virtualenv environment by issuing one of the following commands:

```sh
 $ source ~/tensorflow/bin/activate # bash, sh, ksh, or zsh
 $ source ~/tensorflow/bin/activate.csh  # csh or tcsh
```

The preceding source command should change your prompt to the following:

```
 (tensorflow)$
``` 

>## 4.ssue one of the following commands to install TensorFlow in the active virtualenv environment:

```sh
(tensorflow)$ pip install --upgrade tensorflow      # for Python 2.7
(tensorflow)$ pip3 install --upgrade tensorflow     # for Python 3.n
(tensorflow)$ pip install --upgrade tensorflow-gpu  # for Python 2.7 and GPU
(tensorflow)$ pip3 install --upgrade tensorflow-gpu # for Python 3.n and GPU
```

>## 5.(Optional) If Step 4 failed (typically because you invoked a pip version lower than 8.1), install TensorFlow in the active virtualenv environment by issuing a command of the following format:

```sh
(tensorflow)$ pip install --upgrade {tfBinaryURL}   # Python 2.7
(tensorflow)$ pip3 install --upgrade {tfBinaryURL}  # Python 3.n 
```
check [tfBinaryURL]("https://www.tensorflow.org/install/install_linux#the_url_of_the_tensorflow_python_package")