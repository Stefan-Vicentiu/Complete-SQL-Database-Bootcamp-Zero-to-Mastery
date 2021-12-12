/*
*  How many people were hired on any given hire date?
*  Database: Employees
*  Table: Employees
*/

SELECT e.hire_date, COUNT(e.emp_no) AS "Employees no"
FROM employees AS e
GROUP BY e.hire_date

/*
*   Show me all the employees, hired after 1991 and count the amount of positions they've had
*  Database: Employees
*/

SELECT e.emp_no, COUNT(t.title) AS "Titles no"
FROM employees AS e
JOIN titles AS t ON e.emp_no = t.emp_no
WHERE EXTRACT(YEAR FROM e.hire_date) > 1991
GROUP BY e.emp_no;


/*
*  Show me all the employees that work in the department development and the from and to date.
*  Database: Employees
*/

SELECT e.emp_no, e.first_name, e.last_name, d.from_date, d.to_date, dep.dept_name
FROM employees AS e
JOIN dept_emp AS d ON e.emp_no = d.emp_no
JOIN departments AS dep ON dep.dept_no = d.dept_no
WHERE dep.dept_name ILIKE 'Development'
GROUP BY e.emp_no, e.first_name, e.last_name, d.from_date, d.to_date, dep.dept_name
ORDER BY e.emp_no;
