-- unions --
-- allows you to combine rows together from separate/same tables.
-- combines vertically.
-- union distinct vs. union all

SELECT age, gender
FROM employee_demographics
UNION 
SELECT first_name, last_name    -- use SELECT statement again
FROM employee_salary
;
-- for distinct rows, UNION puts one after another
-- but for non distinct rows, UNION eliminates dups automatically, see below
SELECT first_name, last_name
FROM employee_demographics
UNION  							-- can also write as UNION DISTINCT, as it is by default.
SELECT first_name, last_name  
FROM employee_salary
;
-- UNION by default is UNION DISTINCT.

SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name  
FROM employee_salary
;


-- --------------- use case -------------------------
-- want to identify old employees and high paying employees to push out

SELECT first_name, last_name, 'old man' AS Label
FROM employee_demographics 
WHERE age > 40 AND gender = 'male'
UNION
SELECT first_name, last_name, 'old lady' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'female'
UNION
SELECT first_name, last_name, 'highly paid employees' AS Label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name;

-- try to figure out a way to remove dups?


