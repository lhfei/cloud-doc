

```ini
location /download {
  #转到的Nginx文件目录
  alias /home/files;
  #打开目录浏览功能
  autoindex on;
  #默认为on，显示出文件的确切大小，单位是bytes
  #显示出文件的大概大小，单位是kB或者MB或者GB
  autoindex_exact_size off;
  #默认为off，显示的文件时间为GMT时间。
  #改为on后，显示的文件时间为文件的服务器时间
  autoindex_localtime on;
  #让浏览器不保存临时文件
  add_header Cache-Control no-store;
  #避免中文乱码
  charset utf-8,gbk;
  #希望请求文件是下载而不是显示内容
  #add_header Content-Disposition attachment; 
}
```

