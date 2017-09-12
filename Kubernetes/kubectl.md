More details, see [kubectl](https://kubernetes.io/docs/tasks/kubectl/install/)


## Installing and Setting Up kubectl

To deploy and manage applications on Kubernetes, you¡¯ll use the Kubernetes command-line tool, kubectl. It lets you inspect your cluster resources, create, delete, and update components, and much more. You will use it to look at your new cluster and bring up example apps.
You should use a version of kubectl that is at least as new as your server. **kubectl version** will print the server and client versions. Using the same version of kubectl as your server naturally works; using a newer kubectl than your server also works; but if you use an older kubectl with a newer server you may see odd validation errors.
Here are a few methods to install kubectl.


#### Install kubectl Binary Via curl

Download the latest release with the command:

```sh

# OS X
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/darwin/amd64/kubectl

# Linux
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl

# Windows
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/windows/amd64/kubectl.exe

```

If you want to download a specific version of kubectl you can replace the nested curl command from above with the version you want. (e.g. v1.4.6, v1.5.0-beta.2)
Make the kubectl binary executable and move it to your PATH (e.g. **/usr/local/bin**):

```sh

chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

```


## Extract kubectl from Release .tar.gz or Compiled Source

If you downloaded a pre-compiled release, kubectl will be under platforms/<os>/<arch> from the tar bundle.

If you compiled Kubernetes from source, kubectl should be either under
```
_output/local/bin/<os>/<arch> or _output/dockerized/bin/<os>/<arch>.
```

Copy or move kubectl into a directory already in your PATH (e.g. /usr/local/bin). For example:

```sh
# OS X
sudo cp platforms/darwin/amd64/kubectl /usr/local/bin/kubectl

# Linux
sudo cp platforms/linux/amd64/kubectl /usr/local/bin/kubectl
```

Next make it executable with the following command:

```sh
sudo chmod +x /usr/local/bin/kubectl
```

The kubectl binary doesn¡¯t have to be installed to be executable, but the rest of the walkthrough will assume that it¡¯s in your PATH.
If you prefer not to copy kubectl, you need to ensure it is in your path:

```sh
# OS X
export PATH=<path/to/kubernetes-directory>/platforms/darwin/amd64:$PATH

# Linux
export PATH=<path/to/kubernetes-directory>/platforms/linux/amd64:$PATH
```

## Download as part of the Google Cloud SDK

kubectl can be installed as part of the Google Cloud SDK:
First install the Google Cloud SDK.
After Google Cloud SDK installs, run the following command to install kubectl:

```sh
gcloud components install kubectl
```

And the terminal output as below:

```
Your current Cloud SDK version is: 170.0.1
Installing components from version: 170.0.1

©°©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©´
©¦     These components will be installed.      ©¦
©À©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©Ð©¤©¤©¤©¤©¤©¤©¤©¤©¤©Ð©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©È
©¦           Name          ©¦ Version ©¦   Size   ©¦
©À©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©à©¤©¤©¤©¤©¤©¤©¤©¤©¤©à©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©È
©¦ kubectl                 ©¦         ©¦          ©¦
©¦ kubectl (Linux, x86_64) ©¦   1.7.5 ©¦ 16.0 MiB ©¦
©¸©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©Ø©¤©¤©¤©¤©¤©¤©¤©¤©¤©Ø©¤©¤©¤©¤©¤©¤©¤©¤©¤©¤©¼

For the latest full release notes, please visit:
  https://cloud.google.com/sdk/release_notes

Do you want to continue (Y/n)?  Y

¨X¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨[
¨d¨T Creating update staging area                             ¨T¨g
¨d¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨g
¨d¨T Installing: kubectl                                      ¨T¨g
¨d¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨g
¨d¨T Installing: kubectl (Linux, x86_64)                      ¨T¨g
¨d¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨g
¨d¨T Creating backup and activating new installation          ¨T¨g
¨^¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨T¨a

Performing post processing steps...done.                                                                                                                                                                                                

Update done!

WARNING:   There are older versions of Google Cloud Platform tools on your system PATH.
  Please remove the following to avoid accidentally invoking these old tools:

  /usr/local/bin/kubectl
```

Then restart your server.

Do check that the version is sufficiently up-to-date using **kubectl version**.


## Install with brew

If you are on MacOS and using brew, you can install with:

```
brew install kubectl
```

The homebrew project is independent from kubernetes, so do check that the version is sufficiently up-to-date using **kubectl version** .


## Configuring kubectl

In order for kubectl to find and access the Kubernetes cluster, it needs a kubeconfig file, which is created automatically when creating a cluster using kube-up.sh or upon successful deployment of Minikube cluster (see the getting started guides for more about creating clusters). If you need access to a cluster you didn¡¯t create, see the Sharing Cluster Access document. By default, kubectl configuration lives at ~/.kube/config.

#### Making sure you¡¯re ready

Check that kubectl is properly configured by getting the cluster state:

```
$ kubectl cluster-info
```

If you see a url response, you are ready to go.

## Enabling shell autocompletion

kubectl includes autocompletion support, which can save a lot of typing!
The completion script itself is generated by kubectl, so you typically just need to invoke it from your profile.
Common examples are provided here, but for more details please consult **kubectl completion -h**

#### On Linux, using bash
To add it to your current shell: source <(**kubectl completion bash**)
To add kubectl autocompletion to your profile (so it is automatically loaded in future shells):

```
echo "source <(kubectl completion bash)" >> ~/.bashrc
```

#### On MacOS, using bash

On MacOS, you will need to install the bash-completion support first:

```
brew install bash-completion
```

To add it to your current shell:

```
source $(brew --prefix)/etc/bash_completion
source <(kubectl completion bash)
```

To add kubectl autocompletion to your profile (so it is automatically loaded in future shells):

```
echo "source $(brew --prefix)/etc/bash_completion" >> ~/.bash_profile
echo "source <(kubectl completion bash)" >> ~/.bash_profile
```

Please note that this only appears to work currently if you install using **brew install kubectl**, and not if you downloaded kubectl directly.

## What¡¯s next?

[Learn how to launch and expose your application.](https://kubernetes.io/docs/user-guide/quick-start)




<hr style="width: 800px" align="left"/>


# Google Cloud SDK

&emsp;[Install Guide](https://cloud.google.com/sdk/docs/#linux).


# Driver Installation

&emsp;Details [see](https://github.com/kubernetes/minikube/blob/master/DRIVERS.md#kvm-driver)


Driver plugin installation
Minikube uses Docker Machine to manage the Kubernetes VM so it benefits from the driver plugin architecture that Docker Machine uses to provide a consistent way to manage various VM providers. Minikube embeds VirtualBox and VMware Fusion drivers so there are no additional steps to use them. However, other drivers require an extra binary to be present in the host PATH.

The following drivers currently require driver plugin binaries to be present in the host PATH:

- [KVM](https://github.com/kubernetes/minikube/blob/master/DRIVERS.md#kvm-driver)
- [xhyve](https://github.com/kubernetes/minikube/blob/master/DRIVERS.md#xhyve-driver)

#### KVM driver

Minikube is currently tested against docker-machine-driver-kvm 0.7.0.

From https://github.com/dhiltgen/docker-machine-kvm#quick-start-instructions:

```sh

$ sudo curl -L https://github.com/dhiltgen/docker-machine-kvm/releases/download/v0.7.0/docker-machine-driver-kvm -o /usr/local/bin/docker-machine-driver-kvm
$ sudo chmod +x /usr/local/bin/docker-machine-driver-kvm

# Install libvirt and qemu-kvm on your system, e.g.
# Debian/Ubuntu
$ sudo apt install libvirt-bin qemu-kvm
# Fedora/CentOS/RHEL
$ sudo yum install libvirt-daemon-kvm kvm

# Add yourself to the libvirtd group (use libvirt group for rpm based distros) so you don't need to sudo
# Debian/Ubuntu
$ sudo usermod -a -G libvirtd $(whoami)
# Fedora/CentOS/RHEL
$ sudo usermod -a -G libvirt $(whoami)

# Update your current session for the group change to take effect
# Debian/Ubuntu
$ newgrp libvirtd
# Fedora/CentOS/RHEL
$ newgrp libvirt

```

#### xhyve driver

From https://github.com/zchee/docker-machine-driver-xhyve#install:

$ brew install docker-machine-driver-xhyve

```sh
# docker-machine-driver-xhyve need root owner and uid
$ sudo chown root:wheel $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
$ sudo chmod u+s $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
```

#### HyperV driver

Hyper-v users may need to create a new external network switch as described here. This step may prevent a problem in which minikube start hangs indefinitely, unable to ssh into the minikube virtual machine. In this add, add the --hyperv-virtual-switch=switch-name argument to the minikube start command.