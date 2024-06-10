#!/bin/bash
service mariadb start

sleep 1

mysql -u root -p"$MYSQL_ROOT_PASSWORD" << EOF

CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;

USE $MYSQL_DATABASE;
CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO users VALUES(1, "KAMAL"),(2, "LM3ALAM");

CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY 'ayoub0330';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY 'ayoub0330';
FLUSH PRIVILEGES;
EOF

echo "set up user and database"

service mariadb stop

echo "[mysqld] 
    bind-address = 0.0.0.0" > /etc/mysql/my.cnf

sleep 1

mysqld_safe
