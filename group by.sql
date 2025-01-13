-- Group By --
-- if using aggregate in SELECT, must follow with GROUP BY

SELECT * 
FROM employee_demographics;

SELECT first_name
FROM employee_demographics
GROUP BY gender
;
-- THIS WONT WORK BC 'first_name' must match 'gender', the cols must match
-- unless the select col is an aggregate like AVG

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
;
-- now works bc cols match and also shows avrg age per gender!

SELECT occupation, salary
FROM employee_salary
GROUP BY occupation, salary
;
-- GROUP BY is similar to DISTINCT!!
SELECT DISTINCT occupation, salary
FROM employee_salary
;
-- MAX, MIN
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender
;

-- ORDER BY
SELECT *
FROM employee_demographics
ORDER BY first_name DESC
;
-- in ascending order "ASC", decending "DESC"

SELECT *
FROM employee_demographics
ORDER BY gender, age DESC
;
-- ordering by multiple cols

-- can also use order by except you can using col # instead of the col name
SELECT *
FROM employee_demographics
ORDER BY 5, 4 DESC
;
-- because gender is col 4, age is col 5, ***not best practice! in case you want to delect col