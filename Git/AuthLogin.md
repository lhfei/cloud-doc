### Install Auth Login

### MacOS

`gh` is available via [Homebrew](https://brew.sh/), [MacPorts](https://www.macports.org/), [Conda](https://docs.conda.io/en/latest/), [Spack](https://spack.io/), and as a downloadable binary from the [releases page](https://github.com/cli/cli/releases/latest).

#### Homebrew

| Install:          | Upgrade:          |
| ----------------- | ----------------- |
| `brew install gh` | `brew upgrade gh` |

#### MacPorts

| Install:               | Upgrade:                                       |
| ---------------------- | ---------------------------------------------- |
| `sudo port install gh` | `sudo port selfupdate && sudo port upgrade gh` |

#### Conda

| Install:                                 | Upgrade:                                |
| ---------------------------------------- | --------------------------------------- |
| `conda install gh --channel conda-forge` | `conda update gh --channel conda-forge` |

Additional Conda installation options available on the [gh-feedstock page](https://github.com/conda-forge/gh-feedstock#installing-gh).

#### Spack

| Install:           | Upgrade:                                 |
| ------------------ | ---------------------------------------- |
| `spack install gh` | `spack uninstall gh && spack install gh` |

### Linux & BSD

`gh` is available via:

- [our Debian and RPM repositories](https://github.com/cli/cli/blob/trunk/docs/install_linux.md);
- community-maintained repositories in various Linux distros;
- OS-agnostic package managers such as [Homebrew](https://github.com/cli/cli#homebrew), [Conda](https://github.com/cli/cli#conda), and [Spack](https://github.com/cli/cli#spack); and
- our [releases page](https://github.com/cli/cli/releases/latest) as precompiled binaries.

For more information, see [Linux & BSD installation](https://github.com/cli/cli/blob/trunk/docs/install_linux.md).

### Windows

`gh` is available via [WinGet](https://github.com/microsoft/winget-cli), [scoop](https://scoop.sh/), [Chocolatey](https://chocolatey.org/), [Conda](https://github.com/cli/cli#conda), and as downloadable MSI.

#### WinGet

| Install:                         | Upgrade:                         |
| -------------------------------- | -------------------------------- |
| `winget install --id GitHub.cli` | `winget upgrade --id GitHub.cli` |

> Note
> The Windows installer modifies your PATH. When using Windows Terminal, you will need to **open a new window** for the changes to take affect. (Simply opening a new tab will *not* be sufficient.)

#### scoop

| Install:           | Upgrade:          |
| ------------------ | ----------------- |
| `scoop install gh` | `scoop update gh` |

#### Chocolatey

| Install:           | Upgrade:           |
| ------------------ | ------------------ |
| `choco install gh` | `choco upgrade gh` |

#### Signed MSI

MSI installers are available for download on the [releases page](https://github.com/cli/cli/releases/latest).



#### Example

```ini
gh auth login
? What account do you want to log into? GitHub.com
? What is your preferred protocol for Git operations? HTTPS
? Authenticate Git with your GitHub credentials? Yes
? How would you like to authenticate GitHub CLI? Paste an authentication token
Tip: you can generate a Personal Access Token here https://github.com/settings/tokens
The minimum required scopes are 'repo', 'read:org', 'workflow'.
? Paste your authentication token: ****************************************
- gh config set -h github.com git_protocol https
✓ Configured git protocol
✓ Logged in as lhfei
```

