



```shell
echo "CKANRoot@01" | sha256sum
0ea46340f3138099f51e03a5c52eddeae807771ea3940e7ad75278a8659fddf8  -


echo "CKANRoot01" | sha256sum
778aab3728656224f5fe1ce3980fc720714121293e699bb4a750cca89405cb0e  -
```





> /etc/redis.conf

```shell
sudo vi /etc/redis.conf

requirepass 0ea46340f3138099f51e03a5c52eddeae807771ea3940e7ad75278a8659fddf8
```

