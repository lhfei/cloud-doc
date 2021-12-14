> max file descriptors [4096]

max file descriptors [4096] for elasticsearch process is too low, increase to at least [65535]

```shell
# make sure have root privileges
sudo vim /etc/security/limits.conf

# then append a new line as below
* hard nofile 65536
* soft nofile 65536
```



> bootstrap checks failed

error: [1] bootstrap checks failed

Native controller process has stopped - no new native processes can be started

....

```shel
sudo sysctl -w vm.max_map_count=262144

sudo sysctl -w vm.max_map_count=655360
```

or:

```shell
sudo vi /etc/sysctl.conf 

# then append a new line as below
vm.max_map_count=655360

# exit vi mode, and restart 'sysctl'
sudo sysctl -p
```



> [gc][107] overhead, spent [537ms] collecting in the last [1s]

[gc][107] overhead, spent [537ms] collecting in the last [1s]

