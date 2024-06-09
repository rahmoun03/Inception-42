FROM debian:11

RUN apt-get update -y && \
    apt-get install -y php-fpm php-mysql nginx openssl && \
    apt-get clean && rm -rf /var/lib/apt/lists/* 

RUN mkdir -p /etc/ssl/private /etc/ssl/certs && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/CN=localhost"

COPY conf/default /etc/nginx/sites-enabled/default
COPY tools/* /var/www/html/
COPY tools/wait.sh /bin/

EXPOSE 443

CMD [ "sh" , "-c" ,"wait.sh maria -- service php7.4-fpm start && nginx -g 'daemon off;'"]
