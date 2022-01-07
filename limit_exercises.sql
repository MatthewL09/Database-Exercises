USE employees;

DESCRIBE employees;

SELECT DISTINCT last_name FROM employees ORDER BY last_name DESC LIMIT 10;
-- Zykh, Zyda, Zwicker, Zweizig, Zumaque, Zultner, Zucker, Zuberek, Zschoche, Zongker

SELECT * FROM employees WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25' ORDER BY hire_date LIMIT 5;
-- Alselm Cappello, Utz Mandell, Bouchung Schreiter, Baocai Kushner, Petter Stroustrup

SELECT * FROM employees WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25' ORDER BY hire_date LIMIT 5 OFFSET 45;
-- The number of results skipped would depend on how many results there are per page. OFFSET should be divisible by LIMIT to understand page number
