
/*
*  Show me all the employees, hired after 1991, that have had more than 2 titles
*  Database: Employees
*/

SELECT e.emp_no, CONCAT(e.first_name, ' ', e.last_name) AS "Full Name", COUNT(t.title)
FROM employees AS e
JOIN titles AS t ON e.emp_no = t.emp_no
WHERE EXTRACT(YEAR FROM e.hire_date) > 1991
GROUP BY e.emp_no, e.first_name, e.last_name
HAVING COUNT(t.title) > 2;


/*
*  Show me all the employees that have had more than 15 salary changes that work in the department development
*  Database: Employees
*/

SELECT e.emp_no, CONCAT(e.first_name, ' ', e.last_name) AS "Full Name", COUNT(s.salary) AS "Salary Changes"
FROM employees AS e
JOIN salaries AS s ON e.emp_no = s.emp_no
JOIN dept_emp AS de ON de.emp_no = e.emp_no
JOIN departments AS d ON d.dept_no = de.dept_no
GROUP BY e.emp_no, CONCAT(e.first_name, ' ', e.last_name), d.dept_name
HAVING d.dept_name ILIKE 'development' AND COUNT(s.salary) > 15
ORDER BY COUNT(s.salary) DESC;


/*
*  Show me all the employees that have worked for multiple departments
*  Database: Employees
*/

SELECT e.emp_no, CONCAT(e.first_name, ' ', e.last_name) AS "Full Name", COUNT(d.dept_name) AS "Count in departments"
FROM employees AS e
JOIN salaries AS s ON e.emp_no = s.emp_no
JOIN dept_emp AS de ON de.emp_no = e.emp_no
JOIN departments AS d ON d.dept_no = de.dept_no
GROUP BY e.emp_no
HAVING COUNT(d.dept_name) > 1
ORDER BY COUNT(d.dept_name) DESC;
