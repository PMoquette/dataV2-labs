import random
import string
import sys

#So this part of the code does the same the original RandomStringGenerator function did. 
# ie. Default string of lowercase letters and digits size 12.
def random_string_generator(size=12, chars=string.ascii_lowercase + string.digits):
    string = ''.join(random.choice(chars) for x in range(size))
    return string

def batch_string_generator(str_count, min_length, max_length):
    r = []
    for i in range(str_count):
        string_length = None
        if min_length < max_length:
            import random
            string_length = random.choice(range(min_length, max_length))
        elif min_length == max_length:
            string_length = min_length
        else:
            exit('Incorrect min and max string lengths. Try again.')
        r.append(random_string_generator(string_length))
    return r

min_length = input('Enter minimum string length: ') #a
max_length = input('Enter maximum string length: ') #b
str_count = input('How many random strings to generate? ') #n

print(batch_string_generator(int(str_count), int(min_length), int(max_length)))