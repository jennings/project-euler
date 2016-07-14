# Each new term in the Fibonacci sequence is generated by adding
# the previous two terms. By starting with 1 and 2, the first 10
# terms will be:
#
#    1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
#
# By considering the terms in the Fibonacci sequence whose values
# do not exceed four million, find the sum of the even-valued terms.

def fib_sum(limit):
    return fib_calc(limit,0,1,0)


def fib_calc(limit, a, b, accum):
    if b > limit:
        return accum
    else:
        if b % 2 == 0:
            accum += b
        return fib_calc(limit, b, (a+b), accum)


if __name__ == "__main__":
    print(fib_sum(4000000))
