

### Rest Passwd

```sql
>mysqladmin password -u root -p
Enter password: [Lhfei@Root0158!$&#]
New password: [Lhfei@Root0158!$&#]
Confirm new password: 
Warning: Since password will be sent to server in plain text, use ssl connection to ensure password safety.
```



#### Enable Remote Connection

```sql
GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY 'Lhfei@01';
Databankuser_1473
FLUSH PRIVILEGES;
```

