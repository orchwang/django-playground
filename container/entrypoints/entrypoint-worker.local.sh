#!/bin/bash

poetry run celery -A playground worker -l info
