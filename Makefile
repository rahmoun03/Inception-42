NGINX = nginx

MARIADB = mariadb

WORDPRESS = wordpress

NET = ncp

VOLUME_DB = mariadb_data 

VOLUME_WEB = wordpress_data

all : up

up :
	docker compose -f srcs/docker-compose.yml up -d --build 

re : down all

down :
	docker compose -f srcs/docker-compose.yml down -v

info:
	docker ps --all

clean : down 
	docker system prune

logs:
	docker compose -f srcs/docker-compose.yml logs
