--queries for data analysis
--List the following details of each employee: employee number, last name, first name, gender, and salary.
select employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.gender,
	salaries.salary
from employees left join salaries on (employees.emp_no = salaries.emp_no)
order by employees.emp_no;

--List employees who were hired in 1986.
select first_name, last_name, hire_date from employees
where hire_date >'12/31/1985' and hire_date <'01/01/1987';

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, 
--and start and end employment dates.
select dept_manager.dept_no,
departments.dept_name,
dept_manager.emp_no,
employees.last_name,
employees.first_name,
dept_manager.from_date,
dept_manager.to_date

from dept_manager inner join departments on (dept_manager.dept_no = departments.dept_no)
inner join employees on (dept_manager.emp_no = employees.emp_no)
order by employees.emp_no;

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
select departments.dept_name,
employees.emp_no,
employees.last_name,
employees.first_name
from employees inner join dept_emp on (employees.emp_no = dept_emp.emp_no)
inner join departments on (departments.dept_no = dept_emp.dept_no)
order by employees.emp_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name from employees
where first_name = 'Hercules' and last_name like 'B%';

--List all employees in the Sales department, including their 
--employee number, last name, first name, and department name.
select departments.dept_name,
employees.emp_no,
employees.last_name,
employees.first_name
from employees inner join dept_emp on (employees.emp_no = dept_emp.emp_no)
inner join departments on (departments.dept_no = dept_emp.dept_no)
where departments.dept_name = 'Sales'
order by employees.emp_no;

--List all employees in the Sales and Development departments, including their 
--employee number, last name, first name, and department name.
select departments.dept_name,
employees.emp_no,
employees.last_name,
employees.first_name
from employees inner join dept_emp on (employees.emp_no = dept_emp.emp_no)
inner join departments on (departments.dept_no = dept_emp.dept_no)
where departments.dept_name = 'Sales' or departments.dept_name = 'Development'
order by employees.emp_no;

--In descending order, list the frequency count of employee last names, i.e., 
--how many employees share each last name.
select last_name, count(last_name) as "Employee Count" from employees
group by last_name
order by "Employee Count" DESC;