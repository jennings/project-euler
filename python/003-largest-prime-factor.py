# The prime factors of 13195 are 5, 7, 13 and 29.
#
# What is the largest prime factor of the number 600851475143 ?

from math import ceil

def gcf(n):
    ceiling = int(ceil(n ** 0.5))
    candidates = range(ceiling, 2, -1)
    for candidate in candidates:
        if (n % candidate == 0):
            if (is_prime(candidate)):
                return candidate
    # If we go there, we have no prime factors greater than 1
    return 1


def is_prime(n):
    ceiling = int(ceil(n ** 0.5))
    if (n % 2 == 0):
        return False
    for candidate in range(3, ceiling, 2):
        if (n % candidate == 0):
            return False
    return True


if __name__ == "__main__":
    print(gcf(600851475143))
    pass
