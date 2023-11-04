--Employee Database Queries 

--List the employee number, last name, first name, sex, and salary of each employee (2 points)
CREATE VIEW Employee_Overview AS
SELECT e.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name as "First Name", e.sex as "Sex", s.salary as "Salary"
FROM "Employees" as e 
INNER JOIN "Salaries" as s ON e.emp_no = s.emp_no
ORDER BY e.last_name; 

SELECT * FROM employee_overview; 
 

--List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)
CREATE VIEW Employees_1986 AS 
SELECT first_name as "First Name", last_name as "Last Name", hire_date as "Hire Date"
FROM "Employees"
WHERE date_part('year', hire_date) = 1986

SELECT * FROM employees_1986; 


--List the manager of each department along with their department number, department name, employee number, last name, and first name (2 points)
CREATE VIEW department_managers AS
SELECT e.emp_no as "Employee Number",e.first_name as "First Name", e.last_name as "Last Name", d.dept_name as "Department Name", m.dept_no as "Department Number"
FROM "DepartmentManagers" as m
INNER JOIN "Departments" as d ON m.dept_no = d.dept_no
INNER JOIN "Employees" as e ON m.emp_no = e.emp_no; 

SELECT * FROM department_managers; 

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points)
CREATE VIEW department_employees AS 
SELECT de.emp_no as "Employee Number",  e.first_name as "First Name", e.last_name as "Last Name", d.dept_no as "Department Number", d.dept_name as "Department Name"
FROM "Employees" as e
INNER JOIN "DepartmentEmployees" as de on de.emp_no = e.emp_no
INNER JOIN "Departments" as d on de.dept_no = d.dept_no
ORDER BY d.dept_name; 

SELECT * FROM department_employees; 

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B (2 points)
CREATE VIEW employees_hercules AS
SELECT last_name as "Last Name", first_name as "First Name", sex as "Sex"
FROM "Employees" 
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'
ORDER BY last_name; 

SELECT * FROM employees_hercules; 

--List each employee in the Sales department, including their employee number, last name, and first name (2 points)
CREATE VIEW sales_employees AS
Select e.first_name as "First Name", e.last_name as "Last Name", de.emp_no as "Employee Number", de.dept_no as "Department Number", d.dept_name as "Department Name"
FROM "Employees" as e 
INNER JOIN "DepartmentEmployees" as de on de.emp_no = e.emp_no
INNER JOIN "Departments" as d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'; 

SELECT * FROM sales_employees; 

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)
CREATE VIEW sales_development_employees AS 
Select e.first_name as "First Name", e.last_name as "Last Name", de.emp_no as "Employee Number", de.dept_no as "Department Number", d.dept_name as "Department Name"
FROM "Employees" as e 
INNER JOIN "DepartmentEmployees" as de on de.emp_no = e.emp_no
INNER JOIN "Departments" as d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
ORDER BY dept_name; 

SELECT * FROM sales_development_employees; 

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)
CREATE VIEW lastname_counts AS 
SELECT last_name, COUNT(last_name) AS "Last Name Frequency" 
FROM "Employees"
GROUP BY last_name
ORDER BY "Last Name Frequency" DESC; 

SELECT * FROM lastname_counts; 
