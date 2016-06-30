/*
    By listing the first six prime numbers: 2, 3, 5, 7, 11, and
    13, we can see that the 6th prime is 13.

    What is the 10,001st prime number?
*/

WITH RECURSIVE
primes(n, trial_factor, prime_count, is_prime) AS (
    VALUES(5, 2, 2, 0)
    UNION
    SELECT
        CASE
            -- Go to the next n if we found a factor, or our trial factor is larger than sqrt(n)
            WHEN n % trial_factor = 0 OR trial_factor * trial_factor > n
            THEN n + 1
            ELSE n
        END,
        CASE
            -- Reset our trial factor back to 2 if we went to the next n
            WHEN n % trial_factor = 0 OR trial_factor * trial_factor > n
            THEN 2
            ELSE trial_factor + 1
        END,
        CASE
            -- If n is not resetting and the next trial factor is larger than sqrt(n),
            -- then the next n is prime
            WHEN NOT (n % trial_factor = 0 OR trial_factor * trial_factor > n)
                AND (trial_factor + 1) * (trial_factor + 1) > n
            THEN prime_count + 1
            ELSE prime_count
        END,
        CASE
            -- If n is not resetting and the next trial factor is larger than sqrt(n),
            -- then the next n is prime
            WHEN NOT (n % trial_factor = 0 OR trial_factor * trial_factor > n)
                AND (trial_factor + 1) * (trial_factor + 1) > n
            THEN 1
            ELSE 0
        END
    FROM
        primes
    WHERE
        prime_count < 10001 OR
        (prime_count = 10001 AND is_prime)
)

SELECT
    n "Result"
FROM
    primes
WHERE
    is_prime
    AND prime_count = 10001
;
