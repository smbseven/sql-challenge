--for all queries, created aliases for each table:
--e for employees
--d for departments
--de for dept_employee
--s for salaries
--dm for dept_manager


--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees AS e LEFT JOIN salaries AS s
ON e.emp_no=s.emp_no
ORDER BY e.emp_no;

--2. List employees who were hired in 1986.
SELECT * FROM employees
WHERE DATE_PART('year',hire_date) = 1986
ORDER BY emp_no;

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
FROM dept_manager AS dm
INNER JOIN departments AS d
ON dm.dept_no=d.dept_no
LEFT JOIN employees AS e
ON dm.emp_no=e.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_employee AS de
ON e.emp_no=de.emp_no
INNER JOIN departments AS d
ON de.dept_no=d.dept_no;

--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_employee AS de
ON e.emp_no=de.emp_no
INNER JOIN departments AS d
ON de.dept_no=d.dept_no
WHERE d.dept_name='Sales';


--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_employee AS de
ON e.emp_no=de.emp_no
INNER JOIN departments AS d
ON de.dept_no=d.dept_no
WHERE d.dept_name in ('Sales','Development');


--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(*) AS f_ct
FROM employees
GROUP BY last_name
ORDER BY f_ct DESC;
