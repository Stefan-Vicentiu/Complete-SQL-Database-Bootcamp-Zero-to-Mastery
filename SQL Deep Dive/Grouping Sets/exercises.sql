/*
*  Calculate the total amount of employees per department and the total using grouping sets
*  Database: Employees
*  Table: Employees
*/

SELECT COUNT(e.emp_no) AS "# of employees", d.dept_name
FROM employees AS e
JOIN dept_emp AS de ON de.emp_no = e.emp_no
JOIN departments AS d ON d.dept_no = de.dept_no
GROUP BY 
    GROUPING SETS (
        (),
        (d.dept_name)
    )
ORDER BY d.dept_name
    

/*
*  Calculate the total average salary per department and the total using grouping sets
*  Database: Employees
*  Table: Employees
*/

SELECT ROUND(AVG(s.emp_no), 2) AS "Average Salary", d.dept_name 
FROM salaries AS s
JOIN dept_emp AS de ON de.emp_no = s.emp_no
JOIN departments AS d ON d.dept_no = de.dept_no
GROUP BY 
    GROUPING SETS (
        (),
        (d.dept_name )
    )
ORDER BY d.dept_name
