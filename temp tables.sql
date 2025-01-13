-- --------------------------- Temporary Tables ---------------------------
-- storing intermediate results for a more complex query
-- you can insert data into temp table
-- temp tables are saved for the session, independent of the document that is opened.
-- only deleted when close mySQL fully.

-- --------------------------- CTEs vs Temp Tables --------------------------------
-- CTEs: 1 level of transformation
-- temp tables: if needed to be used multiple times, more advanced tables.

-- -------------- first way of creating temp tables ----------------------------
CREATE TEMPORARY TABLE temp_table
(first_name varchar(50),
last_name varchar(50), 
favorite_movie varchar(100)
);
-- nothing will show up, but is creates via console log
-- to view table, write a new query

SELECT *
FROM temp_table;

-- -------------- insert data --------------
INSERT INTO temp_table
VALUES ('Ren', 'Tao', 'Your Name (2016)');
-- every time you run you add another value

-- -------------- second way of creating temp tables, selecting instead of inserting --------------
SELECT *
FROM employee_salary;

-- temp_table where empl make more than 50000
CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary >= 50000;

SELECT * 
FROM salary_over_50k
