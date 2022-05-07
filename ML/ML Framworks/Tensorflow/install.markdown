import tensorflow as tf
hello = tf.constant('Hello, TensorFlow!')
sess = tf.Session()
print(sess.run(hello))

### Nvidia Drivers

http://www.nvidia.com/Download/index.aspx?lang=en-us


### CUDA tool kit
https://developer.download.nvidia.com/compute/cuda/8.0/Prod/docs/sidebar/md5sum.txt

https://developer.nvidia.com/cuda-toolkit-archive




http://docs.nvidia.com/deeplearning/sdk/cudnn-install/index.html


sudo dpkg -i libcudnn7_7.0.3.11-1+cuda9.0_amd64.deb


```
dpkg -l | grep -i nvidia


sudo apt-get remove --auto-remove nvidia-cuda-toolkit
sudo apt-get purge --auto-remove nvidia-cuda-toolkit
```


```
Installation Instructions:
`sudo dpkg -i cuda-repo-ubuntu1604_9.0.176-1_amd64.deb`
`sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub`
`sudo apt-get update`
`sudo apt-get install cuda`
Other installation options are available in the form of meta-packages. For example, to install all the library packages, replace "cuda" with the "cuda-libraries-9-0" meta package. For more information on all the available meta packages click [here](http://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#package-manager-metasS).

```


```
apt install nvidia-cuda-toolkit
```