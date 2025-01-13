-- ---------------- JOINS ----------------
-- joins allow you to conbine 2 tables if they have a common column, 
-- data doesn't have to be the exact same, but similar enough to use
-- innerjoins, outerjoins, and ...?

-- TIP: join should be applied immediately in FROM. 

SELECT * 
FROM employee_demographics;   -- no ron swanson

SELECT *
FROM employee_salary;      -- yes ron swanson
-- these 2 tables share the employee_id column

-- --------------- innerjoins ------------------

SELECT * 
FROM employee_demographics
INNER JOIN employee_salary    -- join by default is INNER JOIN
	ON employee_demographics.employee_id = employee_salary.employee_id	-- tab it for better style
;
-- doesn't work becayse Error Code: 1052. Column 'employee_id' in on clause is ambiguous.
-- to fix, specify where the col is from by using '.'
-- fix that long ass line, use aliasing as follows!!
SELECT * 
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal			-- aliasing!!
	ON dem.employee_id = sal.employee_id	
;

-- can select specific columns as follows, 
SELECT dem.employee_id, age, occupation  
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id	
;

-- ------------------- outer joins --------------------
-- left outer join,  right outer join
-- always including matchings from both tables, 
-- but includes non-matching on whichever side it joins.

SELECT *
FROM employee_demographics AS dem
LEFT OUTER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id	
;
-- all rows in left side included

SELECT *
FROM employee_demographics AS dem
RIGHT OUTER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id	
;
-- all rows in right side included, ron swanson!!
-- include null values for left side bc unmatched.

-- ---------------------- self join ---------------------------
-- a join where you tie the table to itself

-- example, trying to come up with secret santa in a company.
SELECT sal.first_name AS santa, 
sal2.first_name AS recipient
FROM employee_salary AS sal					-- these 2 tables must be distinct, so create alias!!
JOIN employee_salary AS sal2 
	ON sal.employee_id + 1 = sal2.employee_id;
    
-- ---------------- joining multiple tables together, >2 tables -----------------

-- ex) join these 2 tables based iob dept_id in employee_salary
SELECT * 
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal			
	ON dem.employee_id = sal.employee_id	
INNER JOIN parks_departments AS pd
	ON sal.dept_id = pd.department_id
;

