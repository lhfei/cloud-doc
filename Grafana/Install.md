

#### Create DB

```sql
CREATE DATABASE grafana
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

CREATE USER 'grafana'@'localhost' IDENTIFIED BY 'Grafana_1473';
GRANT ALL ON grafana.* TO 'grafana'@'%' IDENTIFIED BY 'Grafana_1473';
FLUSH PRIVILEGES;
```



> defaults.ini

```ini
#################################### Database ############################
[database]
# You can configure the database connection by specifying type, host, name, user and password
# as separate properties or as on string using the url property.

# Either "mysql", "postgres" or "sqlite3", it's your choice
type = mysql
host = 192.168.58.130:3306
name = grafana
user = grafana
# If the password contains # or ; you have to wrap it with triple quotes. Ex """#password;"""
password = Grafana_1473
# Use either URL or the previous fields to configure the database
# Example: mysql://user:secret@host:port/database
url = mysql://grafana:Grafana_1473@192.168.58.130:3306/grafana
```



> sample.ini

```ini
#################################### Database ####################################
[database]
# You can configure the database connection by specifying type, host, name, user and password
# as separate properties or as on string using the url properties.

# Either "mysql", "postgres" or "sqlite3", it's your choice
;type = mysql
;host = 192.168.58.130:3306
;name = grafana
;user = grafana
# If the password contains # or ; you have to wrap it with triple quotes. Ex """#password;"""
;password = Grafana_1473

# Use either URL or the previous fields to configure the database
# Example: mysql://user:secret@host:port/database
;url = mysql://grafana:Grafana_1473@192.168.58.130:3306/grafana
```

