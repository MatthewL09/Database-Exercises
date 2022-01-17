USE employees;


-- 1
SELECT e.emp_no, de.dept_no, e.hire_date, de.to_date,
IF (de.to_date > NOW(), 1, 0) AS Is_current_employee
FROM dept_emp de
JOIN employees e 
USING (emp_no);

-- 2
SELECT CONCAT(e.last_name, ' ', e.first_name) AS Employee_name, de.to_date,
CASE 
WHEN e.last_name BETWEEN 'A%' and 'H%' THEN 'A-H'
WHEN e.last_name BETWEEN 'I%' and 'Q%' THEN 'I-Q'
ELSE 'R-Z'
END AS alpha_group
FROM employees e
JOIN dept_emp de
USING (emp_no)
ORDER BY alpha_group;

-- 3
SELECT 
CASE 
WHEN birth_date LIKE '195%' then '50\'s'
WHEN birth_date LIKE '196%' then '60\'s'
END AS birth_decade,
COUNT(*)
FROM employees 
GROUP BY birth_decade;


USE employees;
-- 4
SELECT ROUND(AVG(s.salary)),
CASE
WHEN dept_no IN ('d008', 'd005') THEN 'R&D'
WHEN dept_no IN ('d007', 'd001') THEN 'Sales & Marketing'
WHEN dept_no IN ('d004', 'd006') THEN 'Prod & QM'
WHEN dept_no IN ('d002', 'd003') THEN 'Finance & HR'
ELSE dept_name
END AS department_groups
FROM departments
JOIN dept_emp de
USING (dept_no)
JOIN salaries s
USING (emp_no)
WHERE de.TO_DATE > NOW() AND s.to_date >NOW()
GROUP BY department_groups
ORDER BY AVG(s.salary) DESC;