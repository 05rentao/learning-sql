-- String functions -- 

-- ---------------- length() ----------------

SELECT LENGTH('peepeepoopoo');

SELECT first_name, LENGTH(first_name)
FROM employee_demographics
ORDER BY LENGTH(first_name);
-- order by length of first name!

-- ---------------- upper(), lower() ----------------

SELECT UPPER('peepeepoopoo');
SELECT LOWER('PEEPEEPOOPOO');

SELECT first_name, UPPER(first_name)
FROM employee_demographics
ORDER BY LENGTH(first_name);

-- ---------------- TRIM() ----------------

SELECT TRIM('           PEEPEE                     ');
-- gets rid of white spaces start and end
-- can also trim left and trim right only
SELECT LTRIM('           PEEPEE                     ');
SELECT RTRIM('           PEEPEE                     ');

-- ---------------- right() and left() -------------------

SELECT first_name,
LEFT(first_name, 4),  -- selecting the LEFT 4 characters
RIGHT(first_name, 4)  -- selecting the RIGHT 4 characters
FROM employee_demographics;

-- ---------------- substring(columnName, int startingINDEX, int length) ----------------
SELECT first_name,
LEFT(first_name, 4),  
RIGHT(first_name, 4),
SUBSTRING(first_name, 3, 2)
FROM employee_demographics;

-- find birth month
SELECT first_name, last_name,
substring(birth_date, 6, 2) AS birth_month
FROM employee_demographics; 

-- ----------------- replace(columnName, str toBeReplaced, str replaceWith) ----------------

SELECT first_name, REPLACE(first_name, 'a', 'z')
FROM employee_demographics;


-- ----------------- locate(text toBeLocated, text toLocateFrom) ------------------------------

SELECT LOCATE('x, Alexander');

SELECT first_name, LOCATE('an', first_name)
FROM employee_demographics;

-- ----------------- concat(firstStr, secondStr) ----------------------------------
SELECT first_name, last_name,
CONCAT( first_name, ' ',last_name) AS full_name
FROM employee_demographics;