





```sh
authserve-a9dedccb:2181,authserve-49d827d8:2181,authserve-a0e40d35:2181
```



> Delete Topic

```sh
./bin/kafka-topics --zookeeper authserve-a9dedccb:2181,authserve-49d827d8:2181,authserve-a0e40d35:2181 --delete --topic pageviews_enriched_r8_r9
```

