-- WHERE Clause
-- used to filter records or ROWS of data

SELECT *
FROM employee_salary
WHERE first_name = 'Leslie'
;
-- "=" comparison operator

SELECT *
FROM employee_salary
WHERE salary > 50000
;
-- >= for geq, <= for leq, etc.

SELECT *
FROM employee_demographics
WHERE gender <> 'Female'
; 
-- <> for neq

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR NOT gender = 'Male'
; 
-- greater than 1985, can compare w string
-- AND and OR same principle

SELECT *
FROM employee_demographics
WHERE (first_name = 'Leslie' AND age = 44 ) OR age > 55
;
-- nested conditionals!

-- LIKE statements:
-- %: anything,   _: anything
SELECT *
FROM employee_demographics
where first_name LIKE 'Jer%'
;
-- starts with 'Jer' and has %(anything) following it.

SELECT *
FROM employee_demographics
where first_name LIKE 'a%'
;
-- anyones name start w 'a'

SELECT *
FROM employee_demographics
where first_name LIKE 'a___'
;
-- name start w 'a' and has exactly 3 letters after 'a'

SELECT *
FROM employee_demographics
where first_name LIKE 'a___%'
;
-- name start w 'a' and has at least 3 letters after it



