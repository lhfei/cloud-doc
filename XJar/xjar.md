

### XJar

1. #### Maven 插件

   ```xml
   <project>
       <!-- 设置 jitpack.io 插件仓库 -->
       <pluginRepositories>
           <pluginRepository>
               <id>jitpack.io</id>
               <url>https://jitpack.io</url>
           </pluginRepository>
       </pluginRepositories>
       <!-- 添加 XJar Maven 插件 -->
       <build>
           <plugins>
               <plugin>
                   <groupId>com.github.core-lib</groupId>
                   <artifactId>xjar-maven-plugin</artifactId>
                   <version>4.0.2</version>
                   <executions>
                       <execution>
                           <goals>
                               <goal>build</goal>
                           </goals>
                           <phase>package</phase>
                           <!-- 或使用
                           <phase>install</phase>
                           -->
                           <configuration>
                               <password>io.xjar</password>
                               <!-- optional
                               <algorithm/>
                               <keySize/>
                               <ivSize/>
                               <includes>
                                   <include/>
                               </includes>
                               <excludes>
                                   <exclude/>
                               </excludes>
                               <sourceDir/>
                               <sourceJar/>
                               <targetDir/>
                               <targetJar/>
                               -->
                           </configuration>
                       </execution>
                   </executions>
               </plugin>
           </plugins>
       </build>
   </project>
   ```

   

2. #### 打包加密Jar

   ```shell
   # for Linux
   mvn clean install -Dxjar.password="Lhfei@AI@Root$GT4" -e -DskipTests
   ```

   

   ```shell
   # for Windows
   mvn clean install -DxjarPassword=Lhfei@AI@Root$GT4  -DskipTests -e
   ```

   

3. #### 主要参数说明

   | 参数名称  | 命令参数名称     | 参数说明                 | 参数类型 | 缺省值                          | 示例值                                                       |
   | --------- | ---------------- | ------------------------ | -------- | ------------------------------- | ------------------------------------------------------------ |
   | password  | -Dxjar.password  | 密码字符串               | String   | 必须                            | 任意字符串, io.xjar                                          |
   | algorithm | -Dxjar.algorithm | 加密算法名称             | String   | AES/CBC/PKCS5Padding            | JDK内置加密算法, 如：AES/CBC/PKCS5Padding 和 DES/CBC/PKCS5Padding |
   | keySize   | -Dxjar.keySize   | 密钥长度                 | int      | 128                             | 根据加密算法而定, 56, 128, 256                               |
   | ivSize    | -Dxjar.ivSize    | 密钥向量长度             | int      | 128                             | 根据加密算法而定, 128                                        |
   | sourceDir | -Dxjar.sourceDir | 源jar所在目录            | File     | ${project.build.directory}      | 文件目录                                                     |
   | sourceJar | -Dxjar.sourceJar | 源jar名称                | String   | ${project.build.finalName}.jar  | 文件名称                                                     |
   | targetDir | -Dxjar.targetDir | 目标jar存放目录          | File     | ${project.build.directory}      | 文件目录                                                     |
   | targetJar | -Dxjar.targetJar | 目标jar名称              | String   | ${project.build.finalName}.xjar | 文件名称                                                     |
   | includes  | -Dxjar.includes  | 需要加密的资源路径表达式 | String[] | 无                              | io/xjar/** , mapper/*Mapper.xml , 支持Ant表达式              |
   | excludes  | -Dxjar.excludes  | 无需加密的资源路径表达式 | String[] | 无                              | static/** , META-INF/resources/** , 支持Ant表达式            |

   - 指定加密算法的时候密钥长度以及向量长度必须在算法可支持范围内, 具体加密算法的密钥及向量长度请自行百度或谷歌.
   - 当 includes 和 excludes 同时使用时即加密在includes的范围内且排除了excludes的资源.

   更多文档：[xjar-maven-plugin](https://github.com/core-lib/xjar-maven-plugin)

   

4. #### 打包加密Jar

   ```shell
   go build xjar.go
   
   # then generate 'xjar' file in current dir
   
   # start jar application
   xjar ***.xjar
   ```

   

5. ...

