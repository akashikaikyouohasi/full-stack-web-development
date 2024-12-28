up:
	docker compose up -d
mysql:
	mysql -h 127.0.0.1 -P 53306 -u root -ppassword
init:
	make up
	mysql -h 127.0.0.1 -P 53306 -u root -ppassword < ./initial-data/sakila-db/sakila-schema.sql
	mysql -h 127.0.0.1 -P 53306 -u root -ppassword < ./initial-data/sakila-db/sakila-data.sql