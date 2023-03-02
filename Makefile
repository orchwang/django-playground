TARGET ?= local
VERSION ?= latest
PREFIX ?= playground
CONTAINER ?= playground

# Docker Compose
up-build:
	docker compose -f docker-compose.$(TARGET).yml --env-file .env.docker-compose up -d --build

up:
	docker compose -f docker-compose.$(TARGET).yml --env-file .env.docker-compose up -d

down:
	docker compose -f docker-compose.$(TARGET).yml --env-file .env.docker-compose down

restart:
	docker compose -f docker-compose.$(TARGET).yml --env-file .env.docker-compose restart $(CONTAINER)

logs:
	docker compose -f docker-compose.$(TARGET).yml --env-file .env.docker-compose logs -f $(CONTAINER)
