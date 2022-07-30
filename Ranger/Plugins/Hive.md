**Providing Authorization with Apache Ranger**

# Configure a Resource-based Service: Hive

How to add a Hive service.

1. On the Service Manager page, click the Add icon (![img](https://docs.cloudera.com/HDPDocuments/HDP3/HDP-3.1.5/authorization-ranger/reuse-library/images/sec_guimenuitem_accessmanager_plus.png)) next to Hive.

   The Create Service page appears.

   
   ![Ranger > Create Service page.](https://docs.cloudera.com/HDPDocuments/HDP3/HDP-3.1.5/authorization-ranger/how-to/images/sec_service_config_hive.png)

2. Enter the following information on the Create Service page:

   | ***\*Field name\**** | ***\*Description\****                                        |
   | :------------------- | :----------------------------------------------------------- |
   | Service Name         | The name of the service; required when configuring agents.   |
   | Description          | A description of the service.                                |
   | Active Status        | Enabled or Disabled.                                         |
   | Select Tag Service   | Select a tag-based service to apply the service and its tag-based policies to Hive. |

   | ***\*Field name\****        | ***\*Description\****                                        |
   | :-------------------------- | :----------------------------------------------------------- |
   | Username                    | The end system username that can be used for connection.     |
   | Password                    | The password for the username entered above.                 |
   | jdbc.driver ClassName       | The full classname of the driver used for Hive connections. Default: org.apache.hive.jdbc.HiveDriver |
   | jdbc.url                    | The complete connection URL, including port and database name. (Default port: 10000.) For example, on the sandbox, jdbc:hive2://sandbox:10000/. |
   | Common Name For Certificate | The name of the certificate.This field is interchangeably named **Common Name For Certificate** and **Ranger Plugin SSL CName** in Create Service pages. |
   | Add New Configurations      | Add any other new configuration(s).                          |

3. Click **Test Connection**.

4. Click **Add**.

Usually, the Ranger Hive service definition uses the HiveServer2 (HS2) JDBC driver to fetch Hive database/table info for resource lookup and testing the connection. Alternatively, you can configure the service definition to use Hive metastore libraries connecting to the Hive metastore database directly. This is recommended when it is difficult to set up HiveServer2 on your cluster, such as when using HDCloud for AWS.

1. Under Ambari>Hive>Configs>Advanced, edit Hive properties:

2. Add the below properties to

    

   custom ranger-hive-plugin-properties

   :

   `ranger.service.config.param.enable.hive.metastore.lookup = true`

   `ranger.service.config.param.hive.site.file.path = /etc/hive/conf/hive-site.xml`

   ![Custom ranger-hive-plugin-properties.](https://docs.cloudera.com/HDPDocuments/HDP3/HDP-3.1.5/authorization-ranger/how-to/images/sec_hive_service_definition_hive_properties.png)

3. Save and restart required components.

4. To test the configuration is successful, create a new Hive service and specify the `jdbc.url` as "none", then run **Test Connection**.![Ranger > Config Properties, jdbc.url and Test Connection highlighted.](https://docs.cloudera.com/HDPDocuments/HDP3/HDP-3.1.5/authorization-ranger/how-to/images/sec_hive_service_definition_jdbc.png)

**Parent topic:** [Configuring Resource-Based Services](https://docs.cloudera.com/HDPDocuments/HDP3/HDP-3.1.5/authorization-ranger/content/configuring_resource_based_services.html)