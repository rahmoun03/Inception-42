FROM debian:11

RUN apt-get update && apt-get install -y \
    php-fpm \
    php-mysql \
    wget \
    tar \
    curl

RUN mkdir -p /run/php

RUN mkdir -p /var/www/html && \
    wget https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz -C /var/www/html && \
    rm latest.tar.gz
    
RUN chown -R www-data:www-data /var/www/html/wordpress
# COPY tools/wp-config.php /var/www/html/wordpress/wp-config.php
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY tools/index.php /var/www/html/wordpress/index.php

EXPOSE 9000

CMD ["php-fpm7.4", "-F"]

