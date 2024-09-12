

### Create env

```shell
conda create -n xinf python==3.11
```



### Install Xinference

```shell
pip install "xinference[all]"
```



- #### Transformers Backend

  ```shell
  pip install "xinference[transformers]"
  ```

  

- ...



### Start

```shell
xinference-local --host 0.0.0.0 --port 15277
```

