```
ldapsearch -x -b "uid=user,ou=people,dc=tuleap,dc=local" -s sub "objectclass=*"
```



```
ldapsearch -x -b dc=jd,dc=com uid=lhfei

ldapsearch -x -b dc=datalink,dc=cn uid=lhfei -h 127.0.0.1 -p 389   
```



```
ldapsearch -x -LLL -b dc=jd,dc=com '(&(objectclass=posixAccount)(|(uSNChanged>=0)(modifyTimestamp>=19700101080000Z))(uid=*))'
```



- search by *gidNumber*

```
ldapsearch -x -b "ou=People,dc=jd,dc=com" '(&(gidNumber=1000))'
```

