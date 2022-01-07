
SELECT CONCAT(first_name, ' ', last_name) AS 'Full Name' FROM employees WHERE last_name LIKE 'e%e';

SELECT UPPER(CONCAT(first_name, ' ', last_name)) AS 'Full Name' FROM employees WHERE last_name LIKE 'e%e';

SELECT *, datediff(CURDATE(), hire_date) AS Date_diff FROM employees WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25';

SELECT min(salary) FROM salaries;

SELECT max(salary) FROM salaries;

SELECT first_name, last_name, birth_date, LOWER(CONCAT(first_name, last_name, '_', birth_date,1,4)) AS username FROM employees;