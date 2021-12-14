



```sql
CREATE DATABASE cloud_dbeaver
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;
  
CREATE USER 'cloud_dbeaver'@'localhost' IDENTIFIED BY 'DBeaveruser_1473';

GRANT ALL ON cloud_dbeaver.* TO 'cloud_dbeaver'@'%' IDENTIFIED BY 'DBeaveruser_1473';

GRANT ALL ON cloud_dbeaver.* TO 'root'@'%' IDENTIFIED BY 'Lhfeilaile@01';

FLUSH PRIVILEGES;
```



Configuration

```json
{
    server: {
        serverPort: 8978,

        workspaceLocation: "workspace",
        contentRoot: "web",
        driversLocation: "drivers",

        rootURI: "/",
        serviceURI: "/api/",

        productConfiguration: "conf/product.conf",

        expireSessionAfterPeriod: 1800000,

        develMode: false,

        database: {
            driver="mariaDB",
            url: "jdbc:mysql://10.170.234.141/cloud_dbeaver?useSSL=false&characterEncoding=UTF-8",
			user: 'cloud_dbeaver',
			password: 'DBeaveruser_1473',
            createDatabase: true,

            initialDataConfiguration: "conf/initial-data.conf",

            pool: {
                minIdleConnections: 4,
                maxIdleConnections: 10,
                maxConnections: 100,
                validationQuery: "SELECT 1"
            }
        }

    },
    app: {
        anonymousAccessEnabled: true,
        anonymousUserRole: "user",
        supportsCustomConnections: false,

        publicCredentialsSaveEnabled: true,
        adminCredentialsSaveEnabled: true,
        enabledDrivers: [
            "postgresql:postgres-jdbc",
            "mysql:mysql8",
            "mysql:mariaDB",
            "generic:sqlite_jdbc",
            "generic:derby_server",
            "generic:h2_embedded",
            "jaybird:jaybird",
        ]
    }
}
```

