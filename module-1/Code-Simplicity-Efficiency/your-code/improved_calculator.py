import operator

def str_to_num(first_num, second_num):

    calc_ops = {"ZERO": 0, "ONE": 1, "TWO": 2, "THREE": 3, "FOUR": 4, "FIVE": 5}
    a = calc_ops.get(first_num)
    b = calc_ops.get(second_num)
    return a, b

a = str_to_num(first_num, second_num)[0]
b = str_to_num(first_num, second_num)[1]

def calculator(a, ops, b):
    if ops == "PLUS":
        solution = a + b
    elif ops == "MINUS":
        solution = a - b
    return print(solution)

print('Welcome to this calculator!')
print('It can add and subtract whole numbers from zero to five')
    
first_num = input('Please choose your first number (zero to five): ').upper()
if first_num not in {"ZERO", "ONE", "TWO", "THREE", "FOUR", "FIVE"}:
    first_num = input("Please enter a number (zero to five: ").upper() 
else: 
    pass
ops = input('What do you want to do? plus or minus: ').upper()
if ops not in {"PLUS", "MINUS"}:
    ops = input("Please select plus or minus: ").upper() 
else: 
    pass
second_num = input('Please choose your second number (zero to five): ').upper() 
if second_num not in {"ZERO", "ONE", "TWO", "THREE", "FOUR", "FIVE"}:
    second_num = input("Please enter a number (zero to five: ").upper()
else:
    pass

str_to_num(first_num, second_num)

calculator(a, ops, b)