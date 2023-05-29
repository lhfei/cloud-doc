

**File Organization**:

```ini
.
├── count.q
├── job.properties
├── start.sh
└── workflow.xml
```



- [x]  workflow.xml

  ```xml
  <workflow-app xmlns="uri:oozie:workflow:0.5" name="count-lineitem-wf">
    <start to="count-lineitem-action" />
    <action name="count-lineitem-action">
      <hive2 xmlns="uri:oozie:hive2-action:0.1">
        <job-tracker>${resourceManager}</job-tracker>
        <name-node>${nameNode}</name-node>
        <prepare>
          <delete path="${jobOutput}"/>
        </prepare>
        <configuration>
          <property>
            <name>mapred.compress.map.output</name>
            <value>true</value>
          </property>
        </configuration>
        <jdbc-url>${jdbcUrl}</jdbc-url>
        <script>count.q</script>
      </hive2>
  
      <ok to ="ok" />
      <error to="fail" />
    </action>
    
    <kill name="fail">
      <message>DistCP failed, error message[${wf:errorMessage(wf:lastErrorNode())}]</message>
    </kill>
    <end name="ok" />
  </workflow-app>
  ```

- [x] job.properties

  ```properties
  nameNode=hdfs://172.19.163.120:8020
  resourceManager=172.19.163.121:8050
  jdbcUrl=jdbc:hive2://172.19.163.134:10000/benchmark
  jobOutput=/export/app_workspaces/oozie_jobs/count_job/count.txt
  
  oozie.wf.application.path=${nameNode}/user/${user.name}/benchmark/count
  ```

- [x] count.q

  ```sql
  SELECT COUNT(*) FROM benchmark.lineitem;
  ```

- [x] start.sh

  ```shell
  #!/bin/sh
  
  ${OOZIE_HOME}/oozie job -run  -config ./job.properties \
    -oozie http://a01-r03-i163-160-515w664.test.local:11000/oozie
  ```



