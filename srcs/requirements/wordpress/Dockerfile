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

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN php wp-cli.phar --info 
RUN chmod +x wp-cli.phar 
RUN mv wp-cli.phar /bin/wp
      
COPY tools/install-wp.sh /bin/
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 9000

WORKDIR /var/www/html/wordpress/

CMD ["sh", "-c" , "install-wp.sh"]
