# A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,
#
# a^2 + b^2 = c^2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.


if __name__ == "__main__":
    for c in range(1000):
        for b in range(c):
            for a in range(b):
                if a**2 + b**2 == c**2:
                    if a + b + c == 1000:
                        print("a       = " + str(a))
                        print("b       = " + str(b))
                        print("c       = " + str(c))
                        print("product = " + str(a * b * c))
                        import sys
                        sys.exit()
