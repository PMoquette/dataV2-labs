def get_longest_side(max_length):
    solutions = [[x,y,z] for x in range(5, max_length) for y in range(4, max_length) for z in range(3, max_length) if x**2 == y**2 + z**2]
    value = 0 
    for solution in solutions:
        if value < max(solution):
            m = max(solution)
        return m 
    
max_length = input("What is the maximal length of the triangle side? Enter a number: ")

print("The longest side possible is " + str(get_longest_side(int(max_length))))