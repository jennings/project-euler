-- The prime factors of 13195 are 5, 7, 13 and 29.
-- What is the largest prime factor of the number 600851475143 ?

/*
    This recursive table is going to slowly factor the number. On each
    iteration, it divides n (the unfactored number) by the next higher factor.

     * If it divides evenly, then `factor` is a factor of n, and the largest
       prime factor of N (the original n) must also evenly divide n/factor.
     * If not, then increase the factor by 1 and try again.
     * If n=factor, then n is prime (it had no factors smaller than itself),
       and n is a factor of N.

    This is easier to see if you replace the SELECT MIN(n) with SELECT *, and
    let's use 140 as our N because it's quicker:

        n           factor
        ----------  ----------
        140         2
        70          2     <-- 140 % 2 = 0, so 2 is a factor
        35          2     <-- 70 % 2 = 0, so 2 is a factor (again)
        35          3     <-- 35 % 2 <> 0, so we've factored out all the 2s. Try 3 on the next round.
        35          4     <-- 35 % 3 <> 0, so 3 is NOT a factor
        35          5     <-- 35 % 4 <> 0, so 4 is NOT a (prime) factor
        7           5     <-- 35 % 5 = 0, so 5 is a factor. n=35/5
        7           6     <-- 35 % 5 <> 0
        7           7     <-- Since n=factor, we've reached the highest prime factor of 140

    So, MIN(n)=7, which is the greatest prime factor.
*/
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
