#!/bin/bash

python manage.py migrate \
  --noinput \
  --settings=playground.settings.dev
python manage.py collectstatic \
  --noinput \
  --settings=playground.settings.dev
python manage.py runserver 0.0.0.0:8000 \
  --settings=playground.settings.dev
