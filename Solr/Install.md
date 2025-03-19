

### Install

1. Extract the install script file to your desired location (adjust the Solr version number to the one you are using):

   ```shell
   tar xzf solr-9.7.0.tgz solr-9.7.0/bin/install_solr_service.sh --strip-components=2
   ```

   

2. Run the installation script as `root`:

   ```shell
   sudo bash ./install_solr_service.sh solr-9.7.0.tgz -d /export/var/solr -i /export/cloud
   ./install_solr_service.sh solr-9.7.0.tgz -d /export/var/solr -i /export/cloud/
   ```

   `install_solr_service` supported options as below:

   ```ini
   Supported OPTIONS include:
   
       -d     Directory for live / writable Solr files, such as logs, pid files, and index data; defaults to /var/solr
   
       -i     Directory to extract the Solr installation archive; defaults to /opt/
                The specified path must exist prior to using this script.
   
       -p     Port Solr should bind to; default is 8983
   
       -s     Service name; defaults to solr
   
       -u     User to own the Solr files and run the Solr process as; defaults to solr
                This script will create the specified user account if it does not exist.
   
       -f     Upgrade Solr. Overwrite symlink and init script of previous installation.
   
       -n     Do not start Solr service after install, and do not abort on missing Java
   ```

   

3. start

   Default env file in `/etc/default/solr.in.sh `

   ```shell
   cd ${SOLR_HOME}
   
   sudo service solr start
   ```

   

4. ..

5. ..



```shell
# make sure have root privileges
sudo vi /etc/security/limits.conf

# then append a new line as below
* hard nofile 65535
* soft nofile 65535
* hard nproc 65535
* soft nproc 65535
```



```shell
vi /etc/security/limits.d/20-nproc.conf 

*          soft    nproc     65536
root       soft    nproc     unlimited
```



```shell
vi /etc/systemd/system.conf

DefaultLimitNOFILE=65000
DefaultLimitNPROC=65000
```



```shell
systemctl daemon-reload

```



### Options

```ini
Usage: solr COMMAND OPTIONS
       where COMMAND is one of: start, stop, restart, status, healthcheck, create, delete, version, zk, auth, assert, config, export, api, package, post
```

