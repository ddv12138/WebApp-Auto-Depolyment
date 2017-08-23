#!/bin/bash
set -e
echo '开始自动部署'
pwd=`pwd`
mysqlname="mysql-server"
tomcatname="tomcat-server"
phpname="php-server"
read -p "请输入mysql容器的名字（默认是${mysqlname}）：" mysqlname
read -p "请输入tomcat容器的名字（默认是"${tomcatname}"）：" tomcatname
read -p "请输入php容器的名字（默认是"${phpname}"）：" phpname
if [ -n "${mysqlname}" ];then
	echo $mysqlname
else
	mysqlname="mysql-server"
	echo $mysqlname
fi

if [ -n "${tomcatname}" ];then
        echo $tomcatname123
else
        tomcatname="tomcat-server"
	echo $tomcatname
fi

if [ -n "${phpname}" ];then
        echo $phpname123
else
        phpname="php-server"
	echo $phpname
fi

echo "当前路径：${PWD}"
echo "切换到路径${PWD}" && cd ${PWD}
echo "启动mysql-server"
docker run -d -p 3306:3306 --name ${mysqlname} -v ${pwd}/mysql-init/mysql-data/:/var/lib/mysql/ mysql:5.7
echo "启动tomcat-server"
docker run -d -p 80:8080 --name ${tomcatname} --link=${mysqlname}:${mysqlname}  -v ${pwd}/tomcat-init/webroot/:/usr/local/tomcat/webapps/ROOT ddv12138/tomcat-with-mysql-driver
echo "启动php-server"
docker run -d -p 8888:80 --name ${phpname} -v ${pwd}/php-init/phpmyadmin/:/var/www/html/ ddv12138/php-phpmyadmin:latest 
