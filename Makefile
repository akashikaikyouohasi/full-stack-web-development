up:
	docker compose up -d
stop:
	docker compose stop

frontend:
	docker compose exec frontend bash
frontend-logs:
	docker-compose logs frontend

mysql:
	mysql -h 127.0.0.1 -P 53306 -u root -ppassword
mysql-logs:
	docker-compose logs mysql


init:
	make up
	mysql -h 127.0.0.1 -P 53306 -u root -ppassword < ./initial-data/sakila-db/sakila-schema.sql
	mysql -h 127.0.0.1 -P 53306 -u root -ppassword < ./initial-data/sakila-db/sakila-data.sql