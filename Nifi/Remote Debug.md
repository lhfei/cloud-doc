# Enable Remote Debug with IDEA 



### Prerequisites



- [x] Enable Development model

In order to enable remote debugging for NiFI, we need to edit the bootstrap configuration located here:

```ini
# Enable Remote Debugging
# java.arg.debug=-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=8000
```

Open this file in your text editor of choice and **uncomment** this line:

```
# Enable Remote Debugging
java.arg.debug=-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=8000
```



### 1.Select the "run" menu, and choose "edit configuration".

![](C:/Users/lihefei/Desktop/cloud-doc/Nifi/images/debug-add-confg.png)



### 2.Select the Remote Tab, and click on the plus sign to add a new configuration.

![](C:/Users/lihefei/Desktop/cloud-doc/Drill/images/debug-edit-confg.png)





## 3.Click OK, and your IDE configuration is now complete.

Start Debug "QueryResource" :

![](C:/Users/lihefei/Desktop/cloud-doc/Drill/images/debug-start-debug.png)



### 4. Submit a query

![](C:/Users/lihefei/Desktop/cloud-doc/Drill/images/debug-edit-query.png)

### 5. Debug query 

![](C:/Users/lihefei/Desktop/cloud-doc/Drill/images/debug-debug-query.png)

