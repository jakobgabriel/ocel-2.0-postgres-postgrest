# Defining .PHONY targets to ensure make treats the targets as commands, not file names
.PHONY: clear-all down restart up

# Target to clear all Docker containers, volumes, and orphaned containers
clear-all: docker-compose down --volumes --remove-orphans # Stop and remove containers, networks, and volumes

# Target to bring down the Docker composition
down: docker-compose down # Stop containers and networks

# Target to restart the Docker composition
restart: down up # First execute 'down' then 'up'

# Target to start up the Docker composition in detached mode
up: docker-compose up -d # Start containers in detached mode