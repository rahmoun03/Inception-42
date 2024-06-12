#!/bin/bash

sleep 5
wp config create --dbname="$MYSQL_DATABASE" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --dbhost="mariadb" --allow-root

wp core install --url="$URL" --title="$TITLE" --admin_user="$MYSQL_USER" --admin_password="$MYSQL_PASSWORD" --admin_email="$EMAIL" --allow-root

wp user create $NEW_USER $NEW_EMAIL --role="editor" --user_pass="$NEW_USER_PASS" --allow-root;

wp theme install oceanwp --activate --allow-root

wp plugin install akismet --activate --allow-root

wp user list --allow-root

chown -R www-data:www-data /var/www/html/wordpress

php-fpm7.4 -F