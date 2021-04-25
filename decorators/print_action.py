import datetime as dt
from functools import wraps


def print_action(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        action = func.__name__.replace('_', ' ').title()

        print(str(dt.datetime.now()) + '   ' + action + '...')
        return func(*args, **kwargs)

    return wrapper


def print_important_action(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        action = func.__name__.replace('_', ' ').upper()

        print(str(dt.datetime.now()) + ' ' + action + ':')
        return func(*args, **kwargs)

    return wrapper
