





```shell
docker-compose -f docker-amundsen.yml ps      
```



```ini
      Name                     Command                State                                               Ports                                           
----------------------------------------------------------------------------------------------------------------------------------------------------------
amundsenfrontend    python3 amundsen_applicati ...   Up        0.0.0.0:5000->5000/tcp,:::5000->5000/tcp                                                   
amundsenmetadata    python3 metadata_service/m ...   Up        0.0.0.0:5002->5002/tcp,:::5002->5002/tcp                                                   
amundsensearch      python3 search_service/sea ...   Exit 1                                                                                               
es_amundsen_atlas   /usr/local/bin/docker-entr ...   Exit 78                                                                                              
neo4j_amundsen      /sbin/tini -g -- /docker-e ...   Up        7473/tcp, 0.0.0.0:7474->7474/tcp,:::7474->7474/tcp,                                        
                                                               0.0.0.0:7687->7687/tcp,:::7687->7687/tcp    
```

