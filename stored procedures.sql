-- -------------------------------- stored procedures (functions?) --------------------------------
-- 'CREATE PROCEDURE [procedure name followed by ()]' 	see below
-- can edit location to put stored procedures by USE keyword

USE parks_and_recreation; 		-- this is not neccesary
CREATE PROCEDURE large_salaries()
SELECT *
FROM employee_salary
WHERE salary >= 50000;

-- -------------------------------- calling it --------------------------------
CALL large_salaries();

-- ----------------- ABOVE IS NOT BEST PRACTICE, actual query usually more conplicated -----------------------

-- we want to put both select statements below into the procedure.
CREATE PROCEDURE large_salaries2()
SELECT *
FROM employee_salary
WHERE salary >= 50000;
SELECT *
FROM employee_salary
WHERE salary >= 10000;
-- doesn't work bc delimiter ; runs first 4 lines first then the remaining as it's own seperate query

-- --------------------- changing delimiters ------------------------
-- delimiter: a simple tells sql that the query has ended and another one begins
-- 'DELIMITER $$', $$ is the new delimiter

DELIMITER $$
CREATE PROCEDURE large_salaries3()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 10000;
END $$
DELIMITER ;  -- CHANGE IT BACK !!!! TO ;

CALL large_salaries3();
-- get 2 outputs because 2 queries.

-- ----------------- parameters -----------------------
-- a input value passed to a stored procedure (function parameters!!)

-- ex) for function salaries(), pass employee_id, return their salary.
DELIMITER $$
CREATE PROCEDURE salaries(employee_id_param INT) 				-- imput parameter here, name followed by it's type
BEGIN
	SELECT  employee_id, first_name, last_name, salary
    FROM employee_salary
    WHERE employee_id = employee_id_param ;
END $$
DELIMITER ;
-- naming convention for params: 'p_employee_id', or 'employee_id_param'

CALL salaries(2);
