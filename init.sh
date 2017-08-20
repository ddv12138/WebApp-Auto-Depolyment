#!/bin/bash
set -e
echo '开始自动部署'
PWD=`pwd`
echo "当前路径：${PWD}"
echo "启动tomcat-server"
docker run -d -p 80:8080 --name tomcat-server -v ${PWD}/tomcat-init/webroot/:/usr/local/tomcat/webapps/ROOT ddv12138/tomcat-with-mysql-driver
echo "启动mysql-server"
docker run -d -p 3306:3306 --name mysql-server -v ${PWD}/mysql-init/mysql-data/:/var/lib/mysql/ mysql:5.7
echo "启动php-server"
docker run -d -p 8888:80 --name php-server -v ${PWD}/php-init/phpmyadmin/:/var/www/html/ ddv12138/php-phpmyadmin:latest 
