NGINX = nginx
MARIADB = mariadb
NET = ncp

all : build run

build :
	docker build srcs/requirements/nginx -t nginx:my
	docker build srcs/requirements/mariadb -t mariadb:my

run :
	docker run -d --name maria --env-file srcs/.env --network ${NET} mariadb:my
	docker run -d -p 443:443 --name ngin --env-file srcs/.env --network ${NET} nginx:my

re : down all

down :
	docker stop maria ngin
	docker rm maria ngin

info:
	docker ps --all
	
network:
	docker network create $(NET)

clean : 
	docker system prune
