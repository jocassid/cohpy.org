from random import choices
from string import (
    ascii_letters,
    digits,
    punctuation,
)

from .base import *




DEBUG = True

SECRET_KEY = "".join(choices(ascii_letters + digits + punctuation, k=50))

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
}