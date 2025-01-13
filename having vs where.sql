-- Having vs. Where
-- having works after GROUPBY, works only for aggregate functions.

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
;

SELECT gender, AVG(age)
FROM employee_demographics
WHERE AVG(age) > 40
GROUP BY gender
;
-- should return male, bc avg age of male gender group is > 40
-- this doesn't  work because it takes avg FIRST, then creates the groups
-- that is not what we want in this scenario. Therefore we use having

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40
;
-- works! having is created precisely for this example

SELECT occupation
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary) > 75000
;
-- the having clause is different from the where clause
-- having: only works for AGGREGATE functions works AFTER the GROUP BY runs, 
-- where: used a lot more, filter columns.
SELECT salary, 
FROM employee_salary;
ORDER BY salary


