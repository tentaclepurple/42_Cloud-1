
.PHONY: hosts all install build up start down remove re list images delete

NAME=inception
DOCC=docker-compose
DOCKER_PATH=/usr/bin/docker-compose

all: vol build up

build:
	$(DOCC) -f ./srcs/$(DOCC).yml build

rm_vol:
	chown -R $(USER) $(HOME)/data
	chmod -R 777 $(HOME)/data
	rm -rf $(HOME)/data

vol:
	mkdir -p $(HOME)/data/mysql
	mkdir -p $(HOME)/data/html
	chown -R $(USER) $(HOME)/data
	chmod -R 777 $(HOME)/data/mysql
	chmod -R 777 $(HOME)/data/html

up:
	$(DOCC) -f ./srcs/$(DOCC).yml up -d

start:
	$(DOCC) -f ./srcs/$(DOCC).yml start

down:
	$(DOCC) -f ./srcs/$(DOCC).yml down

remove:
	docker volume prune -f
	docker volume rm srcs_wordpress
	docker volume rm srcs_mariadb
	docker container prune -f

re: remove delete build up

clean: down rm_vol remove delete

list:
	docker ps -a
	docker images -a

delete:
	cd srcs && docker-compose stop nginx
	cd srcs && docker-compose stop wordpress
	cd srcs && docker-compose stop mariadb
	docker system prune -a

logs:
	cd srcs && docker-compose logs mariadb wordpress nginx


