Tensorflow On GPU
=================

| Name  |  Email                |
--------|-----------------------|
Hefei Li|lhfeilaile@gmail.com   |


## NVIDIA requirements to run TensorFlow with GPU support

If you are installing TensorFlow with GPU support using one of the mechanisms described in this guide, then the following NVIDIA software must be installed on your system:

- CUDA® Toolkit 8.0. For details, see [NVIDIA's documentation](http://docs.nvidia.com/cuda/cuda-installation-guide-linux/#axzz4VZnqTJ2A ""). Ensure that you append the relevant Cuda pathnames to the LD_LIBRARY_PATH environment variable as described in the [NVIDIA's documentation](http://docs.nvidia.com/cuda/cuda-installation-guide-linux/#axzz4VZnqTJ2A "").
- The NVIDIA drivers associated with CUDA Toolkit 8.0.
cuDNN v5.1. For details, see NVIDIA's documentation. Ensure that you create the CUDA_HOME environment variable as described in the NVIDIA documentation.
- GPU card with CUDA Compute Capability 3.0 or higher. See [NVIDIA's documentation](http://docs.nvidia.com/cuda/cuda-installation-guide-linux/#axzz4VZnqTJ2A "") for a list of supported GPU cards.
- The libcupti-dev library, which is the NVIDIA CUDA Profile Tools Interface. This library provides advanced profiling support. To install this library, issue the following command:

    ```sh
    $ sudo apt-get install libcupti-dev
    ```
    
</br>
[NVIDIA PDF Docs]("http://docs.nvidia.com/cuda/pdf/CUDA_Installation_Guide_Linux.pdf")



># 2. Pre-installation Actions

2.1. Verify You Have a CUDA-Capable GPU

To verify that your GPU is CUDA-capable, go to your distribution's equivalent of System Properties, or, from the command line, enter:

```
$ lspci | grep -i nvidia
```

If you do not see any settings, update the PCI hardware database that Linux maintains by entering update-pciids (generally found in /sbin) at the command line and rerun the previous lspci command.

If your graphics card is from NVIDIA and it is listed in http://developer.nvidia.com/cuda-gpus, your GPU is CUDA-capable.

The Release Notes for the CUDA Toolkit also contain a list of supported products.

2.2. Verify You Have a Supported Version of Linux

The CUDA Development Tools are only supported on some specific distributions of Linux. These are listed in the CUDA Toolkit release notes.

To determine which distribution and release number you're running, type the following at the command line:

```
$ uname -m && cat /etc/*release
```

You should see output similar to the following, modified for your particular system:

```
x86_64
Red Hat Enterprise Linux Workstation release 6.0 (Santiago)
```

The x86_64 line indicates you are running on a 64-bit system. The remainder gives information about your distribution.

2.3. Verify the System Has gcc Installed

The gcc compiler is required for development using the CUDA Toolkit. It is not required for running CUDA applications. It is generally installed as part of the Linux installation, and in most cases the version of gcc installed with a supported version of Linux will work correctly.

To verify the version of gcc installed on your system, type the following on the command line:

```
$ gcc --version
```

If an error message displays, you need to install the development tools from your Linux distribution or obtain a version of gcc and its accompanying toolchain from the Web.

2.4. Verify the System has the Correct Kernel Headers and Development Packages Installed

The CUDA Driver requires that the kernel headers and development packages for the running version of the kernel be installed at the time of the driver installation, as well whenever the driver is rebuilt. For example, if your system is running kernel version 3.17.4-301, the 3.17.4-301 kernel headers and development packages must also be installed.

While the Runfile installation performs no package validation, the RPM and Deb installations of the driver will make an attempt to install the kernel header and development packages if no version of these packages is currently installed. However, it will install the latest version of these packages, which may or may not match the version of the kernel your system is using. Therefore, it is best to manually ensure the correct version of the kernel headers and development packages are installed prior to installing the CUDA Drivers, as well as whenever you change the kernel version.

The version of the kernel your system is running can be found by running the following command:

```
$ uname -r
```

This is the version of the kernel headers and development packages that must be installed prior to installing the CUDA Drivers. This command will be used multiple times below to specify the version of the packages to install. Note that below are the common-case scenarios for kernel usage. More advanced cases, such as custom kernel branches, should ensure that their kernel headers and sources match the kernel build they are running.

**RHEL/CentOS**

The kernel headers and development packages for the currently running kernel can be installed with:

```
$ sudo yum install kernel-devel-$(uname -r) kernel-headers-$(uname -r)
```

**Fedora**

The kernel headers and development packages for the currently running kernel can be installed with:

```
$ sudo dnf install kernel-devel-$(uname -r) kernel-headers-$(uname -r)
```

**OpenSUSE/SLES**

Use the output of the uname command to determine the running kernel's version and variant:

```
$ uname -r
3.16.6-2-default
```

In this example, the version is 3.16.6-2 and the variant is default. The kernel headers and development packages can then be installed with the following command, replacing <variant> and <version> with the variant and version discovered from the previous uname command:

```
$ sudo zypper install kernel-<variant>-devel=<version>
```

**Ubuntu**

The kernel headers and development packages for the currently running kernel can be installed with:

```
$ sudo apt-get install linux-headers-$(uname -r)
```

2.5. Choose an Installation Method

The CUDA Toolkit can be installed using either of two different installation mechanisms: distribution-specific packages, or a distribution-independent package. The distribution-independent package has the advantage of working across a wider set of Linux distributions, but does not update the distribution's native package management system. The distribution-specific packages interface with the distribution's native package management system. It is recommended to use the distribution-specific packages, where possible.

Note: Standalone installers are not provided for architectures other than the x86_64 release. For both native as well as cross development, the toolkit must be installed using the distribution-specific installer. See the CUDA Cross-Platform Installation section for more details.

2.6. Download the NVIDIA CUDA Toolkit

The NVIDIA CUDA Toolkit is available at http://developer.nvidia.com/cuda-downloads.

Choose the platform you are using and download the NVIDIA CUDA Toolkit

The CUDA Toolkit contains the CUDA driver and tools needed to create, build and run a CUDA application as well as libraries, header files, CUDA samples source code, and other resources.

Download Verification
The download can be verified by comparing the MD5 checksum posted at http://developer.nvidia.com/cuda-downloads/checksums with that of the downloaded file. If either of the checksums differ, the downloaded file is corrupt and needs to be downloaded again.

To calculate the MD5 checksum of the downloaded file, run the following:

```
$ md5sum <file>
```

2.7. Handle Conflicting Installation Methods

Before installing CUDA, any previously installations that could conflict should be uninstalled. This will not affect systems which have not had CUDA installed previously, or systems where the installation method has been preserved (RPM/Deb vs. Runfile). See the following charts for specifics.

Table 3. CUDA Toolkit Installation Compatibility Matrix
 	Installed Toolkit Version == X.Y	Installed Toolkit Version != X.Y
RPM/Deb	run	RPM/Deb	run
Installing Toolkit Version X.Y	RPM/Deb	No Action	Uninstall Run	No Action	No Action
run	Uninstall RPM/Deb	Uninstall Run	No Action	No Action
Table 4. NVIDIA Driver Installation Compatibility Matrix
 	Installed Driver Version == X.Y	Installed Driver Version != X.Y
RPM/Deb	run	RPM/Deb	run
Installing Driver Version X.Y	RPM/Deb	No Action	Uninstall Run	No Action	Uninstall Run
run	Uninstall RPM/Deb	No Action	Uninstall RPM/Deb	No Action
Use the following command to uninstall a Toolkit runfile installation:

```
$ sudo /usr/local/cuda-X.Y/bin/uninstall_cuda_X.Y.pl
```

Use the following command to uninstall a Driver runfile installation:

```
$ sudo /usr/bin/nvidia-uninstall
```

Use the following commands to uninstall a RPM/Deb installation:

```
$ sudo yum remove <package_name>                      # Redhat/CentOS
$ sudo dnf remove <package_name>                      # Fedora
$ sudo zypper remove <package_name>                   # OpenSUSE/SLES
$ sudo apt-get --purge remove <package_name>          # Ubuntu
```

Read more at: http://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#ixzz4lwI7BK2Y 
Follow us: @GPUComputing on Twitter | NVIDIA on Facebook



># 3. Package Manager Installation

Download [CUDA ToolKit](https://developer.nvidia.com/cuda-80-ga2-download-archive) from here.

```
Installation Instructions:

sudo dpkg -i cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64.deb
sudo apt-key add /var/cuda-repo-<version>/7fa2af80.pub
sudo apt-get update`
sudo apt-get install cuda
```

># 4. Runfile Installation

```
sudo sh cuda_<version>_linux.run

You may allow your Enterprise employees and Contractors to
access and use the Licensed Software pursuant to the terms of
the AGREEMENT solely to perform work on your behalf, provided
further that with respect to Contractors: (i) you obtain a
written agreement from each Contractor which contains terms
Do you accept the previously read EULA?
accept/decline/quit: accept

Install NVIDIA Accelerated Graphics Driver for Linux-x86_64 384.81?
(y)es/(n)o/(q)uit: y

Do you want to install the OpenGL libraries?
(y)es/(n)o/(q)uit [ default is yes ]: y

Do you want to run nvidia-xconfig?
This will update the system X configuration file so that the NVIDIA X driver
is used. The pre-existing X configuration file will be backed up.
This option should not be used on systems that require a custom
X configuration, such as systems with multiple GPU vendors.
(y)es/(n)o/(q)uit [ default is no ]: y

Install the CUDA 9.0 Toolkit?
(y)es/(n)o/(q)uit: y

Enter Toolkit Location
 [ default is /usr/local/cuda-9.0 ]: 

Do you want to install a symbolic link at /usr/local/cuda?
(y)es/(n)o/(q)uit: y

Install the CUDA 9.0 Samples?
(y)es/(n)o/(q)uit: y

Enter CUDA Samples Location
 [ default is /root ]: /export/cuda-samples

Installing the NVIDIA display driver...
Installing the CUDA Toolkit in /usr/local/cuda-9.0 ...
Installing the CUDA Samples in /export/cuda-samples ...
Copying samples to /export/cuda-samples/NVIDIA_CUDA-9.0_Samples now...
Finished copying samples.

===========
= Summary =
===========

Driver:   Installed
Toolkit:  Installed in /usr/local/cuda-9.0
Samples:  Installed in /export/cuda-samples

Please make sure that
 -   PATH includes /usr/local/cuda-9.0/bin
 -   LD_LIBRARY_PATH includes /usr/local/cuda-9.0/lib64, or, add /usr/local/cuda-9.0/lib64 to /etc/ld.so.conf and run ldconfig as root

To uninstall the CUDA Toolkit, run the uninstall script in /usr/local/cuda-9.0/bin
To uninstall the NVIDIA Driver, run nvidia-uninstall

Please see CUDA_Installation_Guide_Linux.pdf in /usr/local/cuda-9.0/doc/pdf for detailed information on setting up CUDA.

Logfile is /tmp/cuda_install_3790.log

```



># 6. Post-installation Actions

6.1. Mandatory Actions

Some actions must be taken after the installation before the CUDA Toolkit and Driver can be used.

6.1.1. Environment Setup

The PATH variable needs to include */usr/local/cuda-8.0/bin*

To add this path to the **PATH** variable:

```
$ export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}
```
In addition, when using the runfile installation method, the LD_LIBRARY_PATH variable needs to contain */usr/local/cuda-8.0/lib64* on a 64-bit system, or */usr/local/cuda-8.0/lib* on a 32-bit system

To change the environment variables for 64-bit operating systems:

```
$ export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64/${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}                       
```
To change the environment variables for 32-bit operating systems:

```
$ export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib/${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
```
                        
Note that the above paths change when using a custom install path with the runfile installation method.

Read more at: http://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#ixzz4lwPRZRRM 
Follow us: @GPUComputing on Twitter | NVIDIA on Facebook


6.2. Recommended Actions

Other actions are recommended to verify the integrity of the installation.

6.2.1. Install Writable Samples

In order to modify, compile, and run the samples, the samples must be installed with write permissions. A convenience installation script is provided:

```
$ cd /usr/local/cuda-{version}/bin
$ cuda-install-samples-8.0.sh /export/local/cuda-0.8
```

This script is installed with the cuda-samples-8-0 package. The cuda-samples-8-0 package installs only a read-only copy in */usr/local/cuda-8.0/samples*.

6.2.2. Verify the Installation

Before continuing, it is important to verify that the CUDA toolkit can find and communicate correctly with the CUDA-capable hardware. To do this, you need to compile and run some of the included sample programs.

Note: Ensure the PATH and, if using the runfile installation method, LD_LIBRARY_PATH variables are set correctly.

6.2.2.1. Verify the Driver Version

If you installed the driver, verify that the correct version of it is loaded. If you did not install the driver, or are using an operating system where the driver is not loaded via a kernel module, such as L4T, skip this step.

When the driver is loaded, the driver version can be found by executing the command

```
$ cat /proc/driver/nvidia/version
```

Note that this command will not work on an iGPU/dGPU system.

6.2.2.2. Compiling the Examples

The version of the CUDA Toolkit can be checked by running **nvcc -V** in a terminal window. The nvcc command runs the compiler driver that compiles CUDA programs. It calls the gcc compiler for C code and the NVIDIA PTX compiler for the CUDA code.

The NVIDIA CUDA Toolkit includes sample programs in source form. You should compile them by changing to ~/NVIDIA_CUDA-8.0_Samples and typing make. The resulting binaries will be placed under **~/NVIDIA_CUDA-8.0_Samples/bin**.

<span style="color:#BBDD93;">
After the compiled is successful, the server must be restarted
</span>

6.2.2.3. Running the Binaries

After compilation, find and run deviceQuery under ~/NVIDIA_CUDA-8.0_Samples. If the CUDA software is installed and configured correctly, the output for deviceQuery should look similar to that shown in Figure 1.


```
root@A01-R03-I185-75:/export/local/cuda-8.0/NVIDIA_CUDA-8.0_Samples# ./bin/x86_64/linux/release/deviceQuery
./bin/x86_64/linux/release/deviceQuery Starting...

 CUDA Device Query (Runtime API) version (CUDART static linking)

Detected 4 CUDA Capable device(s)

Device 0: "Tesla K40c"
  CUDA Driver Version / Runtime Version          8.0 / 8.0
  CUDA Capability Major/Minor version number:    3.5
  Total amount of global memory:                 11440 MBytes (11995578368 bytes)
  (15) Multiprocessors, (192) CUDA Cores/MP:     2880 CUDA Cores
  GPU Max Clock rate:                            745 MHz (0.75 GHz)
  Memory Clock rate:                             3004 Mhz
  Memory Bus Width:                              384-bit
  L2 Cache Size:                                 1572864 bytes
  Maximum Texture Dimension Size (x,y,z)         1D=(65536), 2D=(65536, 65536), 3D=(4096, 4096, 4096)
  Maximum Layered 1D Texture Size, (num) layers  1D=(16384), 2048 layers
  Maximum Layered 2D Texture Size, (num) layers  2D=(16384, 16384), 2048 layers
  Total amount of constant memory:               65536 bytes
  Total amount of shared memory per block:       49152 bytes
  Total number of registers available per block: 65536
  Warp size:                                     32
  Maximum number of threads per multiprocessor:  2048
  Maximum number of threads per block:           1024
  Max dimension size of a thread block (x,y,z): (1024, 1024, 64)
  Max dimension size of a grid size    (x,y,z): (2147483647, 65535, 65535)
  Maximum memory pitch:                          2147483647 bytes
  Texture alignment:                             512 bytes
  Concurrent copy and kernel execution:          Yes with 2 copy engine(s)
  Run time limit on kernels:                     No
  Integrated GPU sharing Host Memory:            No
  Support host page-locked memory mapping:       Yes
  Alignment requirement for Surfaces:            Yes
  Device has ECC support:                        Enabled
  Device supports Unified Addressing (UVA):      Yes
  Device PCI Domain ID / Bus ID / location ID:   0 / 2 / 0
  Compute Mode:
     < Default (multiple host threads can use ::cudaSetDevice() with device simultaneously) >

Device 1: "Tesla K40c"
  CUDA Driver Version / Runtime Version          8.0 / 8.0
  CUDA Capability Major/Minor version number:    3.5
  Total amount of global memory:                 11440 MBytes (11995578368 bytes)
  (15) Multiprocessors, (192) CUDA Cores/MP:     2880 CUDA Cores
  GPU Max Clock rate:                            745 MHz (0.75 GHz)
  Memory Clock rate:                             3004 Mhz
  Memory Bus Width:                              384-bit
  L2 Cache Size:                                 1572864 bytes
  Maximum Texture Dimension Size (x,y,z)         1D=(65536), 2D=(65536, 65536), 3D=(4096, 4096, 4096)
  Maximum Layered 1D Texture Size, (num) layers  1D=(16384), 2048 layers
  Maximum Layered 2D Texture Size, (num) layers  2D=(16384, 16384), 2048 layers
  Total amount of constant memory:               65536 bytes
  Total amount of shared memory per block:       49152 bytes
  Total number of registers available per block: 65536
  Warp size:                                     32
  Maximum number of threads per multiprocessor:  2048
  Maximum number of threads per block:           1024
  Max dimension size of a thread block (x,y,z): (1024, 1024, 64)
  Max dimension size of a grid size    (x,y,z): (2147483647, 65535, 65535)
  Maximum memory pitch:                          2147483647 bytes
  Texture alignment:                             512 bytes
  Concurrent copy and kernel execution:          Yes with 2 copy engine(s)
  Run time limit on kernels:                     No
  Integrated GPU sharing Host Memory:            No
  Support host page-locked memory mapping:       Yes
  Alignment requirement for Surfaces:            Yes
  Device has ECC support:                        Enabled
  Device supports Unified Addressing (UVA):      Yes
  Device PCI Domain ID / Bus ID / location ID:   0 / 4 / 0
  Compute Mode:
     < Default (multiple host threads can use ::cudaSetDevice() with device simultaneously) >

Device 2: "Tesla K40c"
  CUDA Driver Version / Runtime Version          8.0 / 8.0
  CUDA Capability Major/Minor version number:    3.5
  Total amount of global memory:                 11440 MBytes (11995578368 bytes)
  (15) Multiprocessors, (192) CUDA Cores/MP:     2880 CUDA Cores
  GPU Max Clock rate:                            745 MHz (0.75 GHz)
  Memory Clock rate:                             3004 Mhz
  Memory Bus Width:                              384-bit
  L2 Cache Size:                                 1572864 bytes
  Maximum Texture Dimension Size (x,y,z)         1D=(65536), 2D=(65536, 65536), 3D=(4096, 4096, 4096)
  Maximum Layered 1D Texture Size, (num) layers  1D=(16384), 2048 layers
  Maximum Layered 2D Texture Size, (num) layers  2D=(16384, 16384), 2048 layers
  Total amount of constant memory:               65536 bytes
  Total amount of shared memory per block:       49152 bytes
  Total number of registers available per block: 65536
  Warp size:                                     32
  Maximum number of threads per multiprocessor:  2048
  Maximum number of threads per block:           1024
  Max dimension size of a thread block (x,y,z): (1024, 1024, 64)
  Max dimension size of a grid size    (x,y,z): (2147483647, 65535, 65535)
  Maximum memory pitch:                          2147483647 bytes
  Texture alignment:                             512 bytes
  Concurrent copy and kernel execution:          Yes with 2 copy engine(s)
  Run time limit on kernels:                     No
  Integrated GPU sharing Host Memory:            No
  Support host page-locked memory mapping:       Yes
  Alignment requirement for Surfaces:            Yes
  Device has ECC support:                        Enabled
  Device supports Unified Addressing (UVA):      Yes
  Device PCI Domain ID / Bus ID / location ID:   0 / 131 / 0
  Compute Mode:
     < Default (multiple host threads can use ::cudaSetDevice() with device simultaneously) >

Device 3: "Tesla K40c"
  CUDA Driver Version / Runtime Version          8.0 / 8.0
  CUDA Capability Major/Minor version number:    3.5
  Total amount of global memory:                 11440 MBytes (11995578368 bytes)
  (15) Multiprocessors, (192) CUDA Cores/MP:     2880 CUDA Cores
  GPU Max Clock rate:                            745 MHz (0.75 GHz)
  Memory Clock rate:                             3004 Mhz
  Memory Bus Width:                              384-bit
  L2 Cache Size:                                 1572864 bytes
  Maximum Texture Dimension Size (x,y,z)         1D=(65536), 2D=(65536, 65536), 3D=(4096, 4096, 4096)
  Maximum Layered 1D Texture Size, (num) layers  1D=(16384), 2048 layers
  Maximum Layered 2D Texture Size, (num) layers  2D=(16384, 16384), 2048 layers
  Total amount of constant memory:               65536 bytes
  Total amount of shared memory per block:       49152 bytes
  Total number of registers available per block: 65536
  Warp size:                                     32
  Maximum number of threads per multiprocessor:  2048
  Maximum number of threads per block:           1024
  Max dimension size of a thread block (x,y,z): (1024, 1024, 64)
  Max dimension size of a grid size    (x,y,z): (2147483647, 65535, 65535)
  Maximum memory pitch:                          2147483647 bytes
  Texture alignment:                             512 bytes
  Concurrent copy and kernel execution:          Yes with 2 copy engine(s)
  Run time limit on kernels:                     No
  Integrated GPU sharing Host Memory:            No
  Support host page-locked memory mapping:       Yes
  Alignment requirement for Surfaces:            Yes
  Device has ECC support:                        Enabled
  Device supports Unified Addressing (UVA):      Yes
  Device PCI Domain ID / Bus ID / location ID:   0 / 132 / 0
  Compute Mode:
     < Default (multiple host threads can use ::cudaSetDevice() with device simultaneously) >
> Peer access from Tesla K40c (GPU0) -> Tesla K40c (GPU1) : Yes
> Peer access from Tesla K40c (GPU0) -> Tesla K40c (GPU2) : No
> Peer access from Tesla K40c (GPU0) -> Tesla K40c (GPU3) : No
> Peer access from Tesla K40c (GPU1) -> Tesla K40c (GPU0) : Yes
> Peer access from Tesla K40c (GPU1) -> Tesla K40c (GPU2) : No
> Peer access from Tesla K40c (GPU1) -> Tesla K40c (GPU3) : No
> Peer access from Tesla K40c (GPU2) -> Tesla K40c (GPU0) : No
> Peer access from Tesla K40c (GPU2) -> Tesla K40c (GPU1) : No
> Peer access from Tesla K40c (GPU2) -> Tesla K40c (GPU3) : Yes
> Peer access from Tesla K40c (GPU3) -> Tesla K40c (GPU0) : No
> Peer access from Tesla K40c (GPU3) -> Tesla K40c (GPU1) : No
> Peer access from Tesla K40c (GPU3) -> Tesla K40c (GPU2) : Yes

deviceQuery, CUDA Driver = CUDART, CUDA Driver Version = 8.0, CUDA Runtime Version = 8.0, NumDevs = 4, Device0 = Tesla K40c, Device1 = Tesla K40c, Device2 = Tesla K40c, Device3 = Tesla K40c
Result = PASS

```


Figure 1. Valid Results from deviceQuery CUDA Sample


Read more at: http://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#ixzz4lwig31nt 
Follow us: @GPUComputing on Twitter | NVIDIA on Facebook


```
```

># Install cuDNN


1. Install path: /usr/local/cuda-8.0
2. Load Path: /usr/lib/x86_64-linux-gnu


https://developer.nvidia.com/rdp/cudnn-download


```
cp include/cudnn.h /usr/local/cuda-8.0/targets/x86_64-linux/include/

cp lib64/libcudnn* /usr/local/cuda-8.0/targets/x86_64-linux/lib/

chmod a+r /usr/local/cuda-8.0/targets/x86_64-linux/include//cudnn.h /usr/local/cuda-8.0/targets/x86_64-linux/lib/libcudnn*
```

```
$ tar xvzf cudnn-8.0-linux-x64-v5.1-ga.tgz
$ sudo cp -P cuda/include/cudnn.h /usr/local/cuda/include
$ sudo cp -P cuda/lib64/libcudnn* /usr/local/cuda/lib64
$ sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*
```

#### Remove cuDNN

```
$ dpkg -r libcudnn6-dev

(Reading database ... 141032 files and directories currently installed.)
Removing libcudnn6-dev (6.0.21-1+cuda8.0) ...
update-alternatives: removing manually selected alternative - switching libcudnn to auto mode
```

```
```

># <span style="color:red">Errors</span>

- Makefile:381: recipe for target 'cudaDecodeGL' failed

The change from nvidia-367 to nvidia-375 (the enabled Nvidia driver) should have been made in the .../NVIDIA_CUDA-8.0_Samples/3_Imaging/cudaDecodeGL/findgllib.mk file, on line

```
UBUNTU_PKG_NAME = "nvidia-375" 
```



- ubuntu@tegra-ubuntu:~/NVIDIA_CUDA-8.0_Samples/5_Simulations/nbody_opengles$ make

```
>>> WARNING - libGLES.so not found, please install libGLES.so <<<
>>> WARNING - egl.h not found, please install egl.h <<<
>>> WARNING - eglext.h not found, please install eglext.h <<<
>>> WARNING - gl31.h not found, please install gl31.h <<<
```



https://medium.com/@ikekramer/installing-cuda-8-0-and-cudnn-5-1-on-ubuntu-16-04-6b9f284f6e77


- /sbin/ldconfig.real: /usr/lib/nvidia-375/libEGL.so.1 is not a symbolic link

```
sudo mv /usr/lib/nvidia-375/libEGL.so.1 /usr/lib/nvidia-375/libEGL.so.1.org
sudo mv /usr/lib32/nvidia-375/libEGL.so.1 /usr/lib32/nvidia-375/libEGL.so.1.org
sudo ln -s /usr/lib/nvidia-375/libEGL.so.375.39 /usr/lib/nvidia-375/libEGL.so.1
sudo ln -s /usr/lib32/nvidia-375/libEGL.so.375.39 /usr/lib32/nvidia-375/libEGL.so.1
```

- ImportError: libcublas.so.8.0: cannot open shared object file: No such file or directory

```
sudo sh -c "echo '/usr/local/cuda-9.0/lib64\n/usr/local/cuda-9.0/lib' >> /etc/ld.so.conf.d/nvidia.conf"
```


- cuda E: Unable to locate package cuda

```
cd /etc/apt/

touch cuda-9-0-local.list
# append the content to it as below
  
  ---------------------------------------
  deb file:///var/cuda-repo-9-0-local /
  ---------------------------------------

```



