USE employees;

DESCRIBE employees;

SELECT * FROM employees;

SELECT * FROM employees WHERE first_name IN ('irena', 'vidya', 'maya');
-- 709 rows returned

SELECT * FROM employees WHERE first_name ='irena' OR first_name = 'vidya' OR first_name = 'maya';
-- 709 rows returned, same outcome as last questions but different approach

SELECT * FROM employees WHERE (first_name ='irena' OR first_name = 'vidya' OR first_name = 'maya') AND gender = 'm';
-- 441 rows returned

SELECT * FROM employees WHERE last_name LIKE 'e%';
-- 7330 rows returned

SELECT * FROM employees WHERE last_name LIKE 'e%' OR last_name LIKE '%e';
-- 30723  rows returned
SELECT * FROM employees WHERE last_name LIKE 'e%' OR last_name LIKE '%e';
-- 23393 people last_name END with 'e'

SELECT * FROM employees WHERE last_name LIKE 'e%' AND NOT last_name LIKE '%e';
-- 899 employees start and end with 'e' 

SELECT * FROM employees WHERE hire_date LIKE '199%';
-- 135214 rows returned

SELECT * FROM employees WHERE birth_date LIKE '%12-25';
-- 842 rows returned

SELECT * FROM employees WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25';
-- 362 employees returned

SELECT * FROM employees WHERE last_name LIKE '%q%';
-- 1873 rows returned

SELECT * FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';
-- 547 rows returned