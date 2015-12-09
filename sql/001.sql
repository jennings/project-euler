-- If we list all the natural numbers below 10 that are multiples of 3 or 5, we
-- get 3, 5, 6 and 9. The sum of these multiples is 23.

-- Find the sum of all the multiples of 3 or 5 below 1000.

-- Create the integers 1..100
WITH RECURSIVE cte(x) AS (
    VALUES(1)
    UNION ALL
    SELECT x+1 FROM cte WHERE x+1<1000
)
SELECT SUM(x) 'Result'
FROM (
    SELECT * FROM cte
    WHERE x % 3 = 0 -- Multiples of 3
    UNION
    SELECT * FROM cte
    WHERE x % 5 = 0 -- Multiples of 5
) tbl;
