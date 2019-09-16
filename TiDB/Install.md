## Standalone Install Guide

### Download the official binary package

```
# Download the package.
$ wget http://download.pingcap.org/tidb-latest-linux-amd64.tar.gz
$ wget http://download.pingcap.org/tidb-latest-linux-amd64.sha256

# Check the file integrity. If the result is OK, the file is correct.
$ sha256sum -c tidb-latest-linux-amd64.sha256

# Extract the package.
$ tar -xzf tidb-latest-linux-amd64.tar.gz
$ cd tidb-latest-linux-amd64
```

### Start

Follow the steps below to start PD, TiKV and TiDB:

1. Start PD.

   ```bash
   $ ./bin/pd-server --data-dir=pd \
                   --log-file=pd.log &
   ```

2. Start TiKV.

   ```bash
   $ ./bin/tikv-server --pd="127.0.0.1:2379" \
                     --data-dir=tikv \
                     --log-file=tikv.log &
   ```

3. Start TiDB.

   ```bash
   $ ./bin/tidb-server --store=tikv \
                     --path="127.0.0.1:2379" \
                     --log-file=tidb.log &
   ```

4. Use the MySQL client to connect to TiDB.

   ```sh
   $ mysql -h 127.0.0.1 -P 4000 -u root -D test
   ```

