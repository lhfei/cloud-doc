







## [Maven Properties Guide](https://cwiki.apache.org/confluence/display/MAVEN/Maven+Properties+Guide)

### Project property

Full detailed explanations can be found in [Maven Model Builder Interpolation reference documentation](http://maven.apache.org/ref/current/maven-model-builder/#Model_Interpolation).

This page extracts a few classical values:

- ```
  ${project.basedir} 
  ```

  - This references to the root folder of the module/project (the location where the current pom.xml file is located)

POM properties referencing useful [build](http://maven.apache.org/ref/current/maven-model/maven.html#class_build) locations, with default values defined in the [Super POM](http://maven.apache.org/pom.html#The_Super_POM):

- ```
  ${project.build.directory}
  ```

  - This represents by default the `target` folder.

- ```
  ${project.build.outputDirectory}
  ```

  - This represents by default the `target/classes` folder.

- ```
  ${project.build.testOutputDirectory}
  ```

  - This represents by default the `target/test-classes` folder.

- ```
  ${project.build.sourceDirectory}
  ```

  - This represents by default the `src/main/java` folder.

- ```
  ${project.build.testSourceDirectory}
  ```

  - This represents by default the `src/test/java` folder.

You can use further properties like the following:

- ```
  ${project.build.finalName}
  ```

  - This is by default defined as `${project.artifactId}-${project.version}`.

- ```
  ${project.version}
  ```

  - This can be used at locations where you have to write a literal version otherwise, in particular if you are in a multi-modules build for inter modules dependencies.

User Settings

The `settings.xml` elements could be referenced by using things like this (see also at the [Super POM](http://maven.apache.org/pom.html#Properties)):

- `${settings.localRepository`}
  - which references the location of the local repository. This is by default `${home}/.m2/repository`.



### Build property

- [x] <directory>${project.basedir}/target</directory>
- [x] <outputDirectory>${project.build.directory}/classes</outputDirectory>
- [x] <finalName>${project.artifactId}-${project.version}</finalName>
- [x] <testOutputDirectory>${project.build.directory}/test-classes</testOutputDirectory>
- [x] <sourceDirectory>${project.basedir}/src/main/java</sourceDirectory>
- [x] <scriptSourceDirectory>src/main/scripts</scriptSourceDirectory>
- [x] <testSourceDirectory>${project.basedir}/src/test/java</testSourceDirectory>