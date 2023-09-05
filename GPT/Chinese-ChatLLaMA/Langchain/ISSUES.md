### 1 CXXABI_1.3.9

```ini
/lib64/libstdc++.so.6: version `CXXABI_1.3.9' not found (required by............)
```



```shell
cd /usr/lib64
rm -rf libstdc++.so.6
```



```shell
cp /export/anaconda3/lib/libstdc++.so.6.0.29 ./

ln -s libstdc++.so.6.0.29 libstdc++.so.6
```

