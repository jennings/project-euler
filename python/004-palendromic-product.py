# A palindromic number reads the same both ways. The largest palindrome
# made from the product of two 2-digit numbers is 9009 = 91 99.
#
# Find the largest palindrome made from the product of two 3-digit
# numbers.

def is_palendromic(n):
    nstr = str(n)
    nstrrev = nstr[::-1]
    return nstr == nstrrev


def find_max_palendromic():
    max_palendrome = 0
    for x in range(100,1000):
        for y in range(100,1000):
            product = x * y
            if is_palendromic(product) and product > max_palendrome:
                max_palendrome = product
    return max_palendrome



if __name__ == "__main__":
    print(find_max_palendromic())
