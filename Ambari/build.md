
https://cwiki.apache.org/confluence/display/AMBARI/Ambari+Development

## Ambari Web Frontend Development Environment

### Application Assembler: Brunch

We use Brunch as the client-side application assembler: [http://brunch.io](http://brunch.io/)

- Brunch was used to create the application skeleton for Ambari Web.
- Brunch builds and deploys code automatically in the background as you modify the source files. This lets you break up the application into a number of JS files for code organization and reuse without worrying about development turnaround or runtime load performance.
- Run a Node.js-based web server with a single command so that you can easily run Ambari Web without setting up Ambari Server (you still need to run Ambari Server for true end-to-end testing).

To check out Ambari Web from the Github repository and run it:

- Install Node.js from [http://nodejs.org](http://nodejs.org/)

- Execute the following:

  *Prepared*:

  ```shell
  sudo yum install bizp2
  ```

​      *Prepared:*
  ```shell
git clone https://git-wip-us.apache.org/repos/asf/ambari.git
cd ambari/ambari-web
sudo npm install -g brunch@1.7.20
rm -rf node_modules public
npm install
brunch build
  ```



To run the web server in isolation with Ambari Server: 

```
brunch watch --server (or use the shorthand: brunch w -s)
```

The above runs Ambari Web with a local test server at localhost:3333. The login/password is admin/admin

All Ambari front-end developers are highly recommended to use PhpStorm by JetBrains. JetBrains has kindly granted Apache Ambari an open-source license for PhpStorm and IntelliJ.  These products are available to Ambari committers (if you are an Ambari committer, email [private@ambari.apache.org](mailto:private@ambari.apache.org) to request license keys). You can also use Eclipse if that is your preference. 

- IDE Plugins

Go to Preferences->Plugins->Browse repositories and install “Node.js” and “Handlebars” plugins.

[More info.](https://cwiki.apache.org/confluence/display/AMBARI/Coding+Guidelines+for+Ambari)