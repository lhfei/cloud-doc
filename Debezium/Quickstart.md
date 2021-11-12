





`````````````````````````````````````````shell
# list topics
./bin/kafka-topics --list --bootstrap-server data-thinker-02:9092

````````````````````````````````````````
connect-configs
connect-offsets
connect-statuses
dbzui_django_db
debezium_django_db
debezium_django_db.test_cdc.student
default_ksql_processing_log

````````````````````````````````````````

# receive message
./bin/kafka-avro-console-consumer --bootstrap-server 10.0.0.12:9092  --topic debezium_django_db.test_cdc.student  --from-beginning            
`````````````````````````````````````````

