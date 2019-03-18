# CDC Event Flattening

|      | This SMT is available since Debezium version 0.6.0. |
| ---- | --------------------------------------------------- |
|      |                                                     |

|      | This SMT is supported only for the SQL database connectors, it does not work with the MongoDB connector. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

Debezium generates a data change in a form of a complex message structure. The message consists of three parts:

- operation and metadata
- the row data before change
- the row data after change

E.g. the general message structure for an `update` change looks like this:

```json
{
	"op": "u",
	"source": {
		...
	},
	"ts_ms" : "...",
	"before" : {
		"field1" : "oldvalue1",
		"field2" : "oldvalue2"
	},
	"after" : {
		"field1" : "newvalue1",
		"field2" : "newvalue2"
	}
}
```

More details about the message structure are provided in [the documentation for each connector](https://debezium.io/docs/connectors).

This format allows the user to get most information about changes happening in the system. The downside of using the complex format is that other connectors or other parts of the Kafka ecosystem usually expect the data in a simple message format that can generally be described like so:

```json
{
	"field1" : "newvalue1",
	"field2" : "newvalue2"
}
```

Debezium provides [a single message transformation](https://kafka.apache.org/documentation/#connect_transforms) that crosses the bridge between the complex and simple formats, the [UnwrapFromEnvelope](https://github.com/debezium/debezium/blob/master/debezium-core/src/main/java/io/debezium/transforms/UnwrapFromEnvelope.java) SMT.

The SMT provides two main functions. It

- extracts the `after` field from change events and replaces the original event just with this part
- optionally filters delete and tombstone records, as per the capabilities and requirements of downstream consumers

The SMT can be applied either to a source connector (Debezium) or a sink connector. We generally recommend to apply the transformation on the sink side as it means that the messages stored in Apache Kafka will contain the whole context. The final decision depends on use case for each user.

## Configuration

The configuration is a part of source/sink task connector and is expressed in a set of properties:

```
transforms=unwrap,...
transforms.unwrap.type=io.debezium.transforms.UnwrapFromEnvelope
transforms.unwrap.drop.tombstones=false
```

### Record filtering for delete records

The SMT provides a special handling for events that signals `delete` operation. When a `DELETE` is executed on a datasource then Debezium generates two records:

- a record with `d` operation that contains only old row data
- a record with `null` value and the same key. This record serves as a tombstone marker for Apache Kafka for [a log compaction process](https://kafka.apache.org/documentation/#compaction).

Upon processing these two records, the SMT turns the `d` record into another tombstone. The user can configure if both records, only one of them or none is filtered out.

|      | SMT by default filters out **BOTH** delete records as the widely used sink connectors like JDBC and Elasticsearch do not support handling of tombstone records. |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

## Configuration options

| Property               | Default | Description                                                  |
| ---------------------- | ------- | ------------------------------------------------------------ |
| `delete.handling.mode` | `drop`  | The SMT can `drop`, `rewrite` or pass record (`none`). Rewrite mode will add `__deleted` column with true/false values based on record operation. |