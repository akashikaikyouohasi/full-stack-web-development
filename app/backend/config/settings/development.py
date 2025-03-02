from .base import *

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'app',
        'USER': 'root',
        'PASSWORD': 'password',
        'HOST': 'host.docker.internal', # Dockerの別のコンテナに接続する場合はhost.docker.internalを指定
        'PORT': '53306',
        'ATOMIC_REQUESTS': True # This setting ensures that the database connection is closed after each request.
    }
}