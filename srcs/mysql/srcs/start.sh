#!/bin/sh

openrc default
if [ ! -d "/var/lib/mysql/wordpress" ];
then
    service mariadb setup
    service mariadb start
    mysql < create_wordpress_db.sql
    mysql wordpress < wp.sql
    service mariadb stop
fi
mysqld_safe
