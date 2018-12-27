# Apache Spark Internals

We learned about the Apache Spark ecosystem in the earlier section. The next thing that you might want to do is to write some data crunching programs and execute them on a Spark cluster.

## How to execute Spark Programs?

There are two methods to use Apache Spark.

1. Interactive client shells
2. Spark submit utility

Apache Spark offers two command line interfaces.

1. Scala shell
2. Python shell

The first method for executing your code on a Spark cluster is using an interactive client. Most of the people use interactive clients during the learning or development process. Interactive clients are best suitable for exploration purpose. You can also integrate some other client tools such as jupyter notebooks. However, that is also an interactive client. 
But ultimately, all your exploration will end up into a full-fledged Spark application. You can package your application and submit it to Spark cluster for execution using a Spark Submit utility. That is the second method for executing your programs on a Spark cluster. For a production use case, you will be using spark submit utility.

## Spark Execution Model

Spark is a distributed processing engine, and it follows the master-slave architecture. So, for every application, Spark will create one master process and multiple slave processes. In Spark terminology, the master is the driver, and the slaves are the executors. Let's try to understand it with a simple example.

[![Apache Spark Execution Model](https://www.learningjournal.guru/_resources/img/jpg-7x/apache-spark-execution-model.jpg)](https://www.learningjournal.guru/_resources/img/jpg-7x/apache-spark-execution-model.jpg)Fig.1- Shows the Apache Spark execution model.

Suppose you are using the spark-submit utility. You execute an application *A1* using spark-submit, and Spark will create one driver process and some executor processes for *A1*. This entire set is exclusive for the application *A1*. 
Now, you submit another application *A2*, and Spark will create one more driver process and some executor process for *A2*. So, for every application, Spark creates one driver and a bunch of executors.

### Spark Driver

The driver is the master. It is responsible for analyzing, distributing, scheduling and monitoring work across the executors. The driver is also responsible for maintaining all the necessary information during the lifetime of the application.

### Spark Executors

Spark executors are only responsible for executing the code assigned to them by the driver and reporting the status back to the driver. The Spark driver will assign a part of the data and a set of code to executors. The executor is responsible for executing the assigned code on the given data. They keep the output with them and report the status back to the driver.

## Spark Execution Modes

Now we know that every Spark application has a set of executors and one dedicated driver. The next question is - Who executes where? I mean, we have a cluster, and we also have a local client machine. What executes where? 
The executors are always going to run on the cluster machines. There is no exception for executors. However, you have the flexibility to start the driver on your local machine or as a process on the cluster. When you start an application, you have a choice to specify the execution mode, and there are three options.

1. Client Mode - Start the driver on your local machine
2. Cluster Mode - Start the driver on the cluster
3. Local Mode - Start everything in a single local JVM.

The Client Mode will start the driver on your local machine, and the Cluster Mode will start the driver on the cluster. Local mode is a for debugging purpose. The local mode doesn't use the cluster at all and everything runs in a single JVM on your local machine.

### Which mode should you use?

You already know that the driver is responsible for the whole application. If anything goes wrong with the driver, your application state is gone. So, if you start the driver on your local machine, your application is directly dependent on your local computer. You might not need that kind of dependency in a production application. After all, you have a dedicated cluster to run the job. Hence, the Cluster mode makes perfect sense for production deployment. Because after spark-submit, you can switch off your local computer and the application executes independently within the cluster. 
On the other side, when you are exploring things or debugging an application, you want the driver to be running locally. If the driver is running locally, you can easily debug it, or at least it can throw back the output on your terminal. That's where the client-mode makes more sense over the cluster-mode. And hence, If you are using an interactive client, your client tool itself is a driver, and you will have some executors on the cluster. If you are using spark-submit, you have both the choices.

## Spark Cluster

The next key concept is to understand the resource allocation process within a Spark cluster. 
How Spark gets the resources for the driver and the executors? 
That's where Apache Spark needs a cluster manager. Spark doesn't offer an inbuilt cluster manager. It relies on a third party cluster manager, and that's a powerful thing because it gives you multiple options. As on the date of writing, Apache Spark supports four different cluster managers.

1. Apache YARN
2. Apache Mesos
3. Kubernetes
4. Standalone

YARN is the cluster manager for Hadoop. As of date, YARN is the most widely used cluster manager for Apache Spark. 
Apache Mesos is another general-purpose cluster manager. If you are not using Hadoop, you might be using Mesos for your Spark cluster. 
The next option is the Kubernetes. I won't consider the Kubernetes as a cluster manager. In fact, it's a general purpose container orchestration platform from Google. Spark on Kubernates is not yet production ready. However, the community is working hard to bring it to production. 
Finally, the standalone. The Standalone is a simple and basic cluster manager that comes with Apache Spark and makes it easy to set up a Spark cluster very quickly. I don't think you would be using it in a production environment. 
No matter which cluster manager do we use, primarily, all of them delivers the same purpose.

### Spark on YARN

Let's take YARN as an example to understand the resource allocation process. 
A Spark application begins by creating a Spark Session. That's the first thing in any Spark 2.x application. If you are building an application, you will be establishing a Spark Session. If you are using a Spark client tool, for example, scala-shell, it automatically create a Spark Session for you. You can think of Spark Session as a data structure where the driver maintains all the information including the executor location and their status. 
Now, assume you are starting an application in client mode, or you are starting a spark-shell (refer the digram below). In this case, your driver starts on the local machine and then as soon as the driver create a Spark Session, a request (1) goes to YARN resource manager to create a YARN application. The YARN resource manager starts (2) an Application Master. For the client mode, the AM acts as an Executor Launcher. So, the YARN application master will reach out (3) to YARN resource manager and request for further containers. The resource manager will allocate (4) new containers, and the Application Master starts (5) an executor in each container. After the initial setup, these executors directly communicate (6) with the driver.

[![Spark YARN resource allocation in client mode](https://www.learningjournal.guru/_resources/img/jpg-7x/spark-yarn-resource-allocation-in-client-mode.jpg)](https://www.learningjournal.guru/_resources/img/jpg-7x/spark-yarn-resource-allocation-in-client-mode.jpg)Fig.2- Shows the YARN resource allocation for Spark in client mode.

The process for cluster mode application is slightly different (refer the digram below). In the cluster mode, you submit your packaged application using the spark-submit tool. The spark-submit utility will send (1) a YARN application request to the YARN resource manager. The YARN resource manager starts (2) an application master. And then, the driver starts in the AM container. That's where the client mode and cluster mode differs. 
In the client mode, the YARN AM acts as an executor launcher, and the driver resides on your local machine, but in the cluster mode, the YARN AM starts the driver, and you don't have any dependency on your local computer. Once started, the driver will reach out(3) to resource manager with a request for more Containers. Rest of the process is same. The resource manager will allocate (4) new Containers, and the driver starts (5) an executor in each Container.

[![Spark YARN resource allocation in cluster mode](https://www.learningjournal.guru/_resources/img/jpg-7x/spark-yarn-resource-allocation-in-cluster-mode.jpg)](https://www.learningjournal.guru/_resources/img/jpg-7x/spark-yarn-resource-allocation-in-cluster-mode.jpg)Fig.3- Shows the YARN resource allocation for Spark in cluster mode.

Continue reading to learn - How Spark brakes your code and distribute it to executors?