-- ---------------- Limit & Aliasing ----------------

-- ---------------- LIMIT ----------------
-- limit the number of rows, best used with order by to limit top 10 watchmojo

SELECT *
FROM employee_demographics
;

SELECT *
FROM employee_demographics
LIMIT 3
;
-- Take top 3 rows

SELECT *
FROM employee_demographics
ORDER BY age DESC
limit 3
;
-- LIMIT is best worked with ORDER BY

SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 2, 1
;
-- additionally parameter for LIMIT, it's like limit(int startingROW, int numROWS) ...



-- ---------------- ALIASING ----------------
-- change the name of a column in code, as well as in display.

-- before
SELECT gender
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40;
-- if we want to show the actual AVG in graph: need to SELECT
SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(AGE) > 40;

-- we keep referring to AVG(age), repetitive, create an alias for AVG(age) as follows, also changes name of column
SELECT gender, AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender 
HAVING avg_age > 40;

-- note: you can actually omit 'AS' and it would still work, like the following, but keep it in for style? 
SELECT gender, AVG(age) avg_age
FROM employee_demographics
GROUP BY gender 
HAVING avg_age > 40;



