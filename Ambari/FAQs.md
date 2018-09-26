



- [x] error: **cannot open Packages database in /var/lib/rpm**

  This is quite the messy situation. You may fix this by cleaning out rpm database. To fix this problem, try:

  ```sh
  # rm -f /var/lib/rpm/__db*
  # db_verify /var/lib/rpm/Packages
  # rpm --rebuilddb
  # yum clean all
  ```

  Verify that error has gone with the following yum command

  ```sh
  # yum update
  ```



- [x] **Host registration Failed**

```
NetUtil.py:96 - EOF occurred in violation of protocol (_ssl.c:579)
NetUtil.py:97 - SSLError: Failed to connect. Please check openssl library versions.
```

Add this content as below into `security` section:

```
[security]
force_https_protocol=PROTOCOL_TLSv1_2
```

