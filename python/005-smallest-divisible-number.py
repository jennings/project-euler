# 2520 is the smallest number that can be divided by each of the numbers from 1
# to 10 without any remainder.
#
# What is the smallest positive number that is evenly divisible by all of the
# numbers from 1 to 20?

from fractions import gcd


def lcm(m,n):
    return m * n / gcd(m,n)


def multiple_lcm(n):
    min_lcm = 1
    for m in range(1, n+1):
        min_lcm = lcm(m, min_lcm)
    return min_lcm


if __name__ == "__main__":
    print(multiple_lcm(20))
