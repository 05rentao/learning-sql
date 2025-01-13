-- Triggers and Events
-- a block of code that executes automatically when an event takes place on a specific table.

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

-- ex) we want to write a table where when data is updated in employee_salary it will also update in employee demographics
		-- helps us have multiples queries in code
DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW 			-- loop 
BEGIN
	INSERT INTO employee_demographics (employee_id, first_name, last_name)
	VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);			 -- 'NEW' to refer to row that is inserted), 'old' is another word
END $$
DELIMITER ;

-- try inserting now!

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, 
salary, dept_id)
Values(13, 'Chill', 'Guy', 'Chill Guy', 0, NULL);

DELETE FROM employee_salary WHERE first_name = 'Ren';

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, 
salary, dept_id)
Values(14, 'Ren', 'Tao', 'CEO', 1000000, NULL);



-- ---------------- events -----------------
-- a trigger happens when an event happens, an event is a scheduled code

SELECT * 
FROM employee_demographics; 

-- lets retire employees over 60

DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE
    FROM employee_demographics
    WHERE age >= 60;
END $$
DELIMITER ;

SHOW VARIABLES LIKE 'event%';