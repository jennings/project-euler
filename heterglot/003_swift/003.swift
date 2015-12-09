// The prime factors of 13195 are 5, 7, 13 and 29.

// What is the largest prime factor of the number 600851475143?

func lowestDivisor(n: Int) -> Int {
    // Start at 2, and count up to n
    // looking for a divisor. If we find
    // it, it's the lowest.
    var i = 2
    while i < n {
        if n % i == 0 {
            return i
        }
        i += 1
    }

    // We didn't find a divisor, so it's prime.
    // That means 1 must be the lowest divisor.
    return 1
}

func highestPrimeDivisor(product: Int) -> Int {
    let lowest = lowestDivisor(product)
    if lowest == 1 {
        return product
    }
    let remainder = product / lowest
    return highestPrimeDivisor(remainder)
}

let product = 600851475143
var result = highestPrimeDivisor(product)

print("Result: \(result)")
