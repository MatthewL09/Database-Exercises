USE employees;

-- Question 1
SELECT *
FROM employees
JOIN dept_emp
USING (emp_no)
WHERE to_date > NOW() AND hire_date IN  (
	SELECT hire_date
	FROM employees
	WHERE emp_no ='101010' ) ;
	
-- Question 2
SELECT DISTINCT title
FROM titles 
WHERE emp_no IN (
	SELECT emp_no
	FROM employees
	JOIN dept_emp 
	USING (emp_no)
	WHERE first_name = 'Aamod' AND to_date > NOW());
	
-- Question 3
SELECT COUNT(emp_no) AS 'Ex-employees'
FROM employees
WHERE emp_no NOT IN (
	SELECT emp_no
	FROM dept_emp de
	WHERE to_date > NOW());
	-- 59,900 ex employees


-- Question 4
SELECT first_name, gender
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM employees
	WHERE gender = 'f' AND emp_no IN(
		SELECT emp_no
		FROM dept_manager
		WHERE to_date > NOW()));
	-- ISAMU, KARSTEN, LEON, HILARY
	
	

-- QUESTIONS 5	
SELECT first_name, last_name
FROM dept_emp de
JOIN employees e
USING (emp_no)
WHERE de.to_date >now() AND emp_no IN (
	SELECT emp_no
	FROM salaries s
	WHERE salary > (
	SELECT AVG(salary)
	FROM salaries));
	
-- QUESTION 6

SELECT

(SELECT COUNT(salary) 
FROM salaries
WHERE to_date > NOW() AND salary >= 
(SELECT MAX(salary) - STDDEV(salary) 
	FROM salaries
	WHERE to_date > NOW())
	
	 / (
		SELECT COUNT(salary)
		FROM salaries
		WHERE to_date > NOW()) * 100;