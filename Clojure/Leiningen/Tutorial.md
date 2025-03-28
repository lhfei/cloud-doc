**Table of Contents** *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- Tutorial
  - [What This Tutorial Covers](https://codeberg.org/leiningen/leiningen/src/branch/stable/doc/TUTORIAL.md#user-content-what-this-tutorial-covers)
  - [Getting Help](https://codeberg.org/leiningen/leiningen/src/branch/stable/doc/TUTORIAL.md#user-content-getting-help)
  - [Leiningen Projects](https://codeberg.org/leiningen/leiningen/src/branch/stable/doc/TUTORIAL.md#user-content-leiningen-projects)
  - Creating a Project
    - [Directory Layout](https://codeberg.org/leiningen/leiningen/src/branch/stable/doc/TUTORIAL.md#user-content-directory-layout)
    - [Filename-to-Namespace Mapping Convention](https://codeberg.org/leiningen/leiningen/src/branch/stable/doc/TUTORIAL.md#user-content-filename-to-namespace-mapping-convention)
  - [project.clj](https://codeberg.org/leiningen/leiningen/src/branch/stable/doc/TUTORIAL.md#user-content-projectclj)
  - Dependencies
    - [Overview](https://codeberg.org/leiningen/leiningen/src/branch/stable/doc/TUTORIAL.md#user-content-overview)
    - [Artifact IDs, Groups, and Versions](https://codeberg.org/leiningen/leiningen/src/branch/stable/doc/TUTORIAL.md#user-content-artifact-ids-groups-and-versions)
    - [Snapshot Versions](https://codeberg.org/leiningen/leiningen/src/branch/stable/doc/TUTORIAL.md#user-content-snapshot-versions)
    - [Repositories](https://codeberg.org/leiningen/leiningen/src/branch/stable/doc/TUTORIAL.md#user-content-repositories)
    - [Checkout Dependencies](https://codeberg.org/leiningen/leiningen/src/branch/stable/doc/TUTORIAL.md#user-content-checkout-dependencies)
    - [Search](https://codeberg.org/leiningen/leiningen/src/branch/stable/doc/TUTORIAL.md#user-content-search)
  - [Setting JVM Options](https://codeberg.org/leiningen/leiningen/src/branch/stable/doc/TUTORIAL.md#user-content-setting-jvm-options)
  - [Running Code](https://codeberg.org/leiningen/leiningen/src/branch/stable/doc/TUTORIAL.md#user-content-running-code)
  - [Tests](https://codeberg.org/leiningen/leiningen/src/branch/stable/doc/TUTORIAL.md#user-content-tests)
  - [Profiles](https://codeberg.org/leiningen/leiningen/src/branch/stable/doc/TUTORIAL.md#user-content-profiles)
  - What to do with it
    - [Uberjar](https://codeberg.org/leiningen/leiningen/src/branch/stable/doc/TUTORIAL.md#user-content-uberjar)
    - [Framework (Uber)jars](https://codeberg.org/leiningen/leiningen/src/branch/stable/doc/TUTORIAL.md#user-content-framework-uberjars)
    - [Server-side Projects](https://codeberg.org/leiningen/leiningen/src/branch/stable/doc/TUTORIAL.md#user-content-server-side-projects)
    - [Publishing Libraries](https://codeberg.org/leiningen/leiningen/src/branch/stable/doc/TUTORIAL.md#user-content-publishing-libraries)
  - [That's It!](https://codeberg.org/leiningen/leiningen/src/branch/stable/doc/TUTORIAL.md#user-content-thats-it)

# Tutorial

Leiningen is for automating Clojure projects without setting your hair on fire. If you experience your hair catching on fire or any other frustrations while following this tutorial, please [let us know](https://codeberg.org/leiningen/leiningen/issues/new).

It offers various project-related tasks and can:

- create new projects
- fetch dependencies for your project
- run tests
- run a fully-configured REPL
- compile Java sources (if any)
- run the project (if the project isn't a library)
- generate a maven-style "pom" file for the project for interop
- compile and package projects for deployment
- publish libraries to repositories such as [Clojars](https://clojars.org/)
- run custom automation tasks written in Clojure (leiningen plug-ins)

If you come from the Java world, Leiningen could be thought of as "Maven meets Ant without the pain". For Ruby and Python folks, Leiningen combines RubyGems/Bundler/Rake and pip/Fabric in a single tool.

## What This Tutorial Covers

This tutorial will briefly cover project structure, dependency management, running tests, the REPL, and topics related to deployment.

For those of you new to the JVM who have never touched [Ant](http://ant.apache.org/) or [Maven](https://maven.apache.org/) in anger: don't panic. Leiningen is designed with you in mind. This tutorial will help you get started and explain Leiningen's take on project automation and JVM-land dependency management.

## Getting Help

Also keep in mind that Leiningen ships with fairly comprehensive help; `lein help` gives a list of tasks while `lein help $TASK` provides details. Further documentation such as the readme, sample configuration, and even this tutorial are also provided.

## Leiningen Projects

Leiningen works with *projects*. A project is a directory containing a group of Clojure (and possibly Java) source files, along with a bit of metadata about them. The metadata is stored in a file named `project.clj` in the project's root directory, which is how you tell Leiningen about things like

- Project name
- Project description
- What libraries the project depends on
- What Clojure version to use
- Where to find source files
- What's the main namespace of the app

and more.

Most Leiningen tasks only make sense in the context of a project. Some (for example, `repl` or `help`) can also be called from any directory.

Next let's take a look at how projects are created.

## Creating a Project

We'll assume you've got Leiningen installed as per the [README](https://codeberg.org/leiningen/leiningen/src/stable/README.md). Generating a new project is easy:

```
$ lein new app my-stuff
Generating a project called my-stuff based on the 'app' template.

$ # see how it looks like using the "tree" command
$ tree -F -a --dirsfirst my-stuff/

my-stuff/
├── doc/
│   └── intro.md
├── resources/
├── src/
│   └── my_stuff/
│       └── core.clj
├── test/
│   └── my_stuff/
│       └── core_test.clj
├── CHANGELOG.md
├── .gitignore
├── .hgignore
├── LICENSE
├── project.clj
└── README.md
```

In this example we're using the `app` template, which is intended for an application project rather than a library. Omitting the `app` argument will use the `default` template, which is suitable for libraries.

### Directory Layout

Here we've got your project's README, a `src/` directory containing the code, a `test/` directory, and a `project.clj` file which describes your project to Leiningen. The `src/my_stuff/core.clj` file corresponds to the `my-stuff.core` namespace.

### Filename-to-Namespace Mapping Convention

Note that we use `my-stuff.core` instead of just `my-stuff` since [single-segment namespaces are discouraged in Clojure](https://stackoverflow.com/questions/13567078/whats-wrong-with-single-segment-namespaces) as using those would imply classes are being assigned to the default (no-name) package.

Also note that if a Clojure namespaces segment contains a dash (`-`), the corresponding path/filename will contain an underscore (`_`) instead. This is due to the fact that [Java disallows dashes in identifiers](https://docs.oracle.com/javase/specs/jls/se12/html/jls-3.html#jls-3.8), in particular in package and class names. A Clojure "dash-adorned" namespace identifier is thus mapped to a Java-compatible "underscore-adorned" package identifier. This change is reflected in pathnames as these must match the package and class names.

The intricacies of namespaces are a common source of confusion for newcomers, and while they are mostly outside the scope of this tutorial you can read up on them elsewhere, for example [here](https://8thlight.com/blog/colin-jones/2010/12/05/clojure-libs-and-namespaces-require-use-import-and-ns.html) and [here](https://stuartsierra.com/2016/clojure-how-to-ns.html).

## project.clj

Your `project.clj` file will start off looking something like this:

```clj
(defproject my-stuff "0.1.0-SNAPSHOT"
  :description "FIXME: write description"
  :url "https://example.com/FIXME"
  :license {:name "Eclipse Public License"
            :url "https://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.8.0"]]
  :main ^:skip-aot my-stuff.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all}})
```

If you don't fill in the `:description` with a short sentence, your project will be harder to find in search results, so start there. Be sure to fix the `:url` as well. At some point you'll need to flesh out the `README.md` file too, but for now let's skip ahead to setting `:dependencies`. Note that Clojure is just another dependency here. Unlike most languages, it's easy to swap out any version of Clojure.

## Dependencies

### Overview

Clojure is a hosted language and Clojure libraries are distributed the same way as in other JVM languages: as [jar](https://en.wikipedia.org/wiki/JAR_(file_format)) files.

Jar files are basically just `.zip` files with a little extra JVM-specific metadata. They usually contain `.class` files (JVM bytecode) and `.clj` source files, but they can also contain other things like config files, JavaScript files or text files with static data.

Published JVM libraries have *identifiers* (artifact group, artifact id) and *versions* based on [Maven naming conventions](https://maven.apache.org/guides/mini/guide-naming-conventions.html).

### Artifact IDs, Groups, and Versions

You can [search Clojars](https://clojars.org/search?q=clj-http) using its web interface or via `lein search $TERM`. On the Clojars page for `clj-http` at the time of this writing it shows this:

```clj
[clj-http "2.0.0"]
```

It also shows the Maven and Gradle syntax for dependencies. You can copy the Leiningen version directly into the `:dependencies` vector in `project.clj`. So for instance, if you change the `:dependencies` line in the example `project.clj` above to

```clj
:dependencies [[org.clojure/clojure "1.8.0"]
               [clj-http "2.0.0"]]
```

Leiningen will automatically download the `clj-http` jar file and make sure it is on your classpath. If you want to explicitly tell `lein` to download new dependencies, you can do so with `lein deps`, but it will happen on-demand if you don't.

Within the vector, "clj-http" is referred to as the "artifact id". "2.0.0" is the version. Some libraries will also have "group ids", which are displayed like this:

```clj
[com.cedarsoft.utils.legacy/hibernate "1.3.7"]
```

The group id is the part before the slash. Especially for Java libraries, it's often a reversed domain name. Clojure libraries often use the same group-id and artifact-id (as with clj-http), in which case you can omit the group-id. If there is a library that's part of a larger group (such as `ring-jetty-adapter` being part of the `ring` project), the group-id is often the same across all the sub-projects.

### Snapshot Versions

Sometimes versions will end in "-SNAPSHOT". This means that it is not an official release but a development build. Relying on snapshot dependencies is discouraged but is sometimes necessary if you need bug fixes, etc. that have not made their way into a release yet. However, snapshot versions are not guaranteed to stick around, so it's important that non-development releases never depend upon snapshot versions that you don't control. Adding a snapshot dependency to your project will cause Leiningen to actively go seek out the latest version of the dependency daily (whereas normal release versions are cached in the local repository) so if you have a lot of snapshots it will slow things down.

Note that some libraries make their group-id and artifact-id correspond with the namespace they provide inside the jar, but this is just a convention. There is no guarantee they will match up at all, so consult the library's documentation before writing your `:require` and `:import` clauses.

### Repositories

Dependencies are stored in *artifact repositories*. If you are familiar with Perl's CPAN, Python's Cheeseshop (aka PyPi), Ruby's rubygems.org, or Node.js's NPM, it's the same thing. Leiningen reuses existing JVM repository infrastructure. There are several popular open source repositories. Leiningen by default will use two of them: [clojars.org](https://clojars.org/) and [Maven Central](https://search.maven.org/).

[Clojars](https://clojars.org/) is the Clojure community's centralized Maven repository, while [Central](https://search.maven.org/) is for the wider JVM community.

You can add third-party repositories by setting the `:repositories` key in project.clj. See the [sample.project.clj](https://codeberg.org/leiningen/leiningen/src/stable/sample.project.clj) for examples on how to do so. This sample uses additional repositories such as the Sonatype repository which gives access to the latest SNAPSHOT development version of a library (Clojure or Java). It also contains other relevant settings regarding repositories such as update frequency.

### Checkout Dependencies

Sometimes it is necessary to develop two or more projects in parallel, the main project and its dependencies, but it is very inconvenient to run `lein install` and restart your repl all the time to get your changes picked up. Leiningen provides a solution called *checkout dependencies* (or just *checkouts*). To use it, create a directory called `checkouts` in the project root, like so:

```
my-stuff/
│
├── checkouts/    <--- here
│
├── doc/
│   └── intro.md
├── resources/
├── src/
│   └── my_stuff/
│       └── core.clj
├── test/
│   └── my_stuff/
│       └── core_test.clj
├── CHANGELOG.md
├── .gitignore
├── .hgignore
├── LICENSE
├── project.clj
└── README.md
```

Then, under the checkouts directory, create symlinks to the root directories of projects you need. The names of the symlinks don't matter: Leiningen just follows all of them to find `project.clj` files to use. Traditionally, they have the same name as the directory they point to.

```
my-stuff/
├── checkouts/
│   ├── commons -> [link to /code/company/commons]
│   └── suchwow -> [link to /code/oss/suchwow]
.
```

Libraries located under the `checkouts` directory take precedence over libraries pulled from repositories, but this is not a replacement for listing the project in your main project's `:dependencies`; it simply supplements that for convenience. The project in `:dependencies` must be able to be resolved, either from a remote repo or via `lein install` locally. That is, given the above directory hierarchy, `project.clj` should contain something like:

```
  :dependencies [[org.clojure/clojure "1.9.0"]
                 ...
                 [suchwow "0.3.9"]
                 [com.megacorp/commons "1.3.5"]
                 ...]
```

Note here that the Maven groupid `com.megacorp` has no effect on the way checkouts work. The `suchwow` and `commons` links look the same in `checkouts`, and the groupid hierarchy doesn't need to appear in the way `commons` is actually laid out on disk.

After you've updated `:dependencies`, `lein` will still need to be able to find the library in some repository like clojars or your `~/.m2` directory. If `lein` complains with a message like "Could not find artifact suchwow🫙0.3.9", it's possible that `project.clj` and `suchwow/project.clj` use different version numbers. It's also possible that you're working on the main project and `suchwow` at the same time, have bumped the version number in both project files, but still have the old version in your local Maven repository. Run `lein install` in the `suchwow` directory. That is: the `suchwow` version number must be the same in *three* places: in suchwow's `project.clj`, in the main project's `project.clj`, *and in some repository the main project uses*.

If you change the dependencies of a checkout project you will still have to run `lein install` and restart your repl; it's just that source changes will be picked up immediately.

Checkouts are an opt-in feature; not everyone who is working on the project will have the same set of checkouts, so your project should work without checkouts before you push or merge.

Make sure not to override the `base` profile while using checkouts. In practice that usually means using `lein with-profile +foo run` rather than `lein with-profile foo run`.

### Search

Leiningen supports searching remote Maven repositories for matching jars with the command `lein search $TERM`. Currently only searching Central and Clojars is supported.

### Maven Read Timeout

The underlying [Maven Wagon](https://maven.apache.org/wagon/) transport reads the `maven.wagon.rto` system property to determine the timeout used when downloading artifacts from a repository. The `lein` script sets that property to be 10000. If that timeout isn't long enough (for example, when using a slow corporate mirror), it can be overridden via `LEIN_JVM_OPTS`:

```bash
export LEIN_JVM_OPTS="-Dmaven.wagon.rto=1800000"
```

## Setting JVM Options

To pass extra arguments to the JVM, set the `:jvm-opts` vector. This will override any default JVM opts set by Leiningen.

```clj
 :jvm-opts ["-Xmx1g"]
```

If you want to pass [compiler options](https://clojure.org/reference/compilation#_compiler_options) to the Clojure compiler, you also do this here.

```text
:jvm-opts ["-Dclojure.compiler.disable-locals-clearing=true"
           "-Dclojure.compiler.elide-meta=[:doc :file :line :added]"
           ; notice the array is not quoted like it would be if you passed it directly on the command line.
           "-Dclojure.compiler.direct-linking=true"]
```

You can also pass options to Leiningen in the `JVM_OPTS` environment variable. If you want to provide the Leiningen JVM with custom options, set them in `LEIN_JVM_OPTS`.

## Running Code

Enough setup; let's see some code running. Start with a REPL (read-eval-print loop):

```
$ cd my-stuff
$ lein repl
nREPL server started on port 55568 on host 127.0.0.1 - nrepl://127.0.0.1:55568
REPL-y 0.5.1, nREPL 0.8.3
Clojure 1.10.1
OpenJDK 64-Bit Server VM 1.8.0_222-b10
    Docs: (doc function-name-here)
          (find-doc "part-of-name-here")
  Source: (source function-name-here)
 Javadoc: (javadoc java-object-or-class-here)
    Exit: Control+D or (exit) or (quit)
 Results: Stored in vars *1, *2, *3, an exception in *e

my-stuff.core=>
```

The REPL is an interactive prompt where you can enter arbitrary code to run in the context of your project. Since we've added `clj-http` to `:dependencies` earlier, we are able to load it here along with code from the `my-stuff.core` namespace in your project's own `src/` directory:

```
my-stuff.core=> (require 'my-stuff.core)
nil
my-stuff.core=> (my-stuff.core/-main)
Hello, World!
nil
my-stuff.core=> (require '[clj-http.client :as http])
nil
my-stuff.core=> (def response (http/get "https://leiningen.org"))
#'my-stuff.core/response
my-stuff.core=> (keys response)
(:status :headers :body :request-time :trace-redirects :orig-content-encoding)
```

The call to `-main` shows both println output ("Hello, World!") and the return value (nil) together.

Built-in documentation is available via `doc`, and you can examine the source of functions with `source`:

```
my-stuff.core=> (source -main)
(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (println "Hello, World!"))
nil

my-stuff.core=> ; use control+d to exit
```

If you already have code in a `-main` function ready to go and don't need to enter code interactively, the `run` task is simpler:

```
$ lein run
Hello, World!
```

Providing a `-m` argument will tell Leiningen to look for the `-main` function in another namespace. Setting a default `:main` in `project.clj` lets you omit `-m`.

For long-running `lein run` processes, you may wish to save memory with the higher-order trampoline task, which allows the Leiningen JVM process to exit before launching your project's JVM.

```
$ lein trampoline run -m my-stuff.server 5000
```

If you have any Java to be compiled in `:java-source-paths` or Clojure namespaces listed in `:aot`, they will always be compiled before Leiningen runs any other code, via any `run`, `repl`, etc. invocations.

## Tests

We haven't written any tests yet, but we can run the failing tests included from the project template:

```
$ lein test

lein test my-stuff.core-test

lein test :only my-stuff.core-test/a-test

FAIL in (a-test) (core_test.clj:7)
FIXME, I fail.
expected: (= 0 1)
  actual: (not (= 0 1))

Ran 1 tests containing 1 assertions.
1 failures, 0 errors.
Tests failed.
```

Once we fill it in the test suite will become more useful. Sometimes if you've got a large test suite you'll want to run just one or two namespaces at a time; `lein test my-stuff.core-test` will do that. You also might want to break up your tests using test selectors; see `lein help test` for more details.

Running `lein test` from the command-line is suitable for regression testing, but the slow startup time of the JVM makes it a poor fit for testing styles that require tighter feedback loops. In these cases, either keep a repl open for running the appropriate call to [clojure.test/run-tests](https://clojuredocs.org/clojure.test/run-tests) or look into editor integration such as [clojure-test-mode](https://github.com/technomancy/clojure-mode).

Keep in mind that while keeping a running process around is convenient, it's easy for that process to get into a state that doesn't reflect the files on disk: functions that are loaded and then deleted from the file will remain in memory, making it easy to miss problems arising from missing functions (often referred to as "getting slimed"). Because of this it's advised to do a `lein test` run with a fresh instance periodically in any case, perhaps before you commit.

## Profiles

Profiles are used to add various things into your project map in different contexts. For instance, during `lein test` runs, the contents of the `:test` profile, if present, will be merged into your project map. You can use this to enable configuration that should only be applied during test runs, either by adding directories containing config files to your classpath via `:resource-paths` or by other means. See `lein help profiles` for more details.

Unless you tell it otherwise, Leiningen will merge the default set of profiles into the project map. This includes user-wide settings from your `:user` profile, the `:dev` profile from `project.clj` if present, and the built-in `:base` profile which contains dev tools like nREPL and optimizations which help startup time at the expense of runtime performance. Never benchmark with the default profiles. (See the FAQ entry for "tiered compilation")

## What to do with it

Generally speaking, there are three different goals that are typical of Leiningen projects:

- An application you can distribute to end-users
- A server-side application
- A library for other Clojure projects to consume

For the first, you typically build an uberjar. For libraries, you will want to have them published to a repository like Clojars or a private repository. For server-side applications it varies as described below. Generating a project with `lein new app myapp` will start you out with a few extra defaults suitable for non-library projects, or you can browse the [available templates on Clojars](https://clojars.org/search?q=lein-template) for things like specific web technologies or other project types.

### Uberjar

The simplest thing to do is to distribute an [uberjar](https://stackoverflow.com/questions/11947037/what-is-an-uber-jar). This is a single standalone executable jar file most suitable for giving to nontechnical users. For this to work you'll need to specify a namespace as your `:main` in `project.clj` and ensure it's also AOT (Ahead Of Time) compiled by adding it to `:aot`. By this point, our `project.clj` file should look like this:

```clj
(defproject my-stuff "0.1.0-SNAPSHOT"
  :description "FIXME: write description"
  :url "https://example.com/FIXME"
  :license {:name "Eclipse Public License"
            :url "https://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.8.0"]
                 [clj-http "2.0.0"]]
  :profiles {:dev {:dependencies [[ring/ring-devel "1.4.0"]]}}
  :main my-stuff.core
  :aot [my-stuff.core])
```

We have also added a development dependency, `ring-devel`. `ring-devel` will not be available in uberjars, and will not be considered a dependency if you publish this project to a repository.

The namespace you specify will need to contain a `-main` function that will get called when your standalone jar is run. This namespace should have a `(:gen-class)` declaration in the `ns` form at the top. The `-main` function will get passed the command-line arguments. Let's try something easy in `src/my_stuff/core.clj`:

```clj
(ns my-stuff.core
  (:gen-class))

(defn -main [& args]
  (println "Welcome to my project! These are your args:" args))
```

Now we're ready to generate your uberjar:

```
$ lein uberjar
Compiling my-stuff.core
Created /home/phil/my-stuff/target/uberjar+uberjar/my-stuff-0.1.0-SNAPSHOT.jar
Created /home/phil/my-stuff/target/uberjar/my-stuff-0.1.0-SNAPSHOT-standalone.jar
```

This creates a single jar file that contains the contents of all your dependencies. Users can run it with a simple `java` invocation, or on some systems just by double-clicking the jar file.

```
$ java -jar my-stuff-0.1.0-SNAPSHOT-standalone.jar Hello world.
Welcome to my project! These are your args: (Hello world.)
```

You can run a regular (non-uber) jar with the `java` command-line tool, but that requires constructing the classpath yourself, so it's not a good solution for end-users.

Of course if your users already have Leiningen installed, you can instruct them to use `lein run` as described above.

### Framework (Uber)jars

Many Java frameworks expect deployment of a jar file or derived archive sub-format containing a subset of the application's necessary dependencies. The framework expects to provide the missing dependencies itself at run-time. Dependencies which are provided by a framework in this fashion may be specified in the `:provided` profile. Such dependencies will be available during compilation, testing, etc., but won't be included by default by the `uberjar` task or plugin tasks intended to produce stable deployment artifacts.

For example, Hadoop job jars may be just regular (uber)jar files containing all dependencies except the Hadoop libraries themselves:

```clj
(project example.hadoop "0.1.0"
  ...
  :profiles {:provided
             {:dependencies
              [[org.apache.hadoop/hadoop-core "1.2.1"]]}}
  :main example.hadoop)
$ lein uberjar
Compiling example.hadoop
Created /home/xmpl/src/example.hadoop/example.hadoop-0.1.0.jar
Created /home/xmpl/src/example.hadoop/example.hadoop-0.1.0-standalone.jar
$ hadoop jar example.hadoop-0.1.0-standalone.jar
12/08/24 08:28:30 INFO util.Util: resolving application jar from found main method on: example.hadoop
12/08/24 08:28:30 INFO flow.MultiMapReducePlanner: using application jar: /home/xmpl/src/example.hadoop/./example.hadoop-0.1.0-standalone.jar
...
```

Plugins are required to generate framework deployment jar derivatives (such as [war files](https://en.wikipedia.org/wiki/WAR_(file_format))) which include additional metadata, but the `:provided` profile provides a general mechanism for handling the framework dependencies.

### Server-side Projects

There are many ways to get your project deployed as a server-side application. Aside from the obvious uberjar approach, simple programs can be packaged up as [tarballs](https://en.wikipedia.org/wiki/Tar_(computing)) with accompanied shell scripts using the [lein-tar plugin](https://github.com/technomancy/lein-tar) and then deployed using [pallet](http://palletops.com/), [chef](https://chef.io/), or other mechanisms.

Web applications may be deployed as uberjars using embedded Jetty with `ring-jetty-adapter` or as [war (web application archive) files](https://en.wikipedia.org/wiki/WAR_(file_format)) created by the [lein-ring plugin](https://github.com/weavejester/lein-ring). For things beyond uberjars, server-side deployments are so varied that they are better-handled using plugins rather than tasks that are built-in to Leiningen itself.

It's possible to involve Leiningen during production, but there are many subtle gotchas to that approach; it's strongly recommended to use an uberjar if you can. If you need to launch with the `run` task, you should use `lein trampoline run` in order to save memory, otherwise Leiningen's own JVM will stay up and consume unnecessary memory.

In addition it's very important to ensure you take steps to freeze all the dependencies before deploying, otherwise it could be easy to end up with [unrepeatable deployments](https://codeberg.org/leiningen/leiningen/wiki/Repeatability). Consider including `~/.m2/repository` in your unit of deployment (tarball, .deb file, etc) along with your project code. It's recommended to use Leiningen to create a deployable artifact in a continuous integration setting. For example, you could have a [Jenkins](https://jenkins-ci.org/) CI server run your project's full test suite, and if it passes, upload a tarball to S3. Then deployment is just a matter of pulling down and extracting the known-good tarball on your production servers. Simply launching Leiningen from a checkout on the server will work for the most basic deployments, but as soon as you get a number of servers you run the risk of running with a heterogeneous cluster since you're not guaranteed that each machine will be running with the exact same codebase.

Also remember that the default profiles are included unless you specify otherwise, which is not suitable for production. Using `lein trampoline with-profile production run -m myapp.main` is recommended. By default the production profile is empty, but if your deployment includes the `~/.m2/repository` directory from the CI run that generated the tarball, then you should add its path as `:local-repo` along with `:offline? true` to the `:production` profile. Staying offline prevents the deployed project from diverging at all from the version that was tested in the CI environment.

Given these pitfalls, it's best to use an uberjar if possible.

### Publishing Libraries

If your project is a library and you would like others to be able to use it as a dependency in their projects, you will need to get it into a public repository. While it's possible to [maintain your own private repository](https://codeberg.org/leiningen/leiningen/src/stable/doc/DEPLOY.md) or get it into [Central](https://search.maven.org/), the easiest way is to publish it at [Clojars](https://clojars.org/). Once you have [created an account](https://clojars.org/register) there, publishing is straightforward. You'll need to have a [verified group name](https://github.com/clojars/clojars-web/wiki/Groups), but you get some for free just for having a Clojars account. You'll need to change the name of your project to include the group name. Edit the first line of your `project.clj` to look like:

```clj
(defproject org.clojars.my-clojars-username/my-stuff "0.1.0-SNAPSHOT"
  :description "FIXME: write description"
  ...
```

Clojars doesn't use passwords, so you'll need to [generate a deploy token](https://github.com/clojars/clojars-web/wiki/Deploy-Tokens). Once you have that, you are ready to deploy:

```
$ lein deploy clojars
No credentials found for clojars
See `lein help deploying` for how to configure credentials to avoid prompts.
Username: me
Password:
Created ~/src/my-stuff/target/my-stuff-0.1.0-SNAPSHOT.jar
Wrote ~/src/my-stuff/pom.xml
Retrieving org/clojars/my-clojars-username/my-stuff/0.1.0-SNAPSHOT/maven-metadata.xml
    from https://repo.clojars.org/
Sending org/clojars/my-clojars-username/my-stuff/0.1.0-SNAPSHOT/my-stuff-0.1.0-20190525.161117-2.jar (9k)
    to https://repo.clojars.org/
Sending org/clojars/my-clojars-username/my-stuff/0.1.0-SNAPSHOT/my-stuff-0.1.0-20190525.161117-2.pom (2k)
    to https://repo.clojars.org/
Retrieving org/clojars/my-clojars-username/my-stuff/maven-metadata.xml
    from https://repo.clojars.org/
Sending org/clojars/my-clojars-username/my-stuff/0.1.0-SNAPSHOT/maven-metadata.xml (1k)
    to https://repo.clojars.org/
Sending org/clojars/my-clojars-username/my-stuff/maven-metadata.xml (1k)
    to https://repo.clojars.org/
```

Once that succeeds it will be available as a package on which other projects may depend. For instructions on storing your credentials so they don't have to be re-entered every time, see `lein help deploying`. When deploying a release that's not a snapshot, Leiningen will attempt to sign it using [GPG](https://gnupg.org/) or [SSH](https://www.agwa.name/blog/post/ssh_signatures) to prove your authorship of the release. See the [deploy guide](https://codeberg.org/leiningen/leiningen/src/stable/doc/DEPLOY.md) for details of how to set that up. The deploy guide includes instructions for deploying to other repositories as well.

## That's It!

Now go start coding your next project!