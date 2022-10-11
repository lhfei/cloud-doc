### Prepare

```shell
# To create a user, login as root
useradd datalink

# Add password
echo "datalink" | passwd --stdin datalink

# Configure sudo without password
sed -i '$adatalink  ALL=(ALL)  NOPASSWD: NOPASSWD: ALL' /etc/sudoers
sed -i 's/Defaults    requirett/#Defaults    requirett/g' /etc/sudoers

# Modify directory permissions and grant permissions for user you created above
chown -R datalink:datalink /export/cloud/datalink-pipeline-3.0.0
```



### DB

```sql
CREATE DATABASE dlink_pipeline
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

CREATE USER 'pipeline_admin'@'localhost' IDENTIFIED BY 'Pipelineuser_1473';

GRANT ALL ON dlink_pipeline.* TO 'pipeline_admin'@'%' IDENTIFIED BY 'Pipelineuser_1473';

FLUSH PRIVILEGES;
```

