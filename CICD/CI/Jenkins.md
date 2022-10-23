

# Unlock Jenkins

To ensure Jenkins is securely set up by the administrator, a password has been written to the log ([not sure where to find it?](https://www.jenkins.io/redirect/find-jenkins-logs)) and this file on the server:

```
/root/.jenkins/secrets/initialAdminPassword
```

Please copy the password from either location and paste it below.

```inid

```









```sql
CREATE DATABASE jenkins_master
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;
  
create user 'jenkinsadmin'@"localhost" IDENTIFIED BY 'Jenkinsuser_1473';
create user 'jenkinsadmin'@"%"         IDENTIFIED BY 'Jenkinsuser_1473';

grant all on jenkins_master.* to "jenkinsadmin"@"localhost" with grant option;
grant all on jenkins_master.* to "jenkinsadmin"@"%" with grant option;

FLUSH PRIVILEGES;


ALTER USER 'jenkinsadmin'@'%' IDENTIFIED WITH mysql_native_password BY 'Jenkinsuser_1473';

FLUSH PRIVILEGES;


select host,user,plugin from mysql.user;

+-----------+------------------+-----------------------+
| host      | user             | plugin                |
+-----------+------------------+-----------------------+
| %         | jenkinsadmin     | mysql_native_password |
| localhost | jenkinsadmin     | caching_sha2_password |
| localhost | .........        | caching_sha2_password |
+-----------+------------------+-----------------------+
```

