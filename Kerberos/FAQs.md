# FAQs





```
kinit: Password incorrect while getting initial credentials
```



- add dn.service.keytab

```
addprinc -randkey dn/a01-r03-i164-122-515w9cd.test.local@POLARIS.TESTD.COM
xst -norandkey -k dn.service.keytab dn/a01-r03-i164-122-515w9cd.test.local@POLARIS.TESTD.COM
```

- add nm.service.keytab

```
addprinc -randkey nm/a01-r03-i164-122-515w9cd.test.local@POLARIS.TESTD.COM
xst -norandkey -k nm.service.keytab nm/a01-r03-i164-122-515w9cd.test.local@POLARIS.TESTD.COM
```

- add HTTP

```
addprinc -randkey HTTP/a01-r03-i164-122-515w9cd.test.local@POLARIS.TESTD.COM
```





hive/a01-r03-i164-157-515w8ey.test.local@POLARIS.TESTD.COM



```verilog
kadmin: Missing parameters in krb5.conf required for kadmin client while initializing kadmin interface
```







```
Error message: org.apache.ambari.server.controller.spi.SystemException: An internal system exception occurred: Unexpected error condition executing the kadmin command. STDERR: kadmin: Communication failure with server while initializing kadmin interface
```

