-- * means everything
select *
from parks_and_recreation.employee_demographics;

-- can select multiple columns
SELECT first_name,
last_name,
age,
(age + 1) * 10 + 10
FROM parks_and_recreation.employee_demographics;
# PEMDAS (Comment)

-- distinct: only shows one of each as follows
SELECT DISTINCT gender
FROM parks_and_recreation.employee_demographics;

-- distinct: if multiple column, shows distinct rows.
SELECT DISTINCT first_name, gender
FROM parks_and_recreation.employee_demographics;

