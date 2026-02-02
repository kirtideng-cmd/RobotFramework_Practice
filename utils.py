import string
from robot.api.deco import keyword
import datetime
import random
@keyword
def get_number_of_days(start, end):
    d1 = datetime.datetime.strptime(start, '%Y-%m-%d')
    d2 = datetime.datetime.strptime(end, '%Y-%m-%d')

    diff = abs((d2 - d1).days)
    return f'You selected a range of {diff} days.'

@keyword
def get_random_name():
    return ''.join(random.choices(string.ascii_letters + string.digits, k=10))

@keyword
def get_sorted_list(c1, c2,c3):
    return sorted([c1,c2,c3])