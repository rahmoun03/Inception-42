NGINX = nginx

MARIADB = mariadb

WORDPRESS = wordpress

NET = ncp

all : build run

build :
	docker build srcs/requirements/mariadb -t mariadb:my
	docker build srcs/requirements/wordpress -t wordpress:my
	docker build srcs/requirements/nginx -t nginx:my

run :
	docker run -d --name ${MARIADB} --env-file srcs/.env --network ${NET} mariadb:my
	docker run -d --name ${WORDPRESS} --env-file srcs/.env --network ${NET} wordpress:my
	docker run -d -p 443:443 --name ${NGINX} --env-file srcs/.env --network ${NET} nginx:my

re : down all

down :
	docker stop ${MARIADB} ${NGINX} ${WORDPRESS}
	docker rm ${MARIADB} ${NGINX} ${WORDPRESS}

info:
	docker ps --all

network:
	docker network create $(NET)

clean : 
	docker system prune
