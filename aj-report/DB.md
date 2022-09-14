

### DB

```sql
CREATE DATABASE aj_report
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;
  
CREATE USER 'aj_report'@'localhost' IDENTIFIED BY 'Ajreportuser_1473';

GRANT ALL ON aj_report.* TO 'aj_report'@'localhost' IDENTIFIED BY 'Ajreportuser_1473';
GRANT ALL ON aj_report.* TO 'aj_report'@'%' IDENTIFIED BY 'Ajreportuser_1473';

GRANT ALL ON aj_report_init.* TO 'aj_report'@'localhost' IDENTIFIED BY 'Ajreportuser_1473';
GRANT ALL ON aj_report_init.* TO 'aj_report'@'%' IDENTIFIED BY 'Ajreportuser_1473';

FLUSH PRIVILEGES;
  
GRANT ALL ON aj_report.* TO 'root'@'localhost' IDENTIFIED BY 'Lhfeilaile@01';
GRANT ALL ON aj_report.* TO 'root'@'%' IDENTIFIED BY 'Lhfeilaile@01';

GRANT ALL ON aj_report_init.* TO 'root'@'localhost' IDENTIFIED BY 'Lhfeilaile@01';
GRANT ALL ON aj_report_init.* TO 'root'@'%' IDENTIFIED BY 'Lhfeilaile@01';

FLUSH PRIVILEGES;
```





```shell
git clone https://gitee.com/anji-plus/report.git
cd report
sh build.sh
编译完成放在build文件夹 aj-report-xxxx.zip

unzip aj-report-xxxx.zip
cd aj-report-xxxx
vim conf/bootstrap-dev.yml 修改数据库连接等信息
sh bin/start.sh Linux启动
bin/start.bat Windows修改第4行的JAVA_HOME后(去掉rem注释)，双击启动

启动后访问
http://serverip:9095
```

