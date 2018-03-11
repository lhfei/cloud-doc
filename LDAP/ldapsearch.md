```
ldapsearch -x -b "uid=user,ou=people,dc=tuleap,dc=local" -s sub "objectclass=*"
```



```
ldapsearch -x -b dc=jd,dc=com uid=lhfei
```



```
ldapsearch -x -LLL -b dc=jd,dc=com '(&(objectclass=posixAccount)(|(uSNChanged>=0)(modifyTimestamp>=19700101080000Z))(uid=*))'
```

