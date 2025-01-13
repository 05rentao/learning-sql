-- -------------------------------- CTEs (common table expression) --------------------------------
-- similar to a subquery, 'WITH' keyword
-- can only use CTE immediately after you create it.
-- mainly used to do more complicated queries.

-- --------------------------- CTEs vs Temp Tables --------------------------------
-- CTEs: 1 level of transformation
-- temp tables: if needed to be used multiple times, more advanced tables.
-- --------------------------------------------------------------------------------

WITH CTE_Example AS 
(					--  key word 'WITH'
SELECT gender, AVG(salary) avg_sal, Max(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT AVG(avg_sal)
FROM CTE_Example;
-- could easily be written with a subquery, but easier to look at, 

SELECT AVG(avg_sal)
FROM CTE_Example;  -- CTE only is remembered immediately after.



-- ----------- can create multiple CTEs within one ---------------
 WITH CTE_Example AS 
(					--  key word 'WITH'
SELECT employee_id, gender, birth_date
FROM employee_demographics 
WHERE birth_date > '1985-01-01'
), 
CTE_Example2 AS
(SELECT employee_id, salary
FROM employee_salary
WHERE salary > 50000
)
SELECT *
FROM CTE_Example
JOIN CTE_Example2
	ON CTE_Example.employee_id = CTE_Example2.employee_id
;

-- ----------- renaming CTE column names -----------------]
WITH CTE_Example (gender, avg_sal, max_sal, min_sal, count_sal) AS					-- add parameter names right after CTE name w parenthesis (like java!)
(		
SELECT gender, AVG(salary) avg_sal, Max(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_Example;

