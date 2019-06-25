

## Open ports (if using a firewall)

If you're using a firewall or some other system that only allows traffic on specific ports, allow inbound connections on the following:

### Master Server

- 1527 (Derby metadata store; not needed if you are using a separate metadata store like MySQL or PostgreSQL)
- 2181 (ZooKeeper; not needed if you are using a separate ZooKeeper cluster)
- 8081 (Coordinator)
- 8090 (Overlord)

### Data Server

- 8083 (Historical)
- 8091, 8100–8199 (Druid Middle Manager; you may need higher than port 8199 if you have a very high `druid.worker.capacity`)

### Query Server

- 8082 (Broker)
- 8088 (Router, if used)

### Other

- 8200 (Tranquility Server, if used)
- 8084 (Standalone Realtime, if used, deprecated)