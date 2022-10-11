### [Working with Deps](https://cursive-ide.com/userguide/deps.html)

C:\Program Files\WindowsPowerShell\Modules\ClojureTools



# [clj on Windows](https://github.com/clojure/tools.deps.alpha/wiki/clj-on-Windows)

[Edit](https://github.com/clojure/tools.deps.alpha/wiki/clj-on-Windows/_edit)[New page](https://github.com/clojure/tools.deps.alpha/wiki/_new)

Alex Miller edited this page on Apr 25 · [64 revisions](https://github.com/clojure/tools.deps.alpha/wiki/clj-on-Windows/_history)

###  Pages 4

- <details class="details-reset" style="box-sizing: border-box; display: block;"><summary style="box-sizing: border-box; display: list-item; cursor: pointer; list-style: none; transition: color 80ms cubic-bezier(0.33, 1, 0.68, 1) 0s, background-color, box-shadow, border-color;"><div class="d-flex flex-items-start" style="box-sizing: border-box; align-items: flex-start !important; display: flex !important;"><div class="p-2 mt-n1 mb-n1 ml-n1 btn btn-octicon js-wiki-sidebar-toc-toggle-chevron-button " style="box-sizing: border-box; position: relative; display: inline-block; padding: 8px !important; font-size: 14px; font-weight: 500; line-height: 1; white-space: nowrap; vertical-align: middle; cursor: pointer; user-select: none; border: 0px; border-radius: 6px; appearance: none; color: var(--color-fg-muted); background: transparent; box-shadow: none; transition: color 80ms cubic-bezier(0.33, 1, 0.68, 1) 0s, background-color, box-shadow, border-color; margin-left: -4px !important; margin-top: -4px !important; margin-bottom: -4px !important;"><svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-triangle-down js-wiki-sidebar-toc-toggle-chevron  mr-0"><path d="M4.427 7.427l3.396 3.396a.25.25 0 00.354 0l3.396-3.396A.25.25 0 0011.396 7H4.604a.25.25 0 00-.177.427z"></path></svg></div><a class="flex-1 py-1 text-bold" href="https://github.com/clojure/tools.deps.alpha/wiki" style="box-sizing: border-box; background-color: transparent; color: var(--color-accent-fg); text-decoration: none; flex-grow: 1 !important; flex-shrink: 1 !important; flex-basis: 0%; padding-top: 4px !important; padding-bottom: 4px !important; font-weight: 600 !important;">Home</a></div></summary></details>

- <details class="details-reset" open="" style="box-sizing: border-box; display: block;"><summary style="box-sizing: border-box; display: list-item; cursor: pointer; list-style: none; transition: color 80ms cubic-bezier(0.33, 1, 0.68, 1) 0s, background-color, box-shadow, border-color;"><div class="d-flex flex-items-start" style="box-sizing: border-box; align-items: flex-start !important; display: flex !important;"><div class="p-2 mt-n1 mb-n1 ml-n1 btn btn-octicon js-wiki-sidebar-toc-toggle-chevron-button " style="box-sizing: border-box; position: relative; display: inline-block; padding: 8px !important; font-size: 14px; font-weight: 500; line-height: 1; white-space: nowrap; vertical-align: middle; cursor: pointer; user-select: none; border: 0px; border-radius: 6px; appearance: none; color: var(--color-fg-muted); background: transparent; box-shadow: none; transition: color 80ms cubic-bezier(0.33, 1, 0.68, 1) 0s, background-color, box-shadow, border-color; margin-left: -4px !important; margin-top: -4px !important; margin-bottom: -4px !important;"><svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-triangle-down js-wiki-sidebar-toc-toggle-chevron js-wiki-sidebar-toc-toggle-chevron-open mr-0"><path d="M4.427 7.427l3.396 3.396a.25.25 0 00.354 0l3.396-3.396A.25.25 0 0011.396 7H4.604a.25.25 0 00-.177.427z"></path></svg></div><a class="flex-1 py-1 text-bold" href="https://github.com/clojure/tools.deps.alpha/wiki/clj-on-Windows" style="box-sizing: border-box; background-color: transparent; color: var(--color-accent-fg); text-decoration: none; flex-grow: 1 !important; flex-shrink: 1 !important; flex-basis: 0%; padding-top: 4px !important; padding-bottom: 4px !important; font-weight: 600 !important;">clj on Windows</a></div></summary><ul class="list-style-none mx-4 px-1" style="box-sizing: border-box; padding-left: 4px !important; margin-top: 0px; margin-bottom: 0px; margin-right: 24px !important; margin-left: 24px !important; padding-right: 4px !important; list-style: none !important;"><li class="my-2" style="box-sizing: border-box; margin-top: 8px !important; margin-bottom: 8px !important; padding-left: 12px;"><a class="Link--primary" data-analytics-event="{&quot;category&quot;:&quot;Wiki&quot;,&quot;action&quot;:&quot;toc_click&quot;,&quot;label&quot;:null}" href="https://github.com/clojure/tools.deps.alpha/wiki/clj-on-Windows#install" style="box-sizing: border-box; background-color: transparent; color: var(--color-fg-default)  !important; text-decoration: none;">Install</a></li><li class="my-2" style="box-sizing: border-box; margin-top: 8px !important; margin-bottom: 8px !important; padding-left: 12px;"><a class="Link--primary" data-analytics-event="{&quot;category&quot;:&quot;Wiki&quot;,&quot;action&quot;:&quot;toc_click&quot;,&quot;label&quot;:null}" href="https://github.com/clojure/tools.deps.alpha/wiki/clj-on-Windows#run" style="box-sizing: border-box; background-color: transparent; color: var(--color-fg-default)  !important; text-decoration: none;">Run</a></li><li class="my-2" style="box-sizing: border-box; margin-top: 8px !important; margin-bottom: 8px !important; padding-left: 24px;"><a class="Link--primary" data-analytics-event="{&quot;category&quot;:&quot;Wiki&quot;,&quot;action&quot;:&quot;toc_click&quot;,&quot;label&quot;:null}" href="https://github.com/clojure/tools.deps.alpha/wiki/clj-on-Windows#escaping-quotes" style="box-sizing: border-box; background-color: transparent; color: var(--color-fg-default)  !important; text-decoration: none;">Escaping Quotes</a></li><li class="my-2" style="box-sizing: border-box; margin-top: 8px !important; margin-bottom: 8px !important; padding-left: 12px;"><a class="Link--primary" data-analytics-event="{&quot;category&quot;:&quot;Wiki&quot;,&quot;action&quot;:&quot;toc_click&quot;,&quot;label&quot;:null}" href="https://github.com/clojure/tools.deps.alpha/wiki/clj-on-Windows#known-issues" style="box-sizing: border-box; background-color: transparent; color: var(--color-fg-default)  !important; text-decoration: none;">Known issues</a></li><li class="my-2" style="box-sizing: border-box; margin-top: 8px !important; margin-bottom: 8px !important; padding-left: 24px;"><a class="Link--primary" data-analytics-event="{&quot;category&quot;:&quot;Wiki&quot;,&quot;action&quot;:&quot;toc_click&quot;,&quot;label&quot;:null}" href="https://github.com/clojure/tools.deps.alpha/wiki/clj-on-Windows#install-fails-due-to-permission-errors" style="box-sizing: border-box; background-color: transparent; color: var(--color-fg-default)  !important; text-decoration: none;">Install fails due to permission errors</a></li><li class="my-2" style="box-sizing: border-box; margin-top: 8px !important; margin-bottom: 8px !important; padding-left: 24px;"><a class="Link--primary" data-analytics-event="{&quot;category&quot;:&quot;Wiki&quot;,&quot;action&quot;:&quot;toc_click&quot;,&quot;label&quot;:null}" href="https://github.com/clojure/tools.deps.alpha/wiki/clj-on-Windows#install-fails-in-zip-expansion" style="box-sizing: border-box; background-color: transparent; color: var(--color-fg-default)  !important; text-decoration: none;">Install fails in zip expansion</a></li><li class="my-2" style="box-sizing: border-box; margin-top: 8px !important; margin-bottom: 8px !important; padding-left: 24px;"><a class="Link--primary" data-analytics-event="{&quot;category&quot;:&quot;Wiki&quot;,&quot;action&quot;:&quot;toc_click&quot;,&quot;label&quot;:null}" href="https://github.com/clojure/tools.deps.alpha/wiki/clj-on-Windows#quoted-strings-in--sdeps-argument-not-handled-correctly" style="box-sizing: border-box; background-color: transparent; color: var(--color-fg-default)  !important; text-decoration: none;">Quoted strings in -Sdeps argument not handled correctly</a></li><li class="my-2" style="box-sizing: border-box; margin-top: 8px !important; margin-bottom: 8px !important; padding-left: 24px;"><a class="Link--primary" data-analytics-event="{&quot;category&quot;:&quot;Wiki&quot;,&quot;action&quot;:&quot;toc_click&quot;,&quot;label&quot;:null}" href="https://github.com/clojure/tools.deps.alpha/wiki/clj-on-Windows#long-classpath" style="box-sizing: border-box; background-color: transparent; color: var(--color-fg-default)  !important; text-decoration: none;">Long classpath</a></li><li class="my-2" style="box-sizing: border-box; margin-top: 8px !important; margin-bottom: 8px !important; padding-left: 24px;"><a class="Link--primary" data-analytics-event="{&quot;category&quot;:&quot;Wiki&quot;,&quot;action&quot;:&quot;toc_click&quot;,&quot;label&quot;:null}" href="https://github.com/clojure/tools.deps.alpha/wiki/clj-on-Windows#failing-to-download" style="box-sizing: border-box; background-color: transparent; color: var(--color-fg-default)  !important; text-decoration: none;">Failing to download</a></li><li class="my-2" style="box-sizing: border-box; margin-top: 8px !important; margin-bottom: 8px !important; padding-left: 12px;"><a class="Link--primary" data-analytics-event="{&quot;category&quot;:&quot;Wiki&quot;,&quot;action&quot;:&quot;toc_click&quot;,&quot;label&quot;:null}" href="https://github.com/clojure/tools.deps.alpha/wiki/clj-on-Windows#questions" style="box-sizing: border-box; background-color: transparent; color: var(--color-fg-default)  !important; text-decoration: none;">Questions</a></li></ul></details>

- <details class="details-reset" style="box-sizing: border-box; display: block;"><summary style="box-sizing: border-box; display: list-item; cursor: pointer; list-style: none; transition: color 80ms cubic-bezier(0.33, 1, 0.68, 1) 0s, background-color, box-shadow, border-color;"><div class="d-flex flex-items-start" style="box-sizing: border-box; align-items: flex-start !important; display: flex !important;"><div class="p-2 mt-n1 mb-n1 ml-n1 btn btn-octicon js-wiki-sidebar-toc-toggle-chevron-button " style="box-sizing: border-box; position: relative; display: inline-block; padding: 8px !important; font-size: 14px; font-weight: 500; line-height: 1; white-space: nowrap; vertical-align: middle; cursor: pointer; user-select: none; border: 0px; border-radius: 6px; appearance: none; color: var(--color-fg-muted); background: transparent; box-shadow: none; transition: color 80ms cubic-bezier(0.33, 1, 0.68, 1) 0s, background-color, box-shadow, border-color; margin-left: -4px !important; margin-top: -4px !important; margin-bottom: -4px !important;"><svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-triangle-down js-wiki-sidebar-toc-toggle-chevron  mr-0"><path d="M4.427 7.427l3.396 3.396a.25.25 0 00.354 0l3.396-3.396A.25.25 0 0011.396 7H4.604a.25.25 0 00-.177.427z"></path></svg></div><a class="flex-1 py-1 text-bold" href="https://github.com/clojure/tools.deps.alpha/wiki/SSH-Authentication-in-Docker" style="box-sizing: border-box; background-color: transparent; color: var(--color-accent-fg); text-decoration: none; flex-grow: 1 !important; flex-shrink: 1 !important; flex-basis: 0%; padding-top: 4px !important; padding-bottom: 4px !important; font-weight: 600 !important;">SSH Authentication in Docker</a></div></summary></details>

- <details class="details-reset" style="box-sizing: border-box; display: block;"><summary style="box-sizing: border-box; display: list-item; cursor: pointer; list-style: none; transition: color 80ms cubic-bezier(0.33, 1, 0.68, 1) 0s, background-color, box-shadow, border-color;"><div class="d-flex flex-items-start" style="box-sizing: border-box; align-items: flex-start !important; display: flex !important;"><div class="p-2 mt-n1 mb-n1 ml-n1 btn btn-octicon js-wiki-sidebar-toc-toggle-chevron-button " style="box-sizing: border-box; position: relative; display: inline-block; padding: 8px !important; font-size: 14px; font-weight: 500; line-height: 1; white-space: nowrap; vertical-align: middle; cursor: pointer; user-select: none; border: 0px; border-radius: 6px; appearance: none; color: var(--color-fg-muted); background: transparent; box-shadow: none; transition: color 80ms cubic-bezier(0.33, 1, 0.68, 1) 0s, background-color, box-shadow, border-color; margin-left: -4px !important; margin-top: -4px !important; margin-bottom: -4px !important;"><svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-triangle-down js-wiki-sidebar-toc-toggle-chevron  mr-0"><path d="M4.427 7.427l3.396 3.396a.25.25 0 00.354 0l3.396-3.396A.25.25 0 0011.396 7H4.604a.25.25 0 00-.177.427z"></path></svg></div><a class="flex-1 py-1 text-bold" href="https://github.com/clojure/tools.deps.alpha/wiki/Tools" style="box-sizing: border-box; background-color: transparent; color: var(--color-accent-fg); text-decoration: none; flex-grow: 1 !important; flex-shrink: 1 !important; flex-basis: 0%; padding-top: 4px !important; padding-bottom: 4px !important; font-weight: 600 !important;">Tools</a></div></summary></details>

[ Add a custom sidebar](https://github.com/clojure/tools.deps.alpha/wiki/_new?wiki[name]=_Sidebar)

##### Clone this wiki locally



Currently, `clj` on Windows is in an alpha state. Please try it and provide feedback in the [TDEPS](https://dev.clojure.org/jira/browse/TDEPS) jira or on #clj-on-windows room on [Clojurians slack](http://clojurians.net/).

## Install

Make sure [PowerShell 5](https://aka.ms/wmf5download) (or later, include [PowerShell Core](https://aka.ms/pscore6)) and [.NET Core SDK 2.1+ or .NET Framework 4.5+](https://www.microsoft.com/net/download) (or later) are installed. Also install Java 8+ and set JAVA_HOME in your environment variables. Then run:

```
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://download.clojure.org/install/win-install-1.11.1.1113.ps1')
```

or shorter

```
iwr -useb download.clojure.org/install/win-install-1.11.1.1113.ps1 | iex
```

Alternatively, download the latest version of the installer and run the downloaded copy:

- https://download.clojure.org/install/win-install-1.11.1.1113.ps1

If this Clojure version is out of date, look for the Linux version on [Getting Started](https://www.clojure.org/guides/getting_started) and replace the version from there into the url. I.e. "https://download.clojure.org/install/win-install-1.11.1.1113.ps1" could become "https://download.clojure.org/install/win-install-1.11.1.1113.ps1"

When you run the installer, you will be prompted with several possible install locations:

```
PS Y:\Downloads> .\win-install-1.11.1.1113.ps1
Downloading Clojure tools
WARNING: Clojure will install as a module in your PowerShell module path.

Possible install locations:
  1) \\Drive\Home\Documents\WindowsPowerShell\Modules
  2) C:\Program Files\WindowsPowerShell\Modules
  3) C:\WINDOWS\system32\WindowsPowerShell\v1.0\Modules\
Enter number of preferred install location: 1

Cleaning up existing install
Installing PowerShell module
Removing download
Clojure now installed. Use "clj -h" for help.
```

When choosing which location to install consider these tradeoffs:

- \#1 can be installed without admin privileges but will create a directory in Documents
- \#2 and 3 should probably be run only if you have admin privileges

## Run

If you are using Windows PowerShell, invoke via `clj` or `clojure`. Do not use Powershell ISE.

If you need to run outside powershell, for example from the old Windows Command Prompt or [Git Bash](https://gitforwindows.org/), try:

```
powershell -command clj 
```

With command line argument:

```
powershell -command clj '-J"-Dfile.encoding=UTF-8"'
```

### Escaping Quotes

Escaping quotes can be a bit tricky. Here is the same command in different shells:

PowerShell

```
clj -Sdeps '{:deps {viebel/klipse-repl {:mvn/version ""0.2.3""}}}' -m klipse-repl.main
```

Command Prompt

```
powershell -command clj -Sdeps '{:deps {viebel/klipse-repl {:mvn/version """"""0.2.3""""""}}}' -m klipse-repl.main
```

Git Bash

```
powershell -command 'clj -Sdeps "{:deps {viebel/klipse-repl {:mvn/version """"0.2.3""""}}}" -m klipse-repl.main'
```

## 



### Issues



```ini
clj : The 'clj' command was found in the module 'ClojureTools', but the module could not be loaded. For more
information, run 'Import-Module ClojureTools'.
At line:1 char:1
+ clj
+ ~~~
    + CategoryInfo          : ObjectNotFound: (clj:String) [], ParentContainsErrorRecordException
    + FullyQualifiedErrorId : CouldNotAutoloadMatchingModule
```



```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
```

