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
	docker compose -f srcs/docker-compose.yml down

info:
	docker ps --all

clean : down 
	docker system prune
	docker volume rm srcs_mariadb_data  srcs_wordpress_data

logs:
	docker compose -f srcs/docker-compose.yml logs
