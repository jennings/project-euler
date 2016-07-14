# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that
# the 6th prime is 13.
#
# What is the 10 001st prime number?

from math import sqrt, floor


def is_prime(n):
    max_possible_factor = int( floor( sqrt(n) ) )
    possible_factors = range( 2, max_possible_factor+1 )
    divisible_factors = [ n % i == 0 for i in possible_factors ]
    return not any( divisible_factors )


def nth_prime(n):
    num = 1
    current = 2

    while num < n:
        current += 1
        if is_prime(current):
            num += 1

    return current


if __name__ == "__main__":
    print(nth_prime(10001))
