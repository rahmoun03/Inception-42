#!/bin/bash

sleep 5
wp config create --dbname="$WORDPRESS_DB_NAME" --dbuser="$WORDPRESS_DB_USER" --dbpass="$WORDPRESS_DB_PASSWORD" --dbhost="$WORDPRESS_DB_HOST" --path='/var/www/html/wordpress' --allow-root

wp core install --url="$URL" --title="$TITLE" --admin_user="$ADMIN_USER" --admin_password="$ADMIN_PASSWORD" --admin_email="$ADMIN_EMAIL" --path='/var/www/html/wordpress' --allow-root

wp user create $NEW_USER $NEW_USER_EMAIL --role="$NEW_USER_ROLE" --user_pass="$NEW_USER_PASS" --path='/var/www/html/wordpress' --allow-root;

wp theme install oceanwp --activate --path='/var/www/html/wordpress' --allow-root

wp plugin install akismet --activate --path='/var/www/html/wordpress' --allow-root

wp user list --path='/var/www/html/wordpress' --allow-root

chown -R www-data:www-data /var/www/html/wordpress

php-fpm7.4 -F