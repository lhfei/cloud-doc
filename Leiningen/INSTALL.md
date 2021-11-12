Leiningen and Clojure require Java; ideally OpenJDK.



1. Download the [lein script](https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein) (or on Windows [lein.bat](https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein.bat))

2. Place it on your `$PATH` where your shell can find it (eg. `~/bin`)

3. Set it to be executable (chmod a+x ~/bin/lein)

4. Run it (lein) and it will download the self-install package

   ```shell
   lein self-install
   ```

5. 

6. 

You can check your [package manager](https://github.com/technomancy/leiningen/wiki/Packaging) as well depending on your operating system.



manual download jar to `/root/.lein/self-installs/leiningen-2.9.7-standalone.jar`

```shell
wget https://github-releases.githubusercontent.com/356756/0c51e44f-1618-4f42-bb25-f02a6f1e9014?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20211027%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20211027T090258Z&X-Amz-Expires=300&X-Amz-Signature=97051a9b14d27c3b79e95f50e420fb1a7c160d4412e0ec9a32496444c06a2b83&X-Amz-SignedHeaders=host&actor_id=1538859&key_id=0&repo_id=356756&response-content-disposition=attachment%3B%20filename%3Dleiningen-2.9.7-standalone.jar&response-content-type=application%2Foctet-stream
```

