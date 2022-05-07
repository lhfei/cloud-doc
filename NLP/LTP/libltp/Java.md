### Java Client

#### Requirements

1. Recommend to build  **clang-3.9** on **Ubuntu**.
2. **Gradle** with version 6.7



#### Build

make: cargo: Command not found:

```shell
apt install cargo
```



 --- stderr
  thread 'main' panicked at 'Unable to find libclang: "couldn't find any valid shared libraries matching: ['libclang.so', 'libclang-*.so', 'libclang.so.*', 'libclang-*.so.*'], set the `LIBCLANG_PATH` environment variable to a path where one of these files can be found (invalid: [])"', /root/.cargo/registry/src/github.com-1ecc6299db9ec823/bindgen-0.55.1/src/lib.rs:1896:31
  note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace

```shell
sudo apt-get install clang-3.9
```





```shell
sz -be build/libs/LTP-4.1-SNAPSHOT.jar 
```

