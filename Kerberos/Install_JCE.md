# Install JCE

1. On the Ambari Server, obtain the JCE policy file appropriate for the JDK version in your

   cluster.  Download  [JCE](http://www.oracle.com/technetwork/java/javase/downloads/jce8-download-2133166.html)  from here.

2. Save the policy file archive in a temporary location .

3. On Ambari Server and on each host in the cluster, add the unlimited security policy JCE
   jars to $JAVA_HOME/jre/lib/security/.
   For example, run the following to extract the policy jars into the JDK installed on your
   host:

   ```
   unzip -o -j -q jce_policy-8.zip -d ${JAVA_HOME}/jre/lib/security/ 
   ```

4. Restart Ambari Server.



[More info ...](https://docs.hortonworks.com/HDPDocuments/Ambari-2.2.1.1/bk_Ambari_Security_Guide/content/_distribute_and_install_the_jce.html)



