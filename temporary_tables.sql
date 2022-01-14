-- TEMPORARY TABLES EXERCISES

USE innis_1666;

DROP TABLE employees_with_departments;

CREATE TEMPORARY TABLE employees_with_departments AS (SELECT * FROM employees.employees
JOIN employees.dept_emp USING (emp_no)
JOIN employees.departments USING (dept_no));


SELECT * FROM employees_with_departments LIMIT 10;

ALTER TABLE employees_with_departments ADD full_name VARCHAR (40);

UPDATE employees_with_departments SET full_name = CONCAT(first_name, ' ', last_name);

SELECT * FROM employees_with_departments LIMIT 5;

ALTER TABLE employees_with_departments DROP COLUMN first_name;

ALTER TABLE employees_with_departments DROP COLUMN last_name;


-- new temp table

USE innis_1666;

DROP TABLE temporary_payments;

CREATE TEMPORARY TABLE temporary_payments AS (SELECT * FROM sakila.payment) ;

SELECT * FROM temporary_payments LIMIT 5;

UPDATE temporary_payments SET amount = CASE WHEN amount = int(*) ;

-- Q 3


CREATE TEMPORARY TABLE current_pay AS
(SELECT dept_name, AVG(salary) AS dept_current_avg
FROM employees.salaries
JOIN employees.dept_emp USING (emp_no)
JOIN employees.departments USING (dept_no)
WHERE employees.dept_emp.to_date > NOW()
AND employees.salaries.to_date > NOW()
GROUP BY dept_name);

