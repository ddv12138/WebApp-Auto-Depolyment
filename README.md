# webapp-autoDepolyment  
#### 基于Dokcer技术的网站自动化部署  
- mysql-init目录下是数据库文件，部署时可以自动映射到docker的相应目录相对应的，也可以将自己的数据库文件覆盖到mysql-init/mysql-data目录下  
- php-init目录下是php相关的文件，可以由Dockerfile构建镜像，但是默认部署脚本里面使用的是dockerhub上的ddv12138的镜像，集成了php，httpd，phpmyadmin，并且phpmyadmin已经安装了mysqli插件，打开了服务器自选功能，可以管理多个数据库  
- tomcat-init目录下是tomcat的相关文件，有相应的Dockerfile用来构建镜像，但是默认部署脚本里面使用的是dockerhub上的ddv12138的镜像，tomcat中已经集成了mysql的驱动，webroot文件夹下的文件将会在部署时自动映射到相应目录，也就是说可以将任意jsp项目代码复制到该目录下，到部署的时候会自动映射  
替换完相关文件后，回到含有init.sh的目录，运行脚本，会开始自动部署（缺少的镜像会自动下载，要替换镜像需更改init.sh文件），然后就可以访问了。
- 运行初始化脚本时，为mysql-server指定的名字同时也是数据库驱动中访问数据库的机器名，所以如果修改了mysql-server的名字，那么代码中数据库连接的部分也要做相应修改
