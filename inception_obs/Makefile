all:
	mkdir -p volumes/wordpress volumes/mysql
	docker-compose up -d --build

down:
	docker-compose down

clean: down
	docker system prune -a
	sudo rm -rf volumes/wordpress/* volumes/mysql/*
	docker volume rm inception_wordpress
	docker volume rm inception_mysql

.PHONY: all down clean