-- --------------------------- window functions ---------------------------
-- similar to a GROUP BY, except without rolling all into 1 row.
-- row numbers, rank, dense rank

SELECT *
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;

-- using GROUP BY
SELECT gender, AVG(salary) AS average_salary
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender;
-- GROUP BY rolls every up in one row

-- lets see something similar done in a window function below
SELECT dem.first_name, dem.last_name, gender, salary, AVG(salary) OVER(PARTITION BY gender)		-- PARTITION BY !!!.
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
-- compared with query on line 10, this one keeps multiple rows of gender.
-- using window function is important bc if you want to add additional info by adding cols like names
-- doing this with GROUP BY (see below) will not work because need to change both SELECT & GROUP BY for it to even work, 
-- and changing GROUP BY changes AVG(salary) calculations
SELECT dem.first_name, dem.last_name, gender, AVG(salary) AS average_salary
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
GROUP BY dem.first_name, dem.last_name, gender;


-- --------------------------- note: use of OVER() ---------------------------
-- OVER() without param is just entire column.
SELECT gender, AVG(salary) OVER()
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    
-- --------------------------  rolling total --------------------------------
-- adds together sum one by one, KEY: 'ORDER BY dem.employee_id'
SELECT dem.first_name, dem.last_name, gender, salary, 
SUM(salary) OVER(PARTITION BY gender) AS sum_salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS rolling_total 
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    
-- -------------------------- ROW_NUMBER() --------------------------
-- literally just creates an index, if it partitions, creates multiple indicies for each partition
-- row number depends on paritition and order
SELECT dem.first_name, dem.last_name, gender, salary, 
ROW_NUMBER() OVER()
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    
-- w/ partition
SELECT dem.first_name, dem.last_name, gender, salary, 
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC)
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;

-- -------------------------- RANK() --------------------------
-- same as row number, however, in case of orderby, dup values get assigned same row number
-- next row num after dup DOES skips values.
-- only difference is dup indicies
SELECT dem.first_name, dem.last_name, gender, salary, 
RANK() OVER(PARTITION BY gender ORDER BY salary DESC)
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
-- 5, 5, 7


-- -------------------------- DENSE_RANK() --------------------------
-- next row num after dup does NOT skips values.
SELECT dem.first_name, dem.last_name, gender, salary, 
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC)
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
-- 5, 5, 6

-- comparison between ROW_NUMBER, RANK, DENSE_RANK --

SELECT dem.first_name, dem.last_name, gender, salary, 
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS 'row_number' ,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS 'rank' ,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS 'dense_rank'
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;



