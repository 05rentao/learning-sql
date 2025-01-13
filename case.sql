-- ------------- case statements -----------------
-- add logic to your SELECT statements, like an if-else statment

SELECT first_name,
last_name, 
age,
CASE 
	WHEN age <= 30 THEN 'young'
    WHEN age BETWEEN 31 AND 50 THEN 'old'      -- BETWEEN needs 2 numbers and 'AND'
    WHEN age > 50 THEN 'ancient'
END AS age_bracket
FROM employee_demographics
;


-- pay increase + bonus, 
-- increase:	< 50000 = 5%,	>50000 = 7% 
-- if finance dept, then 10% bonus.

SELECT *
FROM employee_salary;

SELECT first_name, 
last_name, 
salary, 
CASE
	WHEN salary < 50000 THEN salary*1.05
    WHEN salary > 50000 THEN salary*1.07
    ELSE salary
END AS new_salary,
CASE
	WHEN dept_id = 6 THEN salary * 0.1
    ELSE 0
END as bonus
FROM employee_salary