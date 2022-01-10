USE employees;

DESCRIBE titles;

SELECT DISTINCT title FROM titles;
-- 7 unique titles listed.

SELECT last_name FROM employees WHERE last_name LIKE 'E%E' GROUP BY last_name;

SELECT first_name, last_name FROM employees WHERE last_name LIKE 'E%E' GROUP BY first_name, last_name;

SELECT last_name FROM employees WHERE last_name LIKE '%q%' and last_name NOT LIKE '%qu%' GROUP BY last_name;

-- 5. 'Chleq' , 'Lindqvist' , 'Qiwen'

SELECT last_name, COUNT(*) FROM employees WHERE last_name LIKE '%q%' and last_name NOT LIKE '%qu%' GROUP BY last_name;

-- 6. 189, 190, 168

SELECT COUNT(T.USERNAME), SUM(T.NUM_SHARED) FROM(SELECT first_name, gender, COUNT(*) FROM employees WHERE first_name IN ('Irena', 'Maya', 'Vidya') GROUP BY first_name, gender ORDER BY first_name;
-- 7 GENDER COUNT INCLUDED

SELECT LOWER(CONCAT(SUBSTR(first_name, 1,1), SUBSTR(last_name, 1,4), '_', SUBSTR(birth_date,6,2), SUBSTR(birth_date, 3, 2)))  AS username, COUNT(*) AS repeats
FROM employees 
GROUP BY username
HAVING repeats > 1
ORDER BY repeats DESC;) AS t;
-- 8. there are 13251  repeat usernamees

SELECT emp_no, AVG(salary)
FROM salaries
GROUP BY emp_no;
-- 9a. 

SELECT * FROM salaries LIMIT 2;

SELECT dept_no, COUNT(emp_no) AS employees_in_dept
FROM dept_emp
WHERE to_date > NOW()
GROUP BY dept_no;
-- 9b. 9 rows returned

SELECT emp_no, COUNT(salary) AS pay_hist
FROM salaries
GROUP BY emp_no
ORDER BY pay_hist;
-- 9c. employee pay history

SELECT emp_no, MAX(salary) AS max_pay, MIN(salary) AS first_pay
FROM salaries
GROUP BY  emp_no
ORDER BY max_pay;
-- 9d. max and min

SELECT emp_no, STDDEV(salary) AS var_pay
FROM salaries
GROUP BY emp_no;

SELECT emp_no, MAX(salary) AS pay_day
FROM salaries
GROUP BY emp_no
HAVING pay_day > 150000;

SELECT emp_no, AVG(salary) AS payscale
FROM salaries
GROUP BY emp_no
HAVING payscale BETWEEN 80000 AND 90000;