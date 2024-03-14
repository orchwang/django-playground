#!/bin/bash

poetry run python manage.py runserver 0.0.0.0:3200 \
  --settings=playground.settings.dev

