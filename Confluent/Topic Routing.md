# Topic Routing

Debezium enables you to re-route the emitted change before the message reaches the converter using a single message transformation, or [SMT](https://kafka.apache.org/documentation/#connect_transforms). The SMT provided by Debezium enables you to rewrite the topic and the key according to a regular expression and a replacement pattern, configurable per instance of Debezium.

The implementation does not care about the sanity of the change, this is in the responsibility of the user.

## Use-Cases

### Logical Tables

A logical table consists of one or more physical tables with the same table structure. A common use case is sharding, where for example two physical tables `db_shard1.my_table` and `db_shard2.my_table` together form one logical table.

Typically the physical tables share the same schema.

Normally, Debezium connectors send each change event to a topic that is named by the database and table. But since the sharded tables have the same schema, we’d instead like to re-route each change event to a topic named by the *logical* table name. This way, all changes events for any of the shards all go to the same topic.

What happens if each physical table has a primary key that is only unique within that table? In this case, a row in shard 1 can have the same primary key as a row in shard 2. Since Debezium events are keyed by the columns that make up the primary key, the events for that row in shard 1 would have the same key as the row in shard 2, even though globally they are different rows. So, in addition to changing the topic name, we may also want to *modify the event key* to add a field that makes the key globally unique.

This SMT lets you specify how you want to choose the new topic name and then specify how to modify the change event key to ensure it is globally unique.

## Topic Names

Below is an example for a configuration which replaces a part of the table in the topic with another string, allowing two tables to emit changes to the same topic:

```
transforms=Reroute
transforms.Reroute.type=io.debezium.transforms.ByLogicalTableRouter
transforms.Reroute.topic.regex=(.*)customers_shard(.*)
transforms.Reroute.topic.replacement=$1customers_all_shards
```

The configuration above will match topics such as `myserver.mydb.customers_shard1`, `myserver.mydb.customers_shard2` etc. and replace it with `myserver.mydb.customers_all_shards.`

## Key Fields

To address the concern of uniqueness across all the original tables discussed above, one more field for identifying the original (physical) table is inserted into the key structure of the change events. By default, this field is named `*dbz*physicalTableIdentifier` and has the original topic name as its value.

If needed, another *field name* can be chosen by means of the `key.field.name` property (obviously you’ll want to choose a field name that doesn’t clash with existing primary key fields). For example the following configuration will use the name `shard_id`for the key field:

```
...
transforms.Reroute.key.field.name=shard_id
...
```

The *value* of the field can be adjusted via the `key.field.regex` and `key.field.replacement` properties. The former allows you to define a regular expression that will be applied to the original topic name to capture one or more groups of characters. The latter lets you specify an expression that defines the value for the field in terms of those captured groups. For example:

```
...
transforms.Reroute.key.field.regex=(.*)customers_shard(.*)
transforms.Reroute.key.field.replacement=$2
```

This will apply the given regular expression to original topic names and use the second capturing group as value for the key field. Assuming the source topics are named `myserver.mydb.customers_shard1`, `myserver.mydb.customers_shard2` etc., the key field’s values would be `1`, `2` etc.