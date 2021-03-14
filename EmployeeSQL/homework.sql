--1)List the following details of each employee: employee number, last name, first name, sex, and salary.
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary 
from employees
inner join salaries on employees.emp_no = salaries.emp_no;

--2)List first name, last name, and hire date for employees who were hired in 1986.
select emp_no, first_name, hire_date 
from employees
where hire_date >= '1986-01-01' and hire_date <= '1986-12-31';

--3)List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select departments.dept_no, departments.dept_name, dept_managers.emp_no, employees.last_name, employees.first_name 
from dept_managers 
inner join departments on dept_managers.dept_no = departments.dept_no
inner join employees on dept_managers.emp_no =employees.emp_no;

--4)List the department of each employee with the following information: employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name 
from employees 
inner join dept_managers on employees.emp_no = dept_managers.emp_no
inner join departments on dept_managers.dept_no = departments.dept_no;

--5)List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select * from employees
where first_name = 'Hercules' and last_name like 'B%';

--6)List all employees in the Sales department, including their employee number, last name, first name, and department name.
select emp.emp_no, emp.last_name, emp.first_name, dept.dept_name, dept.dept_no
from employees as emp
inner join dept_emp on dept_emp.emp_no = emp.emp_no
inner join departments as dept on dept.dept_no = dept_emp.dept_no
where dept.dept_no = 'd007';

--7)List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from employees as emp
inner join dept_emp on dept_emp.emp_no = emp.emp_no
inner join departments as dept on dept.dept_no = dept_emp.dept_no
where dept.dept_no in ('d007','d005');

--8)In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name)
from employees
group by last_name
order by last_name desc;