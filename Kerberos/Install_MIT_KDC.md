



#### []()(Optional) Install a new MIT KDC

The following gives a very high level description of the KDC installation process. To get more information see specific Operating Systems documentation, such as [RHEL documentation](https://www.google.com/url?q=https%3A%2F%2Faccess.redhat.com%2Fknowledge%2Fdocs%2Fen-US%2FRed_Hat_Enterprise_Linux%2F6%2Fhtml%2FManaging_Smart_Cards%2Finstalling-kerberos.html&sa=D&sntz=1&usg=AFQjCNFw2D_K9FlzrLPGPjnIqDvIfSsZXg), [CentOS documentation](https://www.centos.org/docs/5/html/5.2/Deployment_Guide/s1-kerberos-server.html), or [SLES documentation](https://www.suse.com/documentation/suse91/suselinux-adminguide/html/ch18s04.html).

| ![[Note]](https://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.6.3/bk_security/common/images/admon/note.png) | Note |
| ---------------------------------------- | ---- |
| Because Kerberos is a time-sensitive protocol, all hosts in the realm must be time-synchronized, for example, by using the Network Time Protocol (NTP). If the local system time of a client differs from that of the KDC by as little as 5 minutes (the default), the client will not be able to authenticate. |      |

**Install the KDC Server**

1. Install a new version of the KDC server:

   **RHEL/CentOS/Oracle Linux**

   ```
   yum install krb5-server krb5-libs krb5-workstation pam_krb5
   ```

   **SLES**

   `zypper install krb5 krb5-server krb5-client`

   **Ubuntu/Debian**

   ​

   ```
   apt-get install krb5-kdc krb5-admin-server pam_krb5
   ```

   ​

2. Using a text editor, open the KDC server configuration file, located by default here:

   ```
   vi /etc/krb5.conf
   ```

   ​

3. Change the [realms] section of this file by replacing the default “kerberos.example.com” setting for the kdc and admin_server properties with the Fully Qualified Domain Name of the KDC server host. In the following example, “kerberos.example.com” has been replaced with “my.kdc.server”.

   ```ini
   [libdefaults]
    dns_lookup_realm = false
    ticket_lifetime = 24h
    renew_lifetime = 7d
    forwardable = true
    rdns = false
    default_realm = POLARIS.XX.COM
    default_ccache_name = KEYRING:persistent:%{uid}

   [realms]
    POLARIS.XX.COM = {
     kdc = A01-R03-I164-154-515W92J.XX.LOCAL
     admin_server = A01-R03-I164-154-515W92J.XX.LOCAL
    }
   ```

| ![[Note]](https://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.6.3/bk_security/common/images/admon/note.png) | Note |
| ---------------------------------------- | ---- |
| For Ubuntu/Debian, the setup of the default realm for the KDC and KDC Admin hostnames is performed during the KDC server install. You can re-run setup using dpkg-reconfigure krb5-kdc. Therefore, Steps 2 and 3 above are not needed for Ubuntu/Debian. |      |

**Create the Kerberos Database**

- Use the utility kdb5_util to create the Kerberos database.

  **RHEL/CentOS/Oracle Linux**

  ```
  kdb5_util create -s -r POLARIS.XX.COM

  Loading random data
  Initializing database '/var/kerberos/krb5kdc/principal' for realm 'POLARIS.XX.COM',
  master key name 'K/M@POLARIS.XX.COM'
  You will be prompted for the database Master Password.
  It is important that you NOT FORGET this password.
  Enter KDC database master key: Polaris@Root#01
  Re-enter KDC database master key to verify: Polaris@Root#01
  ```

  ```shell
  [root@a01-r03-i164-154-515w92j yum.repos.d]# ls -ahl /var/kerberos/krb5kdc/
  total 28K
  drwxr-xr-x  2 root root  146 Dec 28 17:15 .
  drwxr-xr-x. 4 root root   31 Dec 28 16:48 ..
  -rw-------  1 root root   79 Dec 28 17:15 .k5.POLARIS.XX.COM
  -rw-------  1 root root   22 Apr 29  2017 kadm5.acl
  -rw-------  1 root root  451 Apr 29  2017 kdc.conf
  -rw-------  1 root root 8.0K Dec 28 17:15 principal
  -rw-------  1 root root 8.0K Dec 28 17:15 principal.kadm5
  -rw-------  1 root root    0 Dec 28 17:15 principal.kadm5.lock
  -rw-------  1 root root    0 Dec 28 17:15 principal.ok
  ```

  ​

  ```shell
  vi /var/kerberos/krb5kdc/kadm5.acl
   
   */admin@POLARIS.XX.COM  *
  ```

  ​

  ```shell
  systemctl start krb5kdc.service 
  systemctl start kadmin.service 
  systemctl enable krb5kdc.service 
    Created symlink from /etc/systemd/system/multi-user.target.wants/krb5kdc.service to /usr/lib/systemd/system/krb5kdc.service.
  systemctl enable kadmin.service 
    Created symlink from /etc/systemd/system/multi-user.target.wants/kadmin.service to /usr/lib/systemd/system/kadmin.service.
  ```

  ​	

  ​

  ```shell
  kadmin.local:  addprinc  admin/admin@POLARIS.XX.COM
  WARNING: no policy specified for admin/admin@POLARIS.XX.COM; defaulting to no policy
  Enter password for principal "admin/admin@POLARIS.XX.COM": Polaris@Root#01
  Re-enter password for principal "admin/admin@POLARIS.XX.COM": Polaris@Root#01
  add_principal: Principal or policy already exists while creating "admin/admin@POLARIS.XX.COM".
  ```

  ​

  ​	

  ```shell
  vi /etc/ssh/ssh_config

  	# Unconment under line
      GSSAPIAuthentication yes
      GSSAPIDelegateCredentials yes
      
      
  authconfig --enablekrb5 --update
  ```

  ​

  ​

  ​

  ```shell
  [root@a01-r03-i164-154-515w92j krb5kdc]# kinit admin/admin
  Password for admin/admin@POLARIS.XX.COM: 
  [root@a01-r03-i164-154-515w92j krb5kdc]# klist 
  Ticket cache: KEYRING:persistent:0:0
  Default principal: admin/admin@POLARIS.XX.COM

  Valid starting       Expires              Service principal
  12/28/2017 18:50:14  12/29/2017 18:50:14  krbtgt/POLARIS.XX.COM@POLARIS.XX.COM
  ```


  

**Very Important**

```
klist -ket /etc/security/keytabs/hive.service.keytab 

Keytab name: FILE:/etc/security/keytabs/hive.service.keytab
KVNO Timestamp           Principal
---- ------------------- ------------------------------------------------------
   4 01/19/2018 16:45:51 hive/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM (arcfour-hmac) 
   4 01/19/2018 16:45:51 hive/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM (aes128-cts-hmac-sha1-96) 
   4 01/19/2018 16:45:51 hive/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM (aes256-cts-hmac-sha1-96) 
   4 01/19/2018 16:45:51 hive/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM (des3-cbc-sha1) 
   4 01/19/2018 16:45:51 hive/a01-r03-i164-157-515w8ey.xx.local@POLARIS.xx.COM (des-cbc-md5) 
```



```
kinit username@ADS.IU.EDU -k -t /etc/security/keytabs/{user-server.keytab}

$ kinit hive/a01-r03-i164-157-515w8ey.jd.local@POLARIS.JD.COM -k -t /etc/security/keytabs/hive.service.keytab 
```

*kinit hive/openldap.xx.com@POLARIS.xx.COM -k -t /etc/security/keytabs/hive.service.keytab*



```shell
[root@a01-r03-i164-154-515w92j krb5kdc]# kadmin -p admin/admin -q "getprinc admin/admin"

  Authenticating as principal admin/admin with password.

  Password for admin/admin@POLARIS.xx.COM: 

  Principal: admin/admin@POLARIS.xx.COM

  Expiration date: [never]

  Last password change: Thu Dec 28 18:25:58 CST 2017

  Password expiration date: [never]

  Maximum ticket life: 1 day 00:00:00

  Maximum renewable life: 0 days 00:00:00

  Last modified: Thu Dec 28 18:25:58 CST 2017 (admin/admin@POLARIS.xx.COM)

  Last successful authentication: [never]

  Last failed authentication: [never]

  Failed password attempts: 0

  Number of keys: 2

  Key: vno 1, aes256-cts-hmac-sha1-96

  Key: vno 1, aes128-cts-hmac-sha1-96

  MKey: vno 1

  Attributes:

  Policy: [none]

```



  ```

  - Remove DB

  ```shell
  kdb5_util -r {REAL_NAME} destroy
  Deleting KDC database stored in '/var/kerberos/krb5kdc/principal', are you sure?
  (type 'yes' to confirm)? yes
  OK, deleting database '/var/kerberos/krb5kdc/principal'...
  ** Database '/var/kerberos/krb5kdc/principal' destroyed.
  ```

  - Check Principal List

  ```shell
  [root@BDS-TEST-004 ~]# kadmin.local 
  Authenticating as principal root/admin@JD.LOCAL with password.
  kadmin.local:  listprincs
  K/M@JD.LOCAL
  kadmin/admin@JD.LOCAL
  kadmin/bds-test-004@JD.LOCAL
  kadmin/changepw@JD.LOCAL
  krbtgt/JD.LOCAL@JD.LOCAL
  kadmin.local:  
  ```


  Add Principal

```shell
[root@BDS-TEST-004 ~]# kadmin.local 
Authenticating as principal root/admin@JD.LOCAL with password.
kadmin.local:  addprinc admin/admin@BDS-TEST-004.xx.LOCAL
WARNING: no policy specified for admin/admin@BDS-TEST-004.xx.LOCAL; defaulting to no policy
Enter password for principal "admin/admin@BDS-TEST-004.xx.LOCAL": hadoop
Re-enter password for principal "admin/admin@BDS-TEST-004.xx.LOCAL": hadoop
Principal "admin/admin@BDS-TEST-004.xx.LOCAL" created.
```

Delete Principal

```
delprinc lhfei/a01-r03-i164-156-515w9ay.jd.local@POLARIS.JD.COM
```



Service Principals

| Service             | Component                                | Mandatory Principal Name |
| ------------------- | ---------------------------------------- | ------------------------ |
| HDFS                | NameNode                                 | nn/$FQDN                 |
| HDFS                | NameNode HTTP                            | HTTP/$FQDN               |
| HDFS                | SecondaryNameNode                        | nn/$FQDN                 |
| HDFS                | SecondaryNameNode HTTP                   | HTTP/$FQDN               |
| HDFS                | DataNode                                 | dn/$FQDN                 |
| MR2                 | History Server                           | jhs/$FQDN                |
| MR2                 | History Server HTTP                      | HTTP/$FQDN               |
| YARN                | ResourceManager                          | rm/$FQDN                 |
| YARN                | NodeManager                              | nm/$FQDN                 |
| Oozie               | Oozie Server                             | oozie/$FQDN              |
| Oozie               | Oozie HTTP                               | HTTP/$FQDN               |
| Hive                | Hive MetastoreHiveServer2                | hive/$FQDN               |
| Hive                | WebHCat                                  | HTTP/$FQDN               |
| HBase               | MasterServer                             | hbase/$FQDN              |
| HBase               | RegionServer                             | hbase/$FQDN              |
| Storm               | Nimbus serverDRPC daemon                 | nimbus/$FQDN **          |
| Storm               | Storm UI daemonStorm Logviewer daemonNodes running process controller (such as Supervisor) | storm/$FQDN **           |
| Kafka               | KafkaServer                              | kafka/$FQDN              |
| Zeppelin            | Zeppelin Server                          | zeppelin/*$FQDN*         |
| Hue                 | Hue Interface                            | hue/$FQDN                |
| ZooKeeper           | ZooKeeper                                | zookeeper/$FQDN          |
| JournalNode Server* | JournalNode                              | jn/$FQDN                 |
| Gateway             | Knox                                     | knox/$FQDN               |



Service Keytab File Names

| Component                 | Principal Name   | Mandatory Keytab File Name      |
| ------------------------- | ---------------- | ------------------------------- |
| NameNode                  | nn/$FQDN         | nn.service.keytab               |
| NameNode HTTP             | HTTP/$FQDN       | spnego.service.keytab           |
| SecondaryNameNode         | nn/$FQDN         | nn.service.keytab               |
| SecondaryNameNode HTTP    | HTTP/$FQDN       | spnego.service.keytab           |
| DataNode                  | dn/$FQDN         | dn.service.keytab               |
| MR2 History Server        | jhs/$FQDN        | nm.service.keytab               |
| MR2 History Server HTTP   | HTTP/$FQDN       | spnego.service.keytab           |
| YARN                      | rm/$FQDN         | rm.service.keytab               |
| YARN                      | nm/$FQDN         | nm.service.keytab               |
| Oozie Server              | oozie/$FQDN      | oozie.service.keytab            |
| Oozie HTTP                | HTTP/$FQDN       | spnego.service.keytab           |
| Hive MetastoreHiveServer2 | hive/$FQDN       | hive.service.keytab             |
| WebHCat                   | HTTP/$FQDN       | spnego.service.keytab           |
| HBase Master Server       | hbase/$FQDN      | hbase.service.keytab            |
| HBase RegionServer        | hbase/$FQDN      | hbase.service.keytab            |
| Storm                     | storm/$FQDN      | storm.service.keytab            |
| Kafka                     | kafka/$FQDN      | kafka.service.keytab            |
| Zeppelin Server           | zeppelin/*$FQDN* | zeppelin.server.kerberos.keytab |
| Hue                       | hue/$FQDN        | hue.service.keytab              |
| ZooKeeper                 | zookeeper/$FQDN  | zk.service.keytab               |
| Journal Server*           | jn/$FQDN         | jn.service.keytab               |
| Knox Gateway**            | knox/$FQDN       | knox.service.keytab             |




  **SLES**

  `kdb5_util create -s`

  **Ubuntu/Debian**

  `krb5_newrealm`

**Start the KDC**

- Start the KDC server and the KDC admin server.

  **RHEL/CentOS/Oracle Linux 6**

  `/etc/rc.d/init.d/krb5kdc start`

  `/etc/rc.d/init.d/kadmin start`

  **RHEL/CentOS/Oracle Linux 7**

  `systemctl start krb5kdc`

  `systemctl start kadmin`

  **SLES**

  `rckrb5kdc start`

  `rckadmind start`

  **Ubuntu/Debian**

  `service krb5-kdc restart`

  `service krb5-admin-server restart`

  | ![[Important]](https://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.6.3/bk_security/common/images/admon/important.png) | Important |
  | ---------------------------------------- | --------- |
  | When installing and managing your own MIT KDC, it is **very important** to **set up the KDC server to auto-start on boot**. For example:**RHEL/CentOS/Oracle Linux 6**`chkconfig krb5kdc on``chkconfig kadmin on`**RHEL/CentOS/Oracle Linux 7**`systemctl enable krb5kdc``systemctl enable kadmin`**SLES**`chkconfig rckrb5kdc on``chkconfig rckadmind on`**Ubuntu/Debian**`update-rc.d krb5-kdc defaults``update-rc.d krb5-admin-server defaults` |           |

**Create a Kerberos Admin**

Kerberos principals can be created either on the KDC machine itself or through the network, using an “admin” principal. The following instructions assume you are using the KDC machine and using the `kadmin.local` command line administration utility. Using `kadmin.local` on the KDC machine allows you to create principals without needing to create a separate "admin" principal before you start.

| ![[Note]](https://docs.hortonworks.com/HDPDocuments/HDP2/HDP-2.6.3/bk_security/common/images/admon/note.png) | Note |
| ---------------------------------------- | ---- |
| You will need to provide these admin account credentials to Ambari when enabling Kerberos. This allows Ambari to connect to the KDC, create the cluster principals and generate the keytabs. |      |

1. Create a KDC admin by creating an admin principal.

   `kadmin.local -q "addprinc admin/admin"`

2. Confirm that this admin principal has permissions in the KDC ACL. Using a text editor, open the KDC ACL file:

   **RHEL/CentOS/Oracle Linux**

   `vi /var/kerberos/krb5kdc/kadm5.acl`

   **SLES**

   `vi /var/lib/kerberos/krb5kdc/kadm5.acl`

   **Ubuntu/Debian**

   `vi /etc/krb5kdc/kadm5.acl`

3. Ensure that the KDC ACL file includes an entry so to allow the admin principal to administer the KDC for your specific realm. When using a realm that is different than EXAMPLE.COM, **be sure there is an entry for the realm you are using**. If not present, principal creation will fail. For example, for an admin/admin@HADOOP.COM principal, you should have an entry:

   `*/admin@HADOOP.COM *`

4. After editing and saving the kadm5.acl file, you must restart the kadmin process.

   **RHEL/CentOS/Oracle Linux 6**

   `/etc/rc.d/init.d/kadmin restart`

   **RHEL/CentOS/Oracle Linux 7**

   `systemctl restart kadmin`

   **SLES**

   `rckadmind restart`

   **Ubuntu/Debian**

   `service krb5-admin-server restart`

