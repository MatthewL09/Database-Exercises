SELECT * FROM employees WHERE first_name IN ('irena', 'vidya', 'maya') ORDER BY first_name;
-- first_name, last_name first row is 'Irena Reutenauer'
-- first_name, last_name last row is 'Vidya Simmen'

SELECT last_name, first_name FROM employees WHERE first_name IN ('irena', 'vidya', 'maya') ORDER BY first_name, last_name;
-- first_name, last_name first row 'Irena Acton'
-- first_name, last_name last row 'Vidya Zweizig'

SELECT last_name, first_name FROM employees WHERE first_name IN ('irena', 'vidya', 'maya') ORDER BY last_name, first_name;
-- first_name, last_name first row 'Irena Acton'
-- first_nam, last_name last row 'Maya Zyda'

SELECT * FROM employees WHERE last_name LIKE 'e%' AND last_name LIKE '%e' ORDER BY emp_no;
-- 899 employees returned
-- first employee number - 10021 'Ramzi Erde'
-- last employee number - 499648 'Tadahiro Erde'

SELECT * FROM employees WHERE last_name LIKE 'e%' AND last_name LIKE '%e' ORDER BY hire_date DESC;
-- 899 employees returned
-- newest employee 'Teiji Eldidge'
-- oldest employee 'Sergi Erde'

SELECT * FROM employees Where hire_date LIKE '199%' AND birth_date LIKE '%12-25' ORDER BY birth_date, hire_date;
-- 362 employees returned
-- oldest employee hired last 'Khun Bernini'
-- youngest employee hire first 'Douadi Pettis'