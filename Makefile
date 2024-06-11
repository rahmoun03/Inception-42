NGINX = nginx

MARIADB = mariadb

WORDPRESS = wordpress

NET = ncp

VOLUME_DB = mariadb_data 

VOLUME_WEB = wordpress_data

all : build run

up :
	docker compose -f srcs/docker-compose.yml up -d --build 

build :
	docker build srcs/requirements/mariadb -t mariadb:my
	docker build srcs/requirements/wordpress -t wordpress:my
	docker build srcs/requirements/nginx -t nginx:my

run :
	docker run -d --name ${MARIADB} --env-file srcs/.env --network ${NET} -v mariadb:my
	docker run -d --name ${WORDPRESS} --env-file srcs/.env --network ${NET} -v ${VOLUME_WEB}:/var/www/html wordpress:my
	docker run -d -p 443:443 --name ${NGINX} --env-file srcs/.env --network ${NET} -v ${VOLUME_WEB}:/var/www/html nginx:my

re : down all

down :
	docker compose -f srcs/docker-compose.yml down
	# docker stop ${MARIADB} ${NGINX} ${WORDPRESS}
	# docker rm ${MARIADB} ${NGINX} ${WORDPRESS}

info:
	docker ps --all

network:
	docker network create $(NET)

clean : 
	docker system prune

logs:
	docker logs ${MARIADB}
	@echo "----------------------------------"
	docker logs ${WORDPRESS}
	@echo "----------------------------------"
	docker logs ${NGINX}
	@echo "----------------------------------"
	docker compose -f srcs/docker-compose.yml logs

