#!/bin/bash
service mariadb start

sleep 5

mysql -u root -p"$MYSQL_ROOT_PASSWORD" << EOF

CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;

USE $MYSQL_DATABASE;
CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO users VALUES(1, "KAMAL"),(2, "LM3ALAM");

CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOF

echo "set up user and database"

service mariadb stop

sleep 1

old="bind-address            = 127.0.0.1"
new="bind-address            = 0.0.0.0"
sed -i "s/$old/$new/g" /etc/mysql/mariadb.conf.d/50-server.cnf

mysqld_safe
