#!/bin/bash
service mariadb start

mysql -u root -p"$MYSQL_ROOT_PASSWORD" < /docker-entrypoint-initdb.d/init.sql

echo "set up user and database"

service mariadb stop

mysqld_safe
