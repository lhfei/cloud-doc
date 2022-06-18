

### -getnkeypair

```shell
keytool -genkeypair -dname "cn=myname, ou=mygroup, o=mycompany, c=mycountry"
    -alias business -keypass password
    -keystore /working/mykeystore
    -storepass passwd -validity 360
```



### -exportcert

```shell
keytool -exportcert -keystore thekeystore -storepass DataLink -alias thekeystore -file thekeystore.cer -rfc
```





### -importcert

```shell
keytool -importcert -trustcacerts -file DCmyname.cer
```

```shell
keytool -importcert -noprompt -storepass DataLink -alias cas -file cas.cer -storetype PKCS12
```

