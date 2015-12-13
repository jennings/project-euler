/*
    2520 is the smallest number that can be divided by each of the numbers from
    1 to 10 without any remainder.
    What is the smallest positive number that is evenly divisible by all of the
    numbers from 1 to 20?
*/

WITH RECURSIVE
-- Generate the integers 1-20
numbers(n) AS (
    VALUES(1)
    UNION
    SELECT n+1 FROM numbers WHERE n<20
),

-- Factor each number into its prime factors
factors(original, n, trial, factor) AS (
    SELECT n, n, 2, NULL FROM numbers
    UNION
    SELECT
        original,
        CASE n % trial
            WHEN 0 THEN n/trial    -- The answer must also divide n/trial
            ELSE n
        END,
        CASE n % trial
            WHEN 0 THEN trial      -- It may divide several times
            ELSE trial+1           -- Nope, find the next prime trial
        END,
        CASE n % trial
            WHEN 0 THEN trial
            ELSE NULL
        END
    FROM
        factors
    WHERE
        n > 1
),

-- Count the number of times each factor divides the original
result_factors(factor, ct) AS (
    SELECT factor, count(*)
    FROM factors
    WHERE factor IS NOT NULL
    GROUP BY original, factor
),

-- Find the largest exponent for each prime factor
exponents(factor, exponent) AS (
    SELECT factor, MAX(ct)
    FROM result_factors
    GROUP BY factor
),

-- Exponentiate each prime factor
-- (2, 3) becomes 8
-- (3, 4) becomes 81
-- etc.
raised_factors(product, factor, ct) AS (
    SELECT 1, factor, exponent
    FROM exponents
    UNION
    SELECT
        product*factor,
        factor,
        ct - 1
    FROM raised_factors
    WHERE ct > 0
),

-- Multiply all the rows together
multiplication(product, ct) AS (
    SELECT product, 1
    FROM raised_factors
    WHERE ct = 0
    UNION
    SELECT
        m.product * o.product,
        m.ct + 1
    FROM
        multiplication m,
        raised_factors o
    WHERE
        m.product % o.product <> 0
        AND o.ct = 0
)

-- The result is in the row which has been multiplied
-- the most number of times
SELECT
    product AS 'Result'
FROM
     multiplication
ORDER BY
    ct DESC
LIMIT 1
;
