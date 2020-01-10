

> bootstrap checks failed

error: [1] bootstrap checks failed

Native controller process has stopped - no new native processes can be started

....

```shel
sudo sysctl -w vm.max_map_count=262144
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

