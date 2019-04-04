# Enable Remote Debug with IDEA 



### Prerequisites



- [x] Enable Development model

```sh
# add the following lines below to the end of ${DRILL_HOME}/conf/drill-env.sh
export DRILLBIT_JAVA_OPTS="$DRILLBIT_JAVA_OPTS -Xdebug -Xnoagent -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8000"
```



### 1.Select the "run" menu, and choose "edit configuration".

![](images/debug-add-confg.png)



### 2.Select the Remote Tab, and click on the plus sign to add a new configuration.

![](images/debug-edit-confg.png)





## 3.Click OK, and your IDE configuration is now complete.

Start Debug "QueryResource" :

![](images/debug-start-debug.png)



### 4. Submit a query

![](images/debug-edit-query.png)

### 5. Debug query 

![](images/debug-debug-query.png)

