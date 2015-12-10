-- The prime factors of 13195 are 5, 7, 13 and 29.
-- What is the largest prime factor of the number 600851475143 ?

-- This recursive table is going to slowly factor the number.
-- On each iteration, it divides the number by the next higher factor.
--  * If it divides evenly, then `factor` is a factor of n, and the largest prime
--    factor of n must evenly divide n/factor.
--  * If not, then increase the factor by 1 and try again..
--  * If n=factor, then n is prime, n is a factor of N.
WITH RECURSIVE factors(n, factor) AS (
    VALUES(600851475143, 2)
    UNION
    SELECT
        CASE n % factor
            WHEN 0 THEN n/factor    -- The answer must also divide n/factor
            ELSE n
        END,
        CASE n % factor
            WHEN 0 THEN factor      -- It may divide several times
            ELSE factor+1           -- Nope, find the next prime factor
        END
    FROM
        factors
    WHERE
        factor <> n
)
SELECT
    MIN(n) 'Result'
FROM
    factors
;
