# Getting Started

Table of Contents

- [Dependencies](https://www.clojure.org/guides/getting_started#_dependencies)
- Clojure installer and CLI tools
  - [Installation on Mac via Homebrew](https://www.clojure.org/guides/getting_started#_installation_on_mac_via_homebrew)
  - [Installation on Linux](https://www.clojure.org/guides/getting_started#_installation_on_linux)
  - [Installation on Windows](https://www.clojure.org/guides/getting_started#_installation_on_windows)
  - [Other versions](https://www.clojure.org/guides/getting_started#_other_versions)
- [Other ways to run Clojure](https://www.clojure.org/guides/getting_started#_other_ways_to_run_clojure)
- [Next steps](https://www.clojure.org/guides/getting_started#_next_steps)

Welcome to Clojure!

Check out [Learn Clojure](https://www.clojure.org/guides/learn/syntax), [Resources](https://www.clojure.org/community/resources), or [Books](https://www.clojure.org/community/books) to learn the language! If you have questions, you can search or ask at the official forum [Ask Clojure](https://ask.clojure.org/).

## Dependencies

Clojure requires Java. Clojure officially supports Java LTS releases (currently Java 8 and Java 11), but also tries to ensure interim versions work as well. You can use any Java installation, whether it’s a commercial release from Oracle or an open source version based on OpenJDK (like adoptopenjdk).

The Clojure tools require that either the `java` command is on the path or that the `JAVA_HOME` environment variable is set.

## Clojure installer and CLI tools

Clojure provides [command line tools](https://www.clojure.org/guides/deps_and_cli) that can be used to start a Clojure repl, use Clojure and Java libraries, and start Clojure programs.

Follow these instructions to install the latest release of the `clj` and `clojure` tools:

### Installation on Mac via [Homebrew](https://brew.sh/)

Install the command line tools with `brew` from the [clojure/tools tap](https://github.com/clojure/homebrew-tools):

```
brew install clojure/tools/clojure
```

If you’ve already installed this way in the past, you can upgrade to the latest release with:

```
brew upgrade clojure/tools/clojure
```

### Installation on Linux

To install with the Linux script installer:

1. Ensure that the following dependencies are installed: `bash`, `curl`, `rlwrap`, and `Java`.
2. Use the `linux-install` script to download and run the install, which will create the executables `/usr/local/bin/clj`, `/usr/local/bin/clojure`, and the directory `/usr/local/lib/clojure`:

```
curl -O https://download.clojure.org/install/linux-install-1.10.3.998.sh
chmod +x linux-install-1.10.3.998.sh
sudo ./linux-install-1.10.3.998.sh
```

#### Custom location

To install to a custom location (like `/opt/infrastructure/clojure`), use the option `--prefix`:

```
sudo ./linux-install-1.10.3.998.sh --prefix /opt/infrastructure/clojure
```

Extend the MANPATH in `/etc/man_db.conf` to include the manual pages:

```
MANPATH_MAP /opt/infrastructure/clojure/bin /opt/infrastructure/clojure/man
```

The `linux-install` script can be removed after installation.

### Installation on Windows

An early release version of clj on Windows is available at [clj on Windows](https://github.com/clojure/tools.deps.alpha/wiki/clj-on-Windows). Please provide feedback on [Ask Clojure](https://ask.clojure.org/) or Clojurians slack in #clj-on-windows.

### Other versions

See the [changelog](https://www.clojure.org/releases/tools) for version history and the [Clojure tap](https://github.com/clojure/homebrew-tools) for info on installing older versions or newer prereleases instead.

## Other ways to run Clojure

**Local build**

Most Clojure users use Clojure jars downloaded from the Maven central repository (by the tools above or other Clojure build tools). However, you can also build Clojure from source with necessary dependent jars into a single executable jar (requires Git, Java, and Maven):

```
git clone https://github.com/clojure/clojure.git
cd clojure
mvn -Plocal -Dmaven.test.skip=true package
```

Then start the REPL with the local jar (note this will not work with the jars in Maven as they do not include dependencies):

```
java -jar clojure.jar
```

**Try Clojure online**

[repl.it](https://repl.it/languages/clojure) provides a browser-based Clojure repl for interactive exploration.

## Next steps

- [Install editors and build tools](https://www.clojure.org/community/tools)
- [Start learning the Clojure basics](https://www.clojure.org/guides/learn/syntax)
- [Learn Clojure from a book](https://www.clojure.org/community/books)
- [Explore Clojure communities and resources](https://www.clojure.org/community/resources)
- [Ask questions about Clojure](https://ask.clojure.org/)