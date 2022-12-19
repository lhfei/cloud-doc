

```shell
./bin/hz-mc start -Dhazelcast.mc.http.port=10080 &
```



```shell
hz-mc start -Dhazelcast.mc.tls.enabled=true \
    -Dhazelcast.mc.configReplacer.class=com.hazelcast.webmonitor.configreplacer.EncryptionReplacer \ 
    -Dhazelcast.mc.configReplacer.prop.passwordFile=path/to/password \
    -Dhazelcast.mc.configReplacer.prop.passwordUserProperties=false \
    -Dhazelcast.mc.tls.keyStore=mc.keystore \
    -Dhazelcast.mc.tls.keyStorePassword='$ENC{h7kmetFZwh8=:531:dOsG5ezhSZiyBXY5JNx8gg==}' 
```

