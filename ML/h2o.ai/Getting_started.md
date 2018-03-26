# H2O

**

```
java -jar h2o.jar -[args]

  -- args:
  
    -context_path
    -port
    -baseport
    -nthreads
    -hdfs_config
    -jks
    -jks_pass
    -log_level
    

```



*h2o.ai/h2o-3/h2o-core/src/main/java/water/H2O.java*

```java
static OptArgs parseH2OArgumentsTo(String[] args, OptArgs trgt) {
    for (int i = 0; i < args.length; i++) {
      OptString s = new OptString(args[i]);
      if (s.matches("h") || s.matches("help")) {
        trgt.help = true;
      }
      else if (s.matches("version")) {
        trgt.version = true;
      }
      else if (s.matches("name")) {
        i = s.incrementAndCheck(i, args);
        trgt.name = args[i];
      }
      else if (s.matches("flatfile")) {
        i = s.incrementAndCheck(i, args);
        trgt.flatfile = args[i];
      }
      else if (s.matches("port")) {
        i = s.incrementAndCheck(i, args);
        trgt.port = s.parsePort(args[i]);
      }
      else if (s.matches("baseport")) {
        i = s.incrementAndCheck(i, args);
        trgt.baseport = s.parsePort(args[i]);
      }
      else if (s.matches("ip")) {
        i = s.incrementAndCheck(i, args);
        trgt.ip = args[i];
      }
      else if (s.matches("web_ip")) {
        i = s.incrementAndCheck(i, args);
        trgt.web_ip = args[i];
      }
      else if (s.matches("network")) {
        i = s.incrementAndCheck(i, args);
        trgt.network = args[i];
      }
      else if (s.matches("client")) {
        trgt.client = true;
      }
      else if (s.matches("user_name")) {
        i = s.incrementAndCheck(i, args);
        trgt.user_name = args[i];
      }
      else if (s.matches("ice_root")) {
        i = s.incrementAndCheck(i, args);
        trgt.ice_root = args[i];
      }
      else if (s.matches("log_dir")) {
        i = s.incrementAndCheck(i, args);
        trgt.log_dir = args[i];
      }
      else if (s.matches("flow_dir")) {
        i = s.incrementAndCheck(i, args);
        trgt.flow_dir = args[i];
      }
      else if (s.matches("disable_web")) {
        trgt.disable_web = true;
      }
      else if (s.matches("context_path")) {
        i = s.incrementAndCheck(i, args);
        String value = args[i];
        trgt.context_path = value.startsWith("/")
                            ? value.trim().length() == 1
                              ? "" : value
                            : "/" + value;
      }
      else if (s.matches("nthreads")) {
        i = s.incrementAndCheck(i, args);
        int nthreads = s.parseInt(args[i]);
        if (nthreads >= 1) { //otherwise keep default (all cores)
          if (nthreads > Short.MAX_VALUE)
            throw H2O.unimpl("Can't handle more than " + Short.MAX_VALUE + " threads.");
          trgt.nthreads = (short) nthreads;
        }
      }
      else if (s.matches("hdfs_config")) {
        i = s.incrementAndCheck(i, args);
        trgt.hdfs_config = args[i];
      }
      else if (s.matches("hdfs_skip")) {
        trgt.hdfs_skip = true;
      }
      else if (s.matches("aws_credentials")) {
        i = s.incrementAndCheck(i, args);
        trgt.aws_credentials = args[i];
      }
      else if (s.matches("ga_hadoop_ver")) {
        i = s.incrementAndCheck(i, args);
        trgt.ga_hadoop_ver = args[i];
      }
      else if (s.matches("ga_opt_out")) {
        // JUnits pass this as a system property, but it usually a flag without an arg
        if (i+1 < args.length && args[i+1].equals("yes")) i++;
        trgt.ga_opt_out = true;
      }
      else if (s.matches("log_level")) {
        i = s.incrementAndCheck(i, args);
        trgt.log_level = args[i];
      }
      else if (s.matches("random_udp_drop")) {
        trgt.random_udp_drop = true;
      }
      else if (s.matches("md5skip")) {
        trgt.md5skip = true;
      }
      else if (s.matches("quiet")) {
        trgt.quiet = true;
      }
      else if(s.matches("useUDP")) {
        trgt.useUDP = true;
      }
      else if(s.matches("cleaner")) {
        trgt.cleaner = true;
      }
      else if (s.matches("jks")) {
        i = s.incrementAndCheck(i, args);
        trgt.jks = args[i];
      }
      else if (s.matches("jks_pass")) {
        i = s.incrementAndCheck(i, args);
        trgt.jks_pass = args[i];
      }
      else if (s.matches("hash_login")) {
        trgt.hash_login = true;
      }
      else if (s.matches("ldap_login")) {
        trgt.ldap_login = true;
      }
      else if (s.matches("kerberos_login")) {
        trgt.kerberos_login = true;
      }
      else if (s.matches("pam_login")) {
        trgt.pam_login = true;
      }
      else if (s.matches("login_conf")) {
        i = s.incrementAndCheck(i, args);
        trgt.login_conf = args[i];
      }
      else if (s.matches("form_auth")) {
        trgt.form_auth = true;
      }
      else if (s.matches("session_timeout")) {
        i = s.incrementAndCheck(i, args);
        trgt.session_timeout_spec = args[i];
        try { trgt.session_timeout = Integer.parseInt(args[i]); } catch (Exception e) { /* ignored */ }
      }
      else if (s.matches("internal_security_conf")) {
        i = s.incrementAndCheck(i, args);
        trgt.internal_security_conf = args[i];
      }
      else if (s.matches("decrypt_tool")) {
        i = s.incrementAndCheck(i, args);
        trgt.decrypt_tool = args[i];
      }
      else if (s.matches("no_latest_check")) {
        trgt.noLatestCheck = true;
      }
      else {
        parseFailed("Unknown argument (" + s + ")");
      }
    }
    return trgt;
  }
```



