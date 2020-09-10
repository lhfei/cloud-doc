



### Building from source

Elasticsearch uses [Gradle](https://gradle.org/) for its build system.

In order to create a distribution, simply run the `./gradlew assemble` command in the cloned directory.

The distribution for each project will be created under the `build/distributions` directory in that project.

[@see](https://github.com/elastic/elasticsearch/issues/45034)

```shell
./gradlew -p  distribution/archives/no-jdk-linux-tar assemble
```

