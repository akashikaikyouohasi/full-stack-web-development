.PHONY: mysql

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
clean:
	docker-compose down --rmi all --volumes --remove-orphans
ps:
	docker-compose ps
logs:
	docker-compose logs

frontend:
	docker-compose exec frontend bash
frontend-logs:
	docker-compose logs frontend

backend:
	docker-compose exec backend bash
backend-logs:
	docker-compose logs backend
backend-remove-image:
	docker-compose stop backend
	docker-compose rm -f backend
	docker rmi full-stack-web-development-backend
migration-inventory:
	docker-compose exec backend bash -c "python manage.py makemigrations inventory --settings config.settings.development"
	docker-compose exec backend bash -c "python manage.py migrate --settings config.settings.development"
	mysql -h 127.0.0.1 -P 53306 -u root -ppassword -e "use app; INSERT INTO product (name, price, description) VALUES ('コットン100%バックリボンティアードワンピース（黒）', 6900, '大人の愛らしさを引き立てる、ナチュラルな風合い。リラックスxトレンドを楽しめる、上品なティアードワンピース。');"
	mysql -h 127.0.0.1 -P 53306 -u root -ppassword -e "use app; INSERT INTO purchase (product_id, quantity, purchase_date) VALUES (1, 10, '2025-3-30 10:00:00');"
	mysql -h 127.0.0.1 -P 53306 -u root -ppassword -e "use app; INSERT INTO sales (product_id, quantity, sales_date) VALUES (1, 10, '2025-3-31 10:00:00');"
backend-init-password:
	docker-compose exec backend bash -c "python manage.py createsuperuser --username=t-yamada --email=t-yamada@example.com --settings config.settings.development"

mysql:
	mysql -h 127.0.0.1 -P 53306 -u root -ppassword
mysql-logs:
	docker-compose logs mysql


init:
	make up
	mysql -h 127.0.0.1 -P 53306 -u root -ppassword -e "CREATE DATABASE app;"
	mysql -h 127.0.0.1 -P 53306 -u root -ppassword < ./initial-data/sakila-db/sakila-schema.sql
	mysql -h 127.0.0.1 -P 53306 -u root -ppassword < ./initial-data/sakila-db/sakila-data.sql
	make migration-inventory
	make backend-init-password

access-test:
	@echo "Testing the backend API without authentication token..."
	curl -X GET -H "Content-Type: application/json" \
	http://127.0.0.1:8000/api/inventory/products/ | jq
	@echo "Accessing the backend API to test if it's running..."
	curl -X GET -H "Content-Type: application/json" \
	-H 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ4Njc0NDk5LCJpYXQiOjE3NDg2Njg2NzMsImp0aSI6ImM2MjViNDRhODE2ZTQyYjNhNzk5NjUwMmI4M2Q3OTQ0IiwidXNlcl9pZCI6MX0.F5r6k-CsC8s5hQa8ioLlkxAHLTbIRgcrtNpigt72dt4' \
	http://127.0.0.1:8000/api/inventory/products/ | jq

get-refresh-token:
	curl -X POST -H "Content-Type: application/json" \
	-d '{"refresh": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1MTI2MDY3MywiaWF0IjoxNzQ4NjY4NjczLCJqdGkiOiJkYzg1OWNhNmE3Yjg0NWQzOTFjYjBiNmVkZWQ5MWY1NiIsInVzZXJfaWQiOjF9.QrkMBT4QAY2Lwf4LRClh-xfPo5awIH2zavsNqu9Qwqo"}' \
	http://127.0.0.1:8000/api/inventory/token/refresh/ | jq
