#!/bin/sh

openrc default
if [ ! -d "/var/lib/mysql/wordpress" ];
then
    echo "CREATING DATABASE WORDPRESS WITH USER ROOT"
    service mariadb setup
    service mariadb start
    mysql < create_wordpress_db.sql
    mysql wordpress < wp.sql
    service mariadb stop
fi
mysqld_safe
