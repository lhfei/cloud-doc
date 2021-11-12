### 1 Prepared





### 2 Build from source





### Nginx Proxy

- Enable Nginx Websocket Support

  ```ini
  	# Enabled WebSocket support
      map $http_upgrade $connection_upgrade {
          default upgrade;
          '' close;
      }
      upstream websocket {
          server 127.0.0.1:9000;
      }
      # // WebSocket support	
  ```

  

- Add Url Parten

```ini
		
		# NoteLink Application == start
        location / {
          proxy_pass http://websocket;
          proxy_http_version 1.1;
          proxy_set_header Upgrade $http_upgrade;
          proxy_set_header Connection $connection_upgrade;
        }
		
		location /ws {
		  proxy_pass http://116.196.119.106/ws;
		  proxy_http_version 1.1;
		  proxy_set_header Upgrade $http_upgrade;
		  proxy_set_header Connection $connection_upgrade;
		}
		
		location /api {
		  proxy_pass http://116.196.119.106/api;
		  index /;
		  proxy_set_header Host $host;
		}
		
		location ~ ^/(jax|extensions|components) {
          proxy_pass http://116.196.119.106;
		  index /;
		  proxy_set_header Host $host;
        }
		# NoteLink Application == end
```





### 4 Issues

1. hadoop-lzo

   [ERROR] Failed to execute goal on project zeppelin-scalding_2.10: Could not resolve dependencies for project org.apache.zeppelin:zeppelin-scalding_2.10:jar:0.10.1-SNAPSHOT: Failed to collect dependencies at com.twitter:scalding-commons_2.11:jar:0.16.1-RC1 -> com.twitter.elephantbird:elephant-bird-cascading2:jar:4.8 -> com.twitter.elephantbird:elephant-bird-core:jar:4.8 -> com.hadoop.gplcompression:hadoop-lzo:jar:0.4.19: Failed to read artifact descriptor for com.hadoop.gplcompression:hadoop-lzo:jar:0.4.19: Could not transfer artifact com.hadoop.gplcompression:hadoop-lzo:pom:0.4.19 from/to twitter (https://maven.twttr.com): transfer failed for https://maven.twttr.com/com/hadoop/gplcompression/hadoop-lzo/0.4.19/hadoop-lzo-0.4.19.pom: Connect to maven.twttr.com:443 [maven.twttr.com/199.59.149.208] failed: Connection timed out (Connection timed out) -> [Help 1]

   ```shell
   # download hadoop-lzo-0.4.19.jar
   wget https://maven.twttr.com/com/hadoop/gplcompression/hadoop-lzo/0.4.19/hadoop-lzo-0.4.19.jar
   
   mvn install:install-file -Dfile=./hadoop-lzo-0.4.19.jar \
     -DgroupId=com.hadoop.gplcompression \
     -DartifactId=hadoop-lzo \
     -Dpackaging=jar 
   ```

   

   

2. [phantomjs-2.1.1-linux-x86_64.tar.bz2](https://github-releases.githubusercontent.com/5755891/d55faeca-f27c-11e5-84be-6e92fb868e05?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20211101%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20211101T041416Z&X-Amz-Expires=300&X-Amz-Signature=b87f9a2daa57eb0d74403ac34894f18c68789dfab9cb7bf777e1f6c8e727d73e&X-Amz-SignedHeaders=host&actor_id=1538859&key_id=0&repo_id=5755891&response-content-disposition=attachment%3B filename%3Dphantomjs-2.1.1-linux-x86_64.tar.bz2&response-content-type=application%2Foctet-stream)

   

   ```shell
   wget https://github-releases.githubusercontent.com/5755891/d55faeca-f27c-11e5-84be-6e92fb868e05?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20211101%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20211101T041416Z&X-Amz-Expires=300&X-Amz-Signature=b87f9a2daa57eb0d74403ac34894f18c68789dfab9cb7bf777e1f6c8e727d73e&X-Amz-SignedHeaders=host&actor_id=1538859&key_id=0&repo_id=5755891&response-content-disposition=attachment%3B%20filename%3Dphantomjs-2.1.1-linux-x86_64.tar.bz2&response-content-type=application%2Foctet-stream
   
   mv ./phantomjs-2.1.1-linux-x86_64.tar.bz2 /tmp/phantomjs/
   ```

   

3. sdf

4. sdf

5. sdf

6. sdf

7. sdf

8. sdf

9. sdf

10. sdf

11. sdf