import os

from .base import *  # noqa : F403

DEBUG = True

CORS_ALLOWED_ORIGINS = []

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': os.getenv('DB_DATABASE_NAME'),
        'USER': os.getenv('DB_USERNAME'),
        'PASSWORD': os.getenv('DB_PASSWORD'),
        'HOST': 'playground-postgres',
        'PORT': '5432',
    }
}

CACHES = {
    'default': {
        'BACKEND': 'django.core.cache.backends.redis.RedisCache',
        'LOCATION': 'redis://playground-redis:6379',
        'OPTIONS': {
            'CLIENT_CLASS': 'django_redis.client.DefaultClient',
        },
    }
}


STATIC_URL = 'dev/static/'
STATIC_ROOT = 'dev/static/'

MEDIA_URL = 'dev/media/'
MEDIA_ROOT = 'dev/media/'

CELERY_BROKER_URL = 'redis://playground-redis:6379'
CELERY_RESULT_BACKEND = 'redis://playground-redis:6379'
