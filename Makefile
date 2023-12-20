.PHONY: clear-all down restart up

clear-all:
	docker-compose down --volumes --remove-orphans

down:
	docker-compose down

restart: down up

up:
	docker-compose up -d
