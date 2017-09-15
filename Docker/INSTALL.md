https://docs.docker.com/engine/installation/linux/ubuntu/#install-using-the-repository

https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#uninstall-docker-ce


## Uninstall old versions

Older versions of Docker were called docker or docker-engine. If these are installed, uninstall them:

```sh
sudo apt-get remove docker docker-engine docker.io
```

It’s OK if apt-get reports that none of these packages are installed.

The contents of /var/lib/docker/, including images, containers, volumes, and networks, are preserved. The Docker CE package is now called docker-ce.


## Recommended extra packages for Trusty 14.04

Unless you have a strong reason not to, install the linux-image-extra-* packages, which allow Docker to use the aufs storage drivers.

```sh
$ sudo apt-get update

$ sudo apt-get install \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual
```

For Ubuntu 16.04 and higher, the Linux kernel includes support for OverlayFS, and Docker CE will use the overlay2 storage driver by default.


## Install Docker CE

You can install Docker CE in different ways, depending on your needs:

- Most users set up Docker’s repositories and install from them, for ease of installation and upgrade tasks. This is the recommended approach.

- Some users download the DEB package and install it manually and manage upgrades completely manually. This is useful in situations such as installing Docker on air-gapped systems with no access to the internet.

- In testing and development environments, some users choose to use automated convenience scripts to install Docker.


## Install using the repository

Before you install Docker CE for the first time on a new host machine, you need to set up the Docker repository. Afterward, you can install and update Docker from the repository.

## SET UP THE REPOSITORY

1.Update the apt package index:

```sh
$ sudo apt-get update
```

2.Install packages to allow apt to use a repository over HTTPS:

```sh
$ sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
```

3.Add Docker’s official GPG key:

```sh
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

Verify that you now have the key with the fingerprint 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88, by searching for the last 8 characters of the fingerprint.

```sh
$ sudo apt-key fingerprint 0EBFCD88

pub   4096R/0EBFCD88 2017-02-22
      Key fingerprint = 9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
uid                  Docker Release (CE deb) <docker@docker.com>
sub   4096R/F273FCD8 2017-02-22
```

4.Use the following command to set up the stable repository. You always need the stable repository, even if you want to install builds from the edge or testing repositories as well. To add the edge or testing repository, add the word edge or testing (or both) after the word stable in the commands below.

>**Note**: The lsb_release -cs sub-command below returns the name of your Ubuntu distribution, such as xenial. Sometimes, in a distribution like Linux Mint, you might have to change $(lsb_release -cs) to your parent Ubuntu distribution. For example, if you are using Linux Mint Rafaela, you could use trusty.



### amd64:

```sh
$ sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```
### armhf:

```sh
$ sudo add-apt-repository \
   "deb [arch=armhf] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```
### s390x:

```sh
$ sudo add-apt-repository \
   "deb [arch=s390x] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```
   
>**Note**: Starting with Docker 17.06, stable releases are also pushed to the edge and testing repositories.



## INSTALL DOCKER CE

Update the ```apt``` package index.

```sh
$ sudo apt-get update
```

Install the latest version of Docker CE, or go to the next step to install a specific version. Any existing installation of Docker is replaced.

```
$ sudo apt-get install docker-ce
```

>Got multiple Docker repositories?

If you have multiple Docker repositories enabled, installing or updating without specifying a version in the apt-get install or apt-get update command will always install the highest possible version, which may not be appropriate for your stability needs.

On production systems, you should install a specific version of Docker CE instead of always using the latest. This output is truncated. List the available versions.

```
$ apt-cache madison docker-ce
docker-ce | 17.06.0~ce-0~ubuntu | https://download.docker.com/linux/ubuntu xenial/stable amd64 Packages
```

The contents of the list depend upon which repositories are enabled. Choose a specific version to install. The second column is the version string. The third column is the repository name, which indicates which repository the package is from and by extension its stability level. To install a specific version, append the version string to the package name and separate them by an equals sign (=):

```
$ sudo apt-get install docker-ce=<VERSION>
```

The Docker daemon starts automatically.

4.Verify that Docker CE is installed correctly by running the hello-world image.

```
$ sudo docker run hello-world
```

This command downloads a test image and runs it in a container. When the container runs, it prints an informational message and exits.

Docker CE is installed and running. You need to use sudo to run Docker commands. Continue to Linux postinstall to allow non-privileged users to run Docker commands and for other optional configuration steps.

### UPGRADE DOCKER CE

To upgrade Docker CE, first run sudo apt-get update, then follow the installation instructions, choosing the new version you want to install.

