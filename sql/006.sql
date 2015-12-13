/*
    The sum of the squares of the first ten natural numbers is,

        1^2 + 2^2 + ... + 10^2 = 385

    The square of the sum of the first ten natural numbers is,

        (1 + 2 + ... + 10)^2 = 55^2 = 3025

    Hence the difference between the sum of the squares of the first ten
    natural numbers and the square of the sum is 3025 − 385 = 2640.

    Find the difference between the sum of the squares of the first one hundred
    natural numbers and the square of the sum.
*/

WITH RECURSIVE
numbers(n) AS (
    VALUES(1)
    UNION
    SELECT n + 1 FROM numbers WHERE n < 100
),

sum_of_squares(n) AS (
    SELECT SUM(n * n) FROM numbers
),

square_of_sum(n) AS (
    SELECT SUM(n) * SUM(n) FROM numbers
)

SELECT
    sqsu.n - susq.n AS 'Result'
FROM
    square_of_sum sqsu,
    sum_of_squares susq
;
