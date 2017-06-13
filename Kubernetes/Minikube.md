# Minikube

[![Build Status](https://travis-ci.org/kubernetes/minikube.svg?branch=master)](https://travis-ci.org/kubernetes/minikube)
[![codecov](https://codecov.io/gh/kubernetes/minikube/branch/master/graph/badge.svg)](https://codecov.io/gh/kubernetes/minikube)

[<img src="https://github.com/kubernetes/minikube/raw/master/logo/logo.png" width="100">](https://github.com/kubernetes/minikube)

## What is Minikube?

Minikube is a tool that makes it easy to run Kubernetes locally. Minikube runs a single-node Kubernetes cluster inside a VM on your laptop for users looking to try out Kubernetes or develop with it day-to-day.

### Features

* Minikube packages and configures a Linux VM, the container runtime, and all Kubernetes components, optimized for local development.
* Minikube supports Kubernetes features such as:
  * DNS
  * NodePorts
  * ConfigMaps and Secrets
  * Dashboards
  * Container Runtime: Docker, and [rkt](https://github.com/coreos/rkt)
  * Enabling CNI (Container Network Interface)
  

## Installation

```sh

sudo apt-get install virtualbox

```

```sh

curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.17.1/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/

```


```sh
lhfei@master1:~$ minikube start
There is a newer version of minikube available (v0.18.0).  Download it here:
https://github.com/kubernetes/minikube/releases/tag/v0.18.0

To disable this notification, run the following:
minikube config set WantUpdateNotification false
Starting local Kubernetes cluster...
Starting VM...
Downloading Minikube ISO
 89.26 MB / 89.26 MB [==============================================] 100.00% 0s
SSH-ing files into VM...
Setting up certs...
Starting cluster components...
Connecting to cluster...
Setting up kubeconfig...
Kubectl is now configured to use the cluster.

```

```sh
lhfei@master1:~$ kubectl run hello-minikube --image=gcr.io/google_containers/echoserver:1.4 --port=8080
deployment "hello-minikube" created
lhfei@master1:~$ kubectl expose deployment hello-minikube --type=NodePort
service "hello-minikube" exposed

# We have now launched an echoserver pod but we have to wait until the pod is up before curling/accessing it
# via the exposed service.
# To check whether the pod is up and running we can use the following:
lhfei@master1:~$ kubectl get pod
NAME                              READY     STATUS              RESTARTS   AGE
hello-minikube-3015430129-ndcdg   1/1       ContainerCreating   0          3s
# We can see that the pod is still being created from the ContainerCreating status
lhfei@master1:~$ kubectl get pod
NAME                              READY     STATUS    RESTARTS   AGE
hello-minikube-3015430129-ndcdg   1/1       Running   0          13s
# We can see that the pod is now Running and we will now be able to curl it:
lhfei@master1:~$ curl $(minikube service hello-minikube --url)
CLIENT VALUES:
client_address=172.17.0.2
command=GET
real path=/
query=nil
request_version=1.1
request_uri=http://192.168.99.100:8080/

SERVER VALUES:
server_version=nginx: 1.10.0 - lua: 10001

HEADERS RECEIVED:
accept=*/*
host=192.168.99.100:32334
user-agent=curl/7.35.0
...
lhfei@master1:~$ minikube stop
Stopping local Kubernetes cluster...
Machine stopped.
```

# FAQs

```html
E0407 03:34:56.242444     587 start.go:119] Error starting host:  Error creating host: Error with pre-create check: "This computer doesn't have VT-X/AMD-v enabled. Enabling it in the BIOS is mandatory"
```



#### Install kubectl Binary Via curl

curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl