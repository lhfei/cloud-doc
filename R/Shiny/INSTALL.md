## RedHat/CentOS 6+

We currently only provide a pre-built binary for the 64 bit architecture. Running on other architectures or versions will require [building from source](https://github.com/rstudio/shiny-server/wiki/Building-Shiny-Server-from-Source).

Before installing Shiny Server, you must install R and the Shiny R package. To install R, you can use the [Extra Packages for Enterprise Linux](https://fedoraproject.org/wiki/EPEL)(EPEL) repository. If you don’t already have this repository available you should add it to your system using the instructions found on the [Fedora EPEL website](https://fedoraproject.org/wiki/EPEL).

After enabling EPEL you should then ensure that you have installed the version of R available from EPEL. You can do this using the following command:

```
$ sudo yum install R
```





You’ll also need to install the Shiny R package before installing Shiny Server:



```
$ sudo su - \-c "R -e \"install.packages('shiny', repos='https://cran.rstudio.com/')\""
```





If you’re using a version of R older than R 3.2.2, you may need to take additional actions as 

described here

 in order successfully download and install the package securely. Alternatively, you can download the package insecurely in any version of R by using HTTP instead of HTTPS for the CRAN mirror.



Once you’ve installed R and the Shiny package, execute the following commands in a terminal window to install Shiny Server.





Download and Install

To download and install RStudio Server open a terminal window and execute the commands



**64bit**
Size:  45.3 MB MD5: 124aed894021af4f6aff22c8112e26bd Version:  1.5.9.923 Released:  2018-09-11

```
$ wget https://download3.rstudio.org/centos6.3/x86_64/shiny-server-1.5.9.923-x86_64.rpm`
`$ sudo yum install --nogpgcheck shiny-server-1.5.9.923-x86_64.rpm
```





Next Steps

Once installed, view the 

Administrator’s Guide

 to learn how to manage and configure Shiny Server. Stay up to date on Shiny Server news and software updates by subscribing above.