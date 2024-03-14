TARGET ?= local
VERSION ?= latest
PROJECT_NAME ?= playground
CONTAINER ?= playground-backend


# Docker Compose

build:
	docker compose -f docker-compose.$(TARGET).yml --env-file .env.docker-compose up -d --build

up:
	docker compose -f docker-compose.$(TARGET).yml --env-file .env.docker-compose up -d

down:
	docker compose -f docker-compose.$(TARGET).yml --env-file .env.docker-compose down

restart:
	docker compose -f docker-compose.$(TARGET).yml --env-file .env.docker-compose restart $(CONTAINER)

logs:
	docker compose -f docker-compose.$(TARGET).yml --env-file .env.docker-compose logs -f $(CONTAINER)

django-shell:
	docker exec -it $(CONTAINER) poetry run python manage.py shell

bash:
	docker exec -it $(CONTAINER) /bin/bash

# Django Commands

makemigrations:
	poetry run python manage.py makemigrations --settings=${PROJECT_NAME}.settings.test

collectstatic:
	poetry run python manage.py collectstatic --settings=${PROJECT_NAME}.settings.test

test:
	poetry run python manage.py test --settings=${PROJECT_NAME}.settings.test

# container Django Commands
container-makemigrations:
	docker exec -it $(CONTAINER) poetry run python manage.py makemigrations

container-migrate:
	docker exec -it $(CONTAINER) poetry run python manage.py migrate


