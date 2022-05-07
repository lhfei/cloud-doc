### Issues

1. Table `DATACONNECTOR` not found

   Modify `service/src/main/java/org/apache/griffin/core/measure/entity/DataConnector.java` class file ,  add `columnDefinition = "TEXT"` on `config` property.

   ```java
   @JsonIgnore
       @Transient
       private String defaultDataUnit = "365000d";
   
       @JsonIgnore
       @Column(length = 20480, columnDefinition = "TEXT")
       private String config;
   
       @Transient
       private Map<String, Object> configMap;
   ```

   Then rebuild from source.

   

2. ...

3. ...

4. ...