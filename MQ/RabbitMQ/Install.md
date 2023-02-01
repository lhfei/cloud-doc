

### Ubuntu

```shell
#!/usr/bin/sh

sudo apt-get install curl gnupg apt-transport-https -y

## Team RabbitMQ's main signing key
curl -1sLf "https://keys.openpgp.org/vks/v1/by-fingerprint/0A9AF2115F4687BD29803A206B73A36E6026DFCA" | sudo gpg --dearmor | sudo tee /usr/share/keyrings/com.rabbitmq.team.gpg > /dev/null
## Launchpad PPA that provides modern Erlang releases
curl -1sLf "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xf77f1eda57ebb1cc" | sudo gpg --dearmor | sudo tee /usr/share/keyrings/net.launchpad.ppa.rabbitmq.erlang.gpg > /dev/null
## PackageCloud RabbitMQ repository
curl -1sLf "https://packagecloud.io/rabbitmq/rabbitmq-server/gpgkey" | sudo gpg --dearmor | sudo tee /usr/share/keyrings/io.packagecloud.rabbitmq.gpg > /dev/null

## Add apt repositories maintained by Team RabbitMQ
sudo tee /etc/apt/sources.list.d/rabbitmq.list <<EOF
## Provides modern Erlang/OTP releases
##
## "bionic" as distribution name should work for any reasonably recent Ubuntu or Debian release.
## See the release to distribution mapping table in RabbitMQ doc guides to learn more.
deb [signed-by=/usr/share/keyrings/net.launchpad.ppa.rabbitmq.erlang.gpg] http://ppa.launchpad.net/rabbitmq/rabbitmq-erlang/ubuntu bionic main
deb-src [signed-by=/usr/share/keyrings/net.launchpad.ppa.rabbitmq.erlang.gpg] http://ppa.launchpad.net/rabbitmq/rabbitmq-erlang/ubuntu bionic main

## Provides RabbitMQ
##
## "bionic" as distribution name should work for any reasonably recent Ubuntu or Debian release.
## See the release to distribution mapping table in RabbitMQ doc guides to learn more.
deb [signed-by=/usr/share/keyrings/io.packagecloud.rabbitmq.gpg] https://packagecloud.io/rabbitmq/rabbitmq-server/ubuntu/ bionic main
deb-src [signed-by=/usr/share/keyrings/io.packagecloud.rabbitmq.gpg] https://packagecloud.io/rabbitmq/rabbitmq-server/ubuntu/ bionic main
EOF

## Update package indices
sudo apt-get update -y

## Install Erlang packages
sudo apt-get install -y erlang-base \
                        erlang-asn1 erlang-crypto erlang-eldap erlang-ftp erlang-inets \
                        erlang-mnesia erlang-os-mon erlang-parsetools erlang-public-key \
                        erlang-runtime-tools erlang-snmp erlang-ssl \
                        erlang-syntax-tools erlang-tftp erlang-tools erlang-xmerl

## Install rabbitmq-server and its dependencies
sudo apt-get install rabbitmq-server -y --fix-missing
```



If all went well, you should see a rabbitmq-server process up and running:

```bash
systemctl status rabbitmq-server
```

