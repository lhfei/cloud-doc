[Gradle](http://gradle.org "Gradle")
====================================



Gradle is a build tool similar to Maven and Ant. If you are a Java developer you will most likely have used either Ant or Maven already. Gradle is the latest of these three build tools, and Gradle is starting to get wider adoption (at the time of writing in 2015).

Some of the advantages Gradle has over Maven and Ant is more concise build scripts and a more flexible build script language. One disadvantage Gradle has is that it is incredibly slow! (come on, Gradle devs, you can do better than that!).

Table of Contents:

1. Gradle Tutorial
2. Install Gradle
3. [Run Gradle](#'Run Gradle')
4. Gradle Tasks
5. Gradle For Java Projects
6. Gradle Dependency Management


> # Run Gradle 

## Listing Tasks in Build Script

```sh
gradle tasks

gradle tasks --all
```

##  Run a Task
```sh
gradle compileCode
```

##  Run Multiple Tasks
```sh
gradle clean build
```

##  Task Name Abbreviation
```sh
gradle b
```

##  Excluding Tasks
```sh
gradle build -x test
```

##  Quiet Mode
```sh
gradle -q compileCode
```


##  Listing Tasks in Build Script
```sh
gradle tasks

gradle tasks --all
```

##  Specifying Build Script
```sh
gradle -b subproject-dir/build.gradle build
```

##  Specifying Project
```sh
gradle -p subproject-dir build
```

##  Listing Subprojects
```sh
gradle projects
```

##  Gradle Help
```sh
gradle -h
```

##  Build Failures
If a task in the build script fails during execution, Gradle will abort the whole build. This is done to save you time. Often, later tasks in the build script make no sense to execute if earlier tasks fail.

You can instruct Gradle to continue the build even if a task fails. This is done using the --continue flag, like this:
```sh
gradle build --continue
```

##  Dry Run
A "dry run" is a run where Gradle does not actually execute all the tasks you tell it to execute. Instead Gradle prints out information about what tasks that would have been executed in case you had run Gradle normally.

```sh
gradle -m build
```

> # Gradle Tasks


##  Defining Gradle Tasks

You define a Gradle task inside the Gradle build script. You can define the task pretty much anywhere in the build script.

A task definition consists of the keyword task and then the name of the task, like this:

```sh
task myTask
```

##  Task Execution Phases

- Shorter Syntax

    A Gradle script is a Groovy script and Groovy allows a few syntax optimizations to make your Groovy scripts shorter.
    
    First of all you do not need the semicolon ; after the doFirst() and doLast() method calls, if the code line with the method calls ends with a new line.
    
    Second, you do not need the parentheses around the closure when calling doFirst() or doLast().
    
    With these two syntax optimizations you can write the doFirst() and doLast() method calls like this:
    

    ```sh
    myTask.doFirst {
        println "This is done first"
    }
    
    myTask.doLast {
        println "This is done last"
    }    
    ```

- doLast() Shortcut Notation

    Often you will not need to pass closures to both doFirst() and doLast() . It is quite common to pass just a single closure to the doLast() method. Because this is such a common use case, Gradle has a shortcut for passing a closure to the doLast() method. Here is how the shortcut doLast() call notation looks:
    
    ```sh
    myTask << {
        println "This is done last"
    }
    ```
    
    The two characters << corresponds to calling the doLast() method like this:
    
    ```sh
    myTask.doLast {
        println "This is done last"
    }
    ```
    You can even define the task on the same line as you pass the closure to the doLast() method. Here is an example of how that looks:
    
    ```sh
    task myTask << {
        println "This is done last"
    }
    ```
Defining the task and last closure in the same Groovy statement makes the build script more concise.

##  Multiple Closures For the Same Execution Phase

It is actually possible to add multiple closures for the same task execution phases. Here is an example:
```sh
myTask.doLast {
    println "This is done 2nd last"
}
myTask.doLast {
    println "This is done last"
}
```
This examples adds two closures to the last execution phase.

Multiple closures added to the same execution phase will be executed in the sequence they were added to the execution phase. In the example above, first the closure printing the text "This is done 2nd last" would be executed, then the closure printing the "This is done last" text would be executed.

All closures added to the first execution phase will of course be executed before any of the closures added to the last execution phase.

You can also add multiple closures using the doLast() shortcut notation. Here is an example:

```sh
myTask << {
    println "This is done 2nd last"
}
myTask << {
    println "This is done last"
}
```

##  Default Tasks

A Gradle build script can contain one or more default tasks. A default task is a task that is executed if you do not provide any task name to execute to the gradle command. If you open a command prompt and change directory into the directory where your project (incl. gradle build script) is located, and execute this command:

```sh
gradle
```

Then Gradle will execute the default tasks listed in the Gradle build script for that project.

You specify the default task for a Gradle build script like this:

```sh
defaultTasks 'firstTask'
```

This example sets the task named firstTask as default task for the gradle build script.

If you need more than one default task, you can list the extra tasks after the first task, with the task names separated by comma. Here is an example:

```sh
defaultTasks 'firstTask', 'secondTask'
```

##  Task Dependencies

A task can depend on another task, just like in Ant. If task B depends on task A, that means that task A must have been executed before task B is executed. If you execute task B then Gradle will detect the dependency and execute task A first, then task B.

Gradle task dependencies are listed inside parentheses after the task name. Here is a Gradle task dependency example:

```sh
task firstTask << {
    println "This is first task"
}

task myTask (dependsOn:firstTask) << {
    println "This is myTask"
}
```

This example defines two tasks called firstTask and myTask. The myTask task depends on the firstTask task. This is stated inside the parentheses after the name of myTask. More specifically, by this code:

```sh
(dependsOn:firstTask)
```

When you execute myTask Gradle will first execute firstTask and 

##  Real Build Actions

The tasks you have seen so far only printed out text. I kept the tasks simple so that you could more easily understand what was going on. In later texts in this Gradle tutorial trail you will see how to actually compile Java code, run unit tests, create JAR files and similar build actions.


## Java Main Application

```bash
task printMessage(type: JavaExec) {
	classpath sourceSets.main.runtimeClasspath
	main = 'cn.lhfei.grpc.task.SimpleTask'
}
```

> # Gradle For Java Projects

## Adding the Java Plugin

Before you can use the tasks in the Gradle Java plugin you must first add the Java plugin to your Gradle build script. You add the Gradle Java plugin to your Gradle build script by adding this line at the top of the build script:

```sh
apply plugin: 'java'
```

## Listing the Java Build Tasks

Once you have added the Gradle Java plugin to your build script you can list the build tasks the Java plugin adds using this command:

```sh
gradle tasks
```

## Building Your Java Project

To build your Java project you can write:

```sh
gradle build
```

## Cleaning Build Output

Once in a while you might want to rebuild your Java project from scratch. To do so you must first remove all previous build output. You do so using the clean task, like this:

```sh
gradle clean
```



> # Gradle Dependency Management

## Maven Repositories

Maven was the first build tool to popularize the idea of central repositories of JAR files from which we could all download the JAR files we need. Inside a Maven build script you can then define what projects (JAR files) your project depends on, and Maven will automatically download the correct JAR files for you.

Gradle is capable of using Maven repositories. Why reinvent the wheel when Maven repositories already work well? Actually, Gradle can also use Ivy repositories. Ivy is a dependency management tool for use with the Ant build tool, since Ant does not have built-in dependency management.

To get Gradle to use the official, central Maven repository you must specify so in the Gradle build script. Here is how that looks:

```bash
repositories {
    mavenCentral()
}
```

Insert this code into your Gradle build script towards the top of the build script.

You can also use your own Maven repository. Some organizations may keep an internal Maven repository which only contains the JAR files which the organization has approved for use in their software (for legal or stability reasons). If you are using your own Maven repository you can specify that inside the repositories block like this:

```bash
maven {
    url "http://mavenrepo.jenkov.com/"
}
```

If you are using two or more repositories you can specify them after each other like this:

```bash
repositories {
    mavenCentral()

    maven {
       url "http://mavenrepo.jenkov.com/"
    }
}
```

- Local Repository

    Using your own Maven repository is not the same as using your local Maven repository. The local Maven repository is where Maven stores all JAR files it has downloaded from other Maven repositories, so that it does not have to download them from the remote repositories every time the project is built.
    
    You can tell Gradle to use your local Maven repository by putting the path to your local Maven repository inside the url string in the Maven repository declaration like this:
    
    ```bash
    maven {
        url "C:\\maven\\repository"
    }
    ```

## Declaring Dependencies

In a Maven repository a JAR file is identified by its group name (e.g. the organization that made it), its artifact name (the name of the project / software / tool / API), and a version number (e.g. 1.4.5). When you specify a dependency for your project, the identification of the dependency must contain these three parts.

Dependencies that are compiled outside of Gradle (e.g. downloaded from the central Maven repository) are called external dependencies.

Dependencies are specified inside the dependencies block of your build script. Here is how an empty Gradle dependencies block looks:

```bash
dependencies {
}
```

Insert the dependencies block after the repositories block.

Here is an example dependency declaration inside the dependencies block:

```bash
dependencies {
    compile group: 'org.slf4j', name: 'slf4j-log4j12', version: '1.7.22'
}
```

This example declares a dependency on Log4J using the group name log4j, the artifact name log4j and the version 1.2.17 .

When Gradle sees this dependency declaration Gradle will try to download it from the central Maven repository.


## Dependency Shortcut Notation

There is a dependency shortcut notation using which you can specify the group name, artifact name and version in a single string separated by colons. The dependency declaration example from the previous section could also be declared like this using the shortcut notation:

```bash
dependencies {
    compile  'org.slf4j:slf4j-log4j12:1.7.22'
}
```

## Dependency Configurations

If you examine the previous dependency declaration example closely you will notice the word compile in the beginning of the declaration (first line inside the dependencies block). The word compile specifies what dependency configuration the declaration belongs to.

A dependency configuration is group of dependencies used for a specific purpose by your project. For instance, some JAR files might only be needed when you compile your code (like an annotation pre-processor). Other JAR files might be needed when you run the project code, or when you run the unit tests for your project.

The Java plugin provides a few pre-defined dependency configurations that can be useful for you. These dependency configurations are:

- compile
- runtime
- testCompile
- testRuntime

The compile dependency configuration should contain all dependencies needed to compile the Java code in your project.

The runtime dependency configuration should contain all the dependencies needed to run the Java code in your Project. Most often the JAR files needed at runtime are also needed at compile time, but not always. For instance, a JDBC driver may not be seen by the Java compiler, but will still be needed at runtime. By default the runtime dependency configuration also includes all dependencies in the compile group.

The testCompile dependency configuration should contain all the dependencies needed to compile the unit tests for your project. By default the testCompile dependency configuration also includes the compiled classes and the dependencies from the compile dependency configuration.

The testRuntime dependency configuration should contain all the dependencies needed to run the unit tests for your project. By default the testRuntime dependency configuration also includes all dependencies from the compile, runtime and testCompile dependency configurations.

You can declare multiple dependencies by insert multiple dependency declarations like this:

```bash
def grpcVersion = '1.0.3'
def slf4jVersion = '1.7.22'

dependencies {
    // The production code uses Guava
    compile 'com.google.guava:guava:20.0'
    
    compile group: 'io.grpc', name: 'grpc-protobuf', version: "${grpcVersion}"
	compile group: 'io.grpc', name: 'grpc-netty', version: "${grpcVersion}"
	compile group: 'io.grpc', name: 'grpc-stub', version: "${grpcVersion}"
	
	// Slf4j dependencies
	compile group: 'commons-collections', name: 'commons-collections', version: '3.2.2'
	compile group: 'org.slf4j', name: 'slf4j-api', version: "${slf4jVersion}"
	compile group: 'org.slf4j', name: 'slf4j-log4j12', version: "${slf4jVersion}"

    testCompile 'junit:junit:4.12'
}
```

