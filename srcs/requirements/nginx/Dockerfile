FROM debian:11

RUN apt-get update -y && \
    apt-get install -y nginx openssl && \
    apt-get clean && rm -rf /var/lib/apt/lists/* 

RUN mkdir -p /etc/ssl/private /etc/ssl/certs && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/CN=localhost"

COPY conf/default /etc/nginx/sites-enabled/default

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;"]