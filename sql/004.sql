/*
    A palindromic number reads the same both ways. The largest palindrome made
    from the product of two 2-digit numbers is 9009 = 91 × 99.
    Find the largest palindrome made from the product of two 3-digit numbers.
*/

-- First, generate the numbers 100-999
WITH RECURSIVE cte(x) AS (
    VALUES(100)
    UNION ALL
    SELECT x+1 FROM cte WHERE x < 999
),
-- Next, find all possible products of 3-digit numbers
numbers(x, y, product) AS(
    SELECT c1.x, c2.x, (c1.x * c2.x)
    FROM cte c1, cte c2
),
-- Finally, find the mirror image of each product
mirrors(original, mirror) AS (
    SELECT
        product,

        -- Two 3-digit numbers must be 6 digits or fewer
        -- This is probably sort of cheating
        ((product/1) % 10) * 100000 +
        ((product/10) % 10) * 10000 +
        ((product/100) % 10) * 1000 +
        ((product/1000) % 10) * 100 +
        ((product/10000) % 10) * 10 +
        ((product/100000) % 10) * 1

    FROM
        numbers
)
-- The answer is the highest number which matches its mirror
SELECT
    MAX(original) 'Result'
FROM
    mirrors
WHERE
    original = mirror
;
