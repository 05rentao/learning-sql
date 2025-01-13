-- --------------------- subqueries ---------------------
-- nested query?

SELECT *
FROM employee_demographics; 

SELECT *
FROM employee_salary; 

-- --------------------- ex) in where clause ---------------------
-- select employees from recs dept
SELECT *
FROM employee_demographics
WHERE employee_id IN 
			(SELECT employee_id			-- can only have 1 column here
				FROM employee_salary
                WHERE dept_id = 1); 
                
-- --------------------- ex) in select clause ---------------------

SELECT first_name,
last_name,
salary,
AVG(salary) AS average
FROM employee_salary;
-- this won't work because to use aggregate functions in SELECT w multiple rows must add GROUP BY,
-- we just wanna find the avg, as a constant

SELECT employee_id, first_name, last_name, salary,
(SELECT AVG(salary) 										-- avg over entire as constant col using subqueries
FROM employee_salary) AS average,
CASE
	WHEN salary > 0 THEN 100*(1 - (salary/(SELECT AVG(salary) FROM employee_salary)))
END AS percent_difference
FROM employee_salary;

SELECT sal.first_name, sal.last_name, sal.salary, dem.gender,
AVG(salary) OVER(),											-- avg over entire as constant col using OVER()
CASE
	WHEN salary > 0 THEN 100*(1 - (salary/(SELECT AVG(salary) FROM employee_salary)))
END AS percent_difference
FROM employee_salary as sal
JOIN employee_demographics as dem
	ON sal.employee_id = dem.employee_id
ORDER BY dem.gender, percent_difference;


-- --------------------- ex) in from clause ---------------------
SELECT gender, 
AVG(age), 
Max(age), 
MIN(age), 
COUNT(age)
FROM employee_demographics
GROUP BY gender
;

-- find the integer average between the max age of male and female from above table
SELECT AVG(`MAX(age)`) 
FROM 
	(SELECT gender, AVG(age), Max(age), MIN(age), COUNT(age)
	FROM employee_demographics
	GROUP BY gender) AS agg_table
;


