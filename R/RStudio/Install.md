Download RStudio Server for Red Hat/CentOS

### Prerequisites

RStudio Server requires Red Hat or CentOS version 7 (or higher) as well as an installation of R. You can install R for Red Hat and CentOS using the instructions in [RStudio’s documentation(opens in a new tab)](https://docs.rstudio.com/resources/install-r).

------

### Install for Red Hat / CentOS 7

To download and install RStudio Server open a terminal window and execute the following commands.

Size:  61.21 MB | SHA-256: `a26d8a3e` | Version:  2021.09.1+372| Released:  2021-11-09

```
wget https://download2.rstudio.org/server/centos7/x86_64/rstudio-server-rhel-2021.09.1-372-x86_64.rpm
sudo yum install rstudio-server-rhel-2021.09.1-372-x86_64.rpm
```

You may choose to [verify the build's GPG signature](https://www.rstudio.com/code-signing/) prior to installing it.

------

### Install for Red Hat / CentOS 8

To download and install RStudio Server open a terminal window and execute the following commands.

Size:  61.19 MB | SHA-256: `f4dea10c` | Version:  2021.09.1+372| Released:  2021-11-09

```
wget https://download2.rstudio.org/server/centos8/x86_64/rstudio-server-rhel-2021.09.1-372-x86_64.rpm
sudo yum install rstudio-server-rhel-2021.09.1-372-x86_64.rpm
```

You may choose to [verify the build's GPG signature](https://www.rstudio.com/code-signing/) prior to installing it.





#### Configuration

Setting rserver conf: `/etc/rstudio/rserver.conf`

```ini
# Server Configuration File

# default web port: 8787
www-port = 8787
rsession-which-r=/usr/bin/R
auth-timeout-minutes=0
auth-stay-signed-in-days=30
```

