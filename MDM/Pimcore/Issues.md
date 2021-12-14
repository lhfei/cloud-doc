


 [ERROR] The following prerequisites failed                                                                             
                                                                                                                        

 * Multibyte String (mbstring) is required. (see http://www.php.net/mbstring)
 * Intl is required. (see http://www.php.net/intl)
 * curl is required. (see http://www.php.net/curl)

```shell
sudo apt install php8.0-mbstring
sudo apt install php8.0-intl
sudo apt install php8.0-curl
```






 [ERROR] The following errors were encountered during installation                                                      
                                                                                                                        

 * Database Charset utf8mb4 is required.
 * WITH RECURSIVE is required.



**/etc/mysql/mysql.conf.d/mysql.cnf**

```
  [client]
  default-character-set=UTF-8
    
  [mysql]
  default-character-set=UTF-8
    
  [mysqld]
  character-set-client-handshake = false #force encoding to uft8
  character-set-server=UTF-8
  collation-server=UTF-8_general_ci
    
  [mysqld_safe]
  default-character-set=UTF-8
```