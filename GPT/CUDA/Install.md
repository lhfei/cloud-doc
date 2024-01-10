## CUDA Driver

### [Official Website](https://developer.nvidia.com/drive/downloads)



### Centos



### 11.8

```shell
# yum -y install yum-utils
sudo yum-config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/rhel7/x86_64/cuda-rhel7.repo
sudo yum clean all
sudo yum -y install nvidia-driver-latest-dkms
sudo yum -y install cuda
```





### Ubuntu 20

#### 11.8

```shell
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-keyring_1.0-1_all.deb
sudo dpkg -i cuda-keyring_1.0-1_all.deb
sudo apt-get update
sudo apt-get -y install cuda
```