### Install from a package

If you cannot use Docker’s repository to install Docker CE, you can download the .deb file for your release and install it manually. You will need to download a new file each time you want to upgrade Docker CE.

1.    Go to https://download.docker.com/linux/ubuntu/dists/, choose your Ubuntu version, browse to pool/stable/ and choose amd64, armhf, or s390x. Download the .deb file for the Docker version you want to install.

>Note: To install an edge package, change the word stable in the URL to edge. Learn about stable and edge channels.

2.    Install Docker CE, changing the path below to the path where you downloaded the Docker package.

```
$ sudo dpkg -i /path/to/package.deb
```

The Docker daemon starts automatically.

3.    Verify that Docker CE is installed correctly by running the hello-world image.

```
$ sudo docker run hello-world
```

This command downloads a test image and runs it in a container. When the container runs, it prints an informational message and exits.

Docker CE is installed and running. You need to use sudo to run Docker commands. Continue to Post-installation steps for Linux to allow non-privileged users to run Docker commands and for other optional configuration steps.

### UPGRADE DOCKER CE

To upgrade Docker CE, download the newer package file and repeat the installation procedure, pointing to the new file.

### Install using the convenience script
Docker provides convenience scripts at get.docker.com and test.docker.com for installing stable and testing versions of Docker CE into development environments quickly and non-interactively. The source code for the scripts is in the docker-install repository. Using these scripts is not recommended for production environments, and you should understand the potential risks before you use them:

- The scripts require root or sudo privileges in order to run. Therefore, you should carefully examine and audit the scripts before running them.
- The scripts attempt to detect your Linux distribution and version and configure your package management system for you. In addition, the scripts do not allow you to customize any installation parameters. This may lead to an unsupported configuration, either from Docker’s point of view or from your own organization’s guidelines and standards.
- The scripts install all dependencies and recommendations of the package manager without asking for confirmation. This may install a large number of packages, depending on the current configuration of your host machine.
- Do not use the convenience script if Docker has already been installed on the host machine using another mechanism.

This example uses the script at get.docker.com to install the latest stable release of Docker CE on Linux. To install the latest testing version, use test.docker.com instead. In each of the commands below, replace each occurrence of get with test.

>Warning:
Always examine scripts downloaded from the internet before running them locally.

```
$ curl -fsSL get.docker.com -o get-docker.sh
$ sudo sh get-docker.sh

<output truncated>

If you would like to use Docker as a non-root user, you should now consider
adding your user to the "docker" group with something like:

  sudo usermod -aG docker your-user

Remember that you will have to log out and back in for this to take effect!

WARNING: Adding a user to the "docker" group will grant the ability to run
         containers which can be used to obtain root privileges on the
         docker host.
         Refer to https://docs.docker.com/engine/security/security/#docker-daemon-attack-surface
         for more information.
```

Docker CE is installed. It starts automatically on DEB-based distributions. On RPM-based distributions, you need to start it manually using the appropriate systemctl or service command. As the message indicates, non-root users are not able to run Docker commands by default.

UPGRADE DOCKER AFTER USING THE CONVENIENCE SCRIPT

If you installed Docker using the convenience script, you should upgrade Docker using your package manager directly. There is no advantage to re-running the convenience script, and it can cause issues if it attempts to re-add repositories which have already been added to the host machine.

Uninstall Docker CE
Uninstall the Docker CE package:

$ sudo apt-get purge docker-ce
Images, containers, volumes, or customized configuration files on your host are not automatically removed. To delete all images, containers, and volumes:

$ sudo rm -rf /var/lib/docker
You must delete any edited configuration files manually.

Next steps
Continue to Post-installation steps for Linux

Continue with the User Guide.

requirements, apt, installation, ubuntu, install, uninstall, upgrade, update



```
$ apt-cache madison docker-ce
 docker-ce | 17.06.0~ce-0~ubuntu | https://download.docker.com/linux/ubuntu xenial/stable amd64 Packages
 docker-ce | 17.03.2~ce-0~ubuntu-xenial | https://download.docker.com/linux/ubuntu xenial/stable amd64 Packages
 docker-ce | 17.03.1~ce-0~ubuntu-xenial | https://download.docker.com/linux/ubuntu xenial/stable amd64 Packages
 docker-ce | 17.03.0~ce-0~ubuntu-xenial | https://download.docker.com/linux/ubuntu xenial/stable amd64 Packages
```


```
$ sudo apt-get install docker-ce=<VERSION>
```