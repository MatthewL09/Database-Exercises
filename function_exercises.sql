
SELECT CONCAT(first_name, ' ', last_name) AS 'Full Name' FROM employees WHERE last_name LIKE 'e%e';

SELECT UPPER(CONCAT(first_name, ' ', last_name)) AS 'Full Name' FROM employees WHERE last_name LIKE 'e%e';

SELECT *, datediff(CURDATE(), hire_date) AS Date_diff FROM employees WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25';

SELECT min(salary) FROM salaries;

SELECT max(salary) FROM salaries;

SELECT LOWER(CONCAT(SUBSTR(first_name, 1,1), SUBSTR(last_name, 1,4), '_', SUBSTR(birth_date,6,2), SUBSTR(birth_date, 3, 25))) AS username, first_name, last_name, birth_date FROM employees;