![rabbitmq-server status](https://www.cherryservers.com/v3/assets/blog/2022-08-30/06.png)

Congrats, you have now successfully installed RabbitMQ! It’s now time to learn to use it.

### [#](https://www.cherryservers.com/blog/how-to-install-and-start-using-rabbitmq-on-ubuntu-22-04#step-2-enable-rabbitmq-management-console)Step 2: Enable RabbitMQ Management Console

RabbitMQ has a Management Console plugin that allows you to perform various management and monitoring tasks via a web-based interface. You can manage exchanges, queues, bindings, users, and other RabbitMQ objects, as well as monitor things like memory usage, message rates, connections, and other processes.
To check the list of all available RabbitMQ plugins, run the following command:

```bash
rabbitmq-plugins list
```

![RabbitMQ plugins list](https://www.cherryservers.com/v3/assets/blog/2022-08-30/07.png)

As you can see, all plugins are currently disabled. You can enable the RabbitMQ management plugin by using the following command:

```bash
rabbitmq-plugins enable rabbitmq_management
```

![Enable RabbitMQ web management plugin](https://www.cherryservers.com/v3/assets/blog/2022-08-30/08.png)

You can now connect to RabbitMQ web interface. To gain access, open your web browser and type the URL `http://your-server-ip:15672`:

![RabbitMQ web interface](https://www.cherryservers.com/v3/assets/blog/2022-08-30/09.png)

A default username and password are `guest`, however, you can only connect to your RabbitMQ server with user `guest` from localhost. Any other user is not restricted this way.
In case you do not know your IP address, type the following command to figure it out:

```bash
hostame -I
```

### [#](https://www.cherryservers.com/blog/how-to-install-and-start-using-rabbitmq-on-ubuntu-22-04#step-3-set-up-rabbitmq-administrative-user)Step 3: Set Up RabbitMQ Administrative User

It is recommended to create a new user and assign administrative permissions to it when setting up a RabbitMQ server. You can use the `rabbitmqctl add_user` command to add new users. Pick a unique username and set a secure password to continue:

```bash
rabbitmqctl add_user thebigrabbit MyS3cur3Passwor_d
```

![RabbitMQ add new user](https://www.cherryservers.com/v3/assets/blog/2022-08-30/10.png)

Next, set a tag for your created user to the administrator using the following command:

```bash
rabbitmqctl set_user_tags rabbitadmin administrator
```

It is also advisable to delete the default user `guest` for security reasons:

```bash
rabbitmqctl delete_user guest
```

Feel free to check the list of users to make sure your configuration is correct:

```bash
rabbitmqctl list_users
```

![RabbitMQ list users](https://www.cherryservers.com/v3/assets/blog/2022-08-30/11.png)

You can now see only a single user `thebigrabbit` with a tag `administrator`, and no default user `guest` available. So far so good.

### [#](https://www.cherryservers.com/blog/how-to-install-and-start-using-rabbitmq-on-ubuntu-22-04#step-4-create-rabbitmq-virtual-host)Step 4: Create RabbitMQ Virtual Host

RabbitMQ manages user permissions on a virtual host level. A virtual host in RabbitMQ provides logical grouping and separation of different resources. Such resources may include connections, exchanges, queues, bindings, user permissions, and some other RabbitMQ objects.
To add a new virtual host, go ahead and execute the following command:

```bash
rabbitmqctl add_vhost cherry_broker
```

You can apply various kinds of configuration settings to a Virtual Host like set the maximum number of concurrent client connections, configure maximum number of queues and others. Let’s now list all available Virtual Hosts on a server:

```bash
rabbitmqctl list_vhosts
```

![RabbitMQ vhosts list](https://www.cherryservers.com/v3/assets/blog/2022-08-30/12.png)

As you can see, there are currently two available virtual hosts - `/` and `cherry_broker` - on your server. You may delete the default virtual host with the following command:

```bash
rabbitmqctl delete_vhost /
```

### [#](https://www.cherryservers.com/blog/how-to-install-and-start-using-rabbitmq-on-ubuntu-22-04#step-5-assign-user-permissions-on-a-virtual-host)Step 5: Assign User Permissions on a Virtual Host

Next, you need to set specific user permissions for your administrative user on the newly created virtual host. The basic command pattern for setting user permissions is the following:

```bash
sudo rabbitmqctl set_permissions -p <virtual_host> <user_name> <permissions>
```

To set full permissions on a virtual host `cherry_broker` for user `thebigrabbit` run the following command:

```bash
sudo rabbitmqctl set_permissions -p cherry_broker thebigrabbit ".*" ".*" ".*"
```

To be more specific:

- -p is used to define the virtual host.
- The first permission argument “.*” grants configuration permissions on all virtual host entities. It allows you to declare exchanges, queues, etc.
- The second permission argument “.*” grants write permissions on all virtual host entities. It allows you to create bindings, publish messages etc.
- The third permission argument “.*” grants read permissions. It allows you to read queues, consume messages, etc.
- 

You can see the permission that you have just set on the virtual host by using the following command:

```bash
sudo rabbitmqctl list_permissions -p cherry_broker
```

![RabitMQ list permissions](https://www.cherryservers.com/v3/assets/blog/2022-08-30/13.png)

### [#](https://www.cherryservers.com/blog/how-to-install-and-start-using-rabbitmq-on-ubuntu-22-04#step-6-set-up-rabbitmq-via-web-management-console)Step 6: Set Up RabbitMQ via Web Management Console

You may now connect to the web management console by using your newly created username and password:

![RabbitMQ web console](https://www.cherryservers.com/v3/assets/blog/2022-08-30/14.png)

After a successful authentication, you should see a similar RabbitMQ dashboard:

![RabbitMQ web management console dashboard](https://www.cherryservers.com/v3/assets/blog/2022-08-30/15.png)

### [#](https://www.cherryservers.com/blog/how-to-install-and-start-using-rabbitmq-on-ubuntu-22-04#step-7-send-and-consume-rabbitmq-messages-in-python)Step 7: Send and Consume RabbitMQ Messages in Python

Even though there are many SDKs available for RabbitMQ, we will use Python for this tutorial. First, we need to install `pika` Python client that is recommended by the RabbitMQ development team. Use `pip install` to continue with the installation:

```bash
pip install pika --upgrade
```

We are now ready to start writing our Python development scripts. We will run these scripts on a remote Linux host that will connect to the RabbitMQ server on a standard port 5672 for sending and consuming messages. We will be using `producer.py` and `consumer.py` scripts to illustrate how a message broker works.

Let’s now define our `producer.py` script which job will be to generate messages and push them to RabbitMQ:

```python
#!/usr/bin/env python
import pika

# If you want to have a more secure SSL authentication, use ExternalCredentials object instead
credentials = pika.PlainCredentials(username=’thebigrabbit’, password='MyS3cur3Passwor_d', erase_on_connect=True)
parameters = pika.ConnectionParameters(host='5.199.168.22', port=5672, virtual_host='cherry_broker', credentials=credentials)

# We are using BlockingConnection adapter to start a session. It uses a procedural approach to using Pika and has most of the asynchronous expectations removed
connection = pika.BlockingConnection(parameters)
# A channel provides a wrapper for interacting with RabbitMQ
channel = connection.channel()

# Check for a queue and create it, if necessary
channel.queue_declare(queue='hello')
# For the sake of simplicity, we are not declaring an exchange, so the subsequent publish call will be sent to a Default exchange that is predeclared by the broker
channel.basic_publish(exchange='', routing_key='hello', body='Hello World!')
print(" [x] Sent 'Hello World!'")

# Safely disconnect from RabbitMQ
connection.close() 
```

Save it and create a `consumer.py` script which job will be to consume messages from RabbitMQ:

```python
#!/usr/bin/env python
import pika, sys, os

# Here we define the main script that will be executed forever until a keyboard interrupt exception is received
def main():
    credentials = pika.PlainCredentials('thebigrabbit', 'MyS3cur3Passwor_d')
    parameters = pika.ConnectionParameters(host='5.199.168.22', port=5672, virtual_host='cherry_broker', credentials=credentials)
    
    connection = pika.BlockingConnection(parameters)
    channel = connection.channel()
    channel.queue_declare(queue='hello')
    
    # Since RabbitMQ works asynchronously, every time you receive a message, a callback function is called. We will simply print the message body to the terminal 
    def callback(ch, method, properties, body):
        print(" [x] Received %r" % body)

    # Consume a message from a queue. The auto_ack option simplifies our example, as we do not need to send back an acknowledgement query to RabbitMQ which we would normally want in production
    channel.basic_consume(queue='hello', on_message_callback=callback, auto_ack=True)
    print(' [*] Waiting for messages. To exit press CTRL+C')
    
    # Start listening for messages to consume
    channel.start_consuming()
    
if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        print("Interrupted")
        try:
            sys.exit(0)
        except SystemExit:
            os._exit(0)
```

We can now send our first message by running our producer script:

```bash
python3 producer.py
```

![Run RabbiMQ producer script](https://www.cherryservers.com/v3/assets/blog/2022-08-30/16.png)

You can double check the web management console to see a queue `hello` with a single message that is ready to be consumed:

![Message pushed to RabbitMQ queue](https://www.cherryservers.com/v3/assets/blog/2022-08-30/17.png)

Let’s now run the consumer script to receive this message:

![Run RabbitMQ consumer script](https://www.cherryservers.com/v3/assets/blog/2022-08-30/18.png)

As you can see, a message `Hello World!` has been successfully consumed before KeyboardInterrupt signal (CTRL + C) was received.

If you checked the web management console, you would see an empty `hello` queue:

![Message consumed from RabbitMQ queue](https://www.cherryservers.com/v3/assets/blog/2022-08-30/19.png)

## [#](https://www.cherryservers.com/blog/how-to-install-and-start-using-rabbitmq-on-ubuntu-22-04#conclusion)Conclusion

In this guide you have learned quite a lot about RabbitMQ, its advantages and a possible use case. You can now continue developing further to implement your desired message broker use case in the production environment. Check the official [RabbitMQ](https://www.rabbitmq.com/documentation.html) and [Pika](https://pika.readthedocs.io/en/stable/intro.html) documentation for any additional information along the way.