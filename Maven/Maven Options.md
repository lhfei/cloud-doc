## Maven CLI Options Reference

| **Options**                      | **Description**                                              |
| -------------------------------- | :----------------------------------------------------------- |
| `-am,--also-make`                | If project list is specified, also build projects required by the list |
| `-amd,--also-make-dependents`    | If project list is specified, also build projects that depend on projects on the list |
| `-B,--batch-mode`                | Run in non-interactive (batch) mode (disables output color)  |
| `-b,--builder`                   | The id of the build strategy to use                          |
| `-C,--strict-checksums`          | Fail the build if checksums don't match                      |
| `-c,--lax-checksums`             | Warn if checksums don't match                                |
| `-cpu,--check-plugin-updates`    | Ineffective, only kept for backward compatibility            |
| `-D,--define`                    | Define a system property                                     |
| `-e,--errors`                    | Produce execution error messages                             |
| `-emp,--encrypt-master-password` | Encrypt master security password                             |
| `-ep,--encrypt-password`         | Encrypt server password                                      |
| `-f,--file`                      | Force the use of an alternate POM file (or directory with pom.xml) |
| `-fae,--fail-at-end`             | Only fail the build afterwards; allow all non-impacted builds to continue |
| `-ff,--fail-fast`                | Stop at first failure in reactorized builds                  |
| `-fn,--fail-never`               | NEVER fail the build, regardless of project result           |
| `-gs,--global-settings`          | Alternate path for the global settings file                  |
| `-gt,--global-toolchains`        | Alternate path for the global toolchains file                |
| `-h,--help`                      | Display help information                                     |
| `-l,--log-file`                  | Log file where all build output will go (disables output color) |
| `-llr,--legacy-local-repository` | Use Maven 2 Legacy Local Repository behaviour, ie no use of _remote.repositories. Can also be activated by using -Dmaven.legacyLocalRepo=true |
| `-N,--non-recursive`             | Do not recurse into sub-projects                             |
| `-npr,--no-plugin-registry`      | Ineffective, only kept for backward compatibility            |
| `-npu,--no-plugin-updates`       | Ineffective, only kept for backward compatibility            |
| `-nsu,--no-snapshot-updates`     | Suppress SNAPSHOT updates                                    |
| `-o,--offline`                   | Work offline                                                 |
| `-P,--activate-profiles`         | Comma-delimited list of profiles to activate                 |
| `-pl,--projects`                 | Comma-delimited list of specified reactor projects to build instead of all projects. A project can be specified by [groupId]:artifactId or by its relative path |
| `-q,--quiet`                     | Quiet output - only show errors                              |
| `-rf,--resume-from`              | Resume reactor from specified project                        |
| `-s,--settings`                  | Alternate path for the user settings file                    |
| `-t,--toolchains`                | Alternate path for the user toolchains file                  |
| `-T,--threads`                   | Thread count, for instance 2.0C where C is core multiplied   |
| `-U,--update-snapshots`          | Forces a check for missing releases and updated snapshots on remote repositories |
| `-up,--update-plugins`           | Ineffective, only kept for backward compatibility            |
| `-v,--version`                   | Display version information                                  |
| `-V,--show-version`              | Display version information WITHOUT stopping build           |
| `-X,--debug`                     | Produce execution debug output                               |