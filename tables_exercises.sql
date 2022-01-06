USE employees;

SHOW TABLES;
# tables available > current_dept_emp, departments, dept_emp, dept_emp_latest_date, dept_manager, employees, salaries, titles

DESCRIBE employees;
# data types available are integers, string, date (all types)
# numeric type > employee number, 
# string > first_name, last_name, gender
# date type > hire_date, birth_date

# RELATION between employees and department number is the primary key 

SHOW CREATE TABLE employees;
#CREATE TABLE `employees` (
  `emp_no` int NOT NULL,
  `birth_date` date NOT NULL,
  `first_name` varchar(14) NOT NULL,
  `last_name` varchar(16) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `hire_date` date NOT NULL,
  PRIMARY KEY (`emp_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
