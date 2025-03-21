



confluent: A command line interface to manage Confluent services

Usage: confluent <command> [<subcommand>] [<parameters>]

These are the available commands:

```ini
acl         Specify acl for a service.
config      Configure a connector.
consume     Consume data from topics
current     Get the path of the data and logs of the services managed by the current confluent run.
            Override default setting with "CONFLUENT_CURRENT" environment variable.
demo        Run demos provided in GitHub repo https://github.com/confluentinc/examples
destroy     Delete the data and logs of the current confluent run.
list        List available services.
load        Load a connector.
log         Read or tail the log of a service.
produce     Produce data to topics
start       Start all services or a specific service along with its dependencies
status      Get the status of all services or the status of a specific service along with its dependencies.
stop        Stop all services or a specific service along with the services depending on it.
top         Track resource usage of a service.
unload      Unload a connector.
version     Print the Confluent Platform flavor and version or the individual version of a service.
```

'confluent help' lists available commands. See 'confluent help <command>' to read about a
specific command.