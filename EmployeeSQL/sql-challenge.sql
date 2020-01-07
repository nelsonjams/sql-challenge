CREATE TABLE employees (
	emp_no INT NOT NULL,
	birth_date date NOT NULL,
	first_name varchar(20) NOT NULL,
	last_name varchar(20) NOT NULL,
	gender varchar(10) NOT NULL,
	hire_date date NOT NULL,
	PRIMARY KEY (emp_no)
);
CREATE TABLE departments (
	dept_no varchar(20) NOT NULL,
	dept_name varchar(50) NOT NULL,
	PRIMARY KEY (dept_no),
	unique (dept_name)
);
CREATE TABLE dept_manager (
	dept_no varchar(20) NOT NULL,
	emp_no INT NOT NULL,	
	from_date date NOT NULL,
	to_date date NOT NULL,
	foreign key (emp_no) references employees (emp_no),
	foreign key (dept_no) references departments (dept_no),
	primary key (emp_no, dept_no)
);
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no varchar(20) NOT NULL,
	from_date date NOT NULL,
	to_date date NOT NULL,
	foreign key (emp_no) references employees (emp_no),
	foreign key (dept_no) references departments (dept_no),
	primary key (emp_no, dept_no)
);
CREATE TABLE titles (
	emp_no INT NOT NULL,
	title varchar(20) NOT NULL,
	from_date date NOT NULL,
	to_date date NOT NULL,
	foreign key (emp_no) references employees (emp_no),
	primary key (emp_no, title, from_date)
);
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary int NOT NULL,
	from_date date NOT NULL,
	to_date date NOT NULL,
	foreign key (emp_no) references employees (emp_no),
	primary key (emp_no, from_date)
);






