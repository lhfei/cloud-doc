## Install Connector with Confluent Hub

To install a connector by using Confluent Hub, see the [installation instructions](https://docs.confluent.io/current/connect/managing/confluent-hub/client.html#confluent-hub-client).

## Install Connector Manually

Connectors are packaged as [Kafka Connect plugins](https://docs.confluent.io/current/connect/userguide.html#connect-installing-plugins). Kafka Connect isolates each plugin so that the plugin libraries do not conflict with each other.

To manually install a connector:

1. Find your connector on [Confluent Hub](https://www.confluent.io/hub/) and download the connector ZIP file.
2. Extract the ZIP file contents and copy the contents to the desired location. For example, you can create a directory named `<path-to-confluent>/share/kafka/plugins` then copy the connector plugin contents.
3. Add this to the plugin path in your Connect properties file. For example, `plugin.path=/usr/local/share/kafka/plugins`. Kafka Connect finds the plugins using its plugin path. A plugin path is a comma-separated list of directories defined in the [Kafka Connect’s worker configuration](https://docs.confluent.io/current/connect/userguide.html#connect-configuring-workers).
4. Start the Connect workers with that configuration. Connect will discover all connectors defined within those plugins.
5. Repeat these steps for each machine where Connect is running. Each connector must be available on each worker.