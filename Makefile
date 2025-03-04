# Dockerfileに更新があった場合、ビルドし直す用
build:
	docker-compose build --no-cache
	docker-compose up -d
up:
	docker-compose up -d
stop:
	docker-compose stop
down:
	docker-compose down

frontend:
	docker-compose exec frontend bash
frontend-logs:
	docker-compose logs frontend

backend:
	docker-compose exec backend bash
backend-logs:
	docker-compose logs backend


mysql:
	mysql -h 127.0.0.1 -P 53306 -u root -ppassword
mysql-logs:
	docker-compose logs mysql


init:
	make up
	mysql -h 127.0.0.1 -P 53306 -u root -ppassword -e "CREATE DATABASE app;"
	mysql -h 127.0.0.1 -P 53306 -u root -ppassword < ./initial-data/sakila-db/sakila-schema.sql
	mysql -h 127.0.0.1 -P 53306 -u root -ppassword < ./initial-data/sakila-db/sakila-data.sql
