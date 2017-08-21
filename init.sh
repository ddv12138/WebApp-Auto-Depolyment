#!/bin/bash
set -e
echo '开始自动部署'
pwd=`pwd`
mysqlname="mysql-server"
tomcatname="tomcat-server"
phpname="php-server"
echo "当前路径：${PWD}"
echo "启动mysql-server"
docker run -d -p 3306:3306 --name ${mysqlname} -v ${pwd}/mysql-init/mysql-data/:/var/lib/mysql/ mysql:5.7
echo "启动tomcat-server"
docker run -d -p 80:8080 --name ${tomcatname} --link=${mysqlname}:mysql-server  -v ${pwd}/tomcat-init/webroot/:/usr/local/tomcat/webapps/ROOT ddv12138/tomcat-with-mysql-driver
echo "启动php-server"
docker run -d -p 8888:80 --name ${phpname} -v ${pwd}/php-init/phpmyadmin/:/var/www/html/ ddv12138/php-phpmyadmin:latest 
