# The sequence of triangle numbers is generated by adding the natural numbers.
# So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first
# ten terms would be:
#
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
#
# Let us list the factors of the first seven triangle numbers:
#
#  1: 1
#  3: 1,3
#  6: 1,2,3,6
# 10: 1,2,5,10
# 15: 1,3,5,15
# 21: 1,3,7,21
# 28: 1,2,4,7,14,28
#
# We can see that 28 is the first triangle number to have over five divisors.
#
# What is the value of the first triangle number to have over five hundred divisors?

import math
from time import time

def triangle_numbers(n = 0, agg = 0):
    while True:
        n += 1
        agg += n
        yield agg

def number_of_divisors(n):
    num_factors = 2 # 1 and n
    sq = int(n ** 0.5)
    for candidate in range(2, sq):
        if n % candidate == 0:
            num_factors += 2
    if sq * sq == n:
        num_factors -= 1
    return num_factors

if __name__ == "__main__":
    current_magnitude = 10
    start = time()
    for num in triangle_numbers():
        if number_of_divisors(num) >= 500:
            print("Answer: " + str(num))
            print("Found in " + str(round(time() - start, 2)) + " seconds")
            exit(0)
        if num > current_magnitude:
            current_magnitude *= 10
            print("Trying: " + str(num))
