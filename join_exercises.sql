USE employees;

SELECT branch.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name)AS 'Manager name'
FROM dept_manager AS dm
JOIN departments AS branch
ON dm.dept_no = branch.dept_no
JOIN employees AS e
ON dm.emp_no = e.emp_no
WHERE dm.to_date LIKE '999%'
ORDER BY branch.dept_name;

SELECT branch.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Manager name'
FROM dept_manager AS dm
JOIN departments AS branch
ON dm.dept_no = branch.dept_no
JOIN employees AS e
ON dm.emp_no = e.emp_no
WHERE dm.to_date LIKE '999%' AND e.gender = 'F';



SELECT t.title, COUNT(*)
FROM departments d
JOIN dept_emp de
ON d.dept_no = de.dept_no
JOIN employees e
ON de.emp_no = e.emp_no
JOIN titles t
ON e.emp_no = t.emp_no
WHERE d.dept_name LIKE 'customer%' AND (de.to_date AND t.to_date LIKE '999%')
GROUP BY t.title
ORDER BY t.title;

SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_nam) AS 'Name', s.salary AS 'Salary'
FROM departments d
JOIN dept_manager dm
ON d.dept_no = dm.dept_no
JOIN salaries s
ON dm.emp_no = s.emp_no
JOIN employees e
ON s.emp_no = e.emp_no
WHERE dm.to_date LIKE '9999%' AND s.to_date LIKE '9999%';

SELECT d.dept_no, d.dept_name, COUNT(*)
FROM departments d
JOIN dept_emp de
ON d.dept_no = de.dept_no
WHERE de.to_date LIKE '999%'
GROUP BY d.dept_name
ORDER BY d.dept_no;

SELECT d.dept_name AS 'Department Name', AVG(s.salary) AS 'Payscale'
FROM dept_emp de
JOIN departments d
ON de.dept_no = d.dept_no
JOIN salaries s
ON de.emp_no = s.emp_no 
WHERE s.to_date LIKE '999%'
GROUP BY d.dept_name
ORDER BY payscale DESC
LIMIT 1;

SELECT e.first_name, e.last_name, s.salary
FROM departments d
JOIN dept_emp de
USING(dept_no)
JOIN salaries s
USING (emp_no)
JOIN employees e
USING (emp_no)
WHERE d.dept_name = 'Marketing' AND s.to_date LIKE '999%'
ORDER BY s.salary DESC
LIMIT 1;

