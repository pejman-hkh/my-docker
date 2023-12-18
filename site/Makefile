build:
	sudo docker build -t pejmanhkh/nginx .
run:
	sudo docker compose up
up:
	sudo docker compose up -d
down:
	sudo docker compose down
restart:
	sudo docker compose down
	sudo docker compose up -d

run1:
	sudo docker compose run nginx sh

domain:
	sudo docker compose exec nginx certbot certonly --standalone

domain1:
	sudo docker compose exec nginx certbot certonly --webroot -w /home/usersample/domain.ir/public_html/ -d domain.ir -d www.domain.ir
	sudo docker compose exec nginx certbot certonly --webroot -w /home/usersample/domain.ir/public_html/ -d domain.com -d www.domain.com