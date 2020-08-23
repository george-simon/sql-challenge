-- Create schemas

-- Create tables
CREATE TABLE IF NOT EXISTS departments
(
    dept_no VARCHAR(20) NOT NULL,
    dept_name VARCHAR(100),
    PRIMARY KEY(dept_no)
);

CREATE TABLE IF NOT EXISTS dept_manager
(
    dept_no VARCHAR(20) NOT NULL,
    emp_id INTEGER NOT NULL,
    PRIMARY KEY(emp_id, dept_no)
);

CREATE TABLE IF NOT EXISTS salaries
(
    emp_id INTEGER NOT NULL,
    salary INTEGER,
    PRIMARY KEY(emp_id)
);

CREATE TABLE IF NOT EXISTS dept_emp
(
    emp_id INTEGER NOT NULL,
    dept_no VARCHAR(20) NOT NULL,
    PRIMARY KEY(emp_id, dept_no)
);

CREATE TABLE IF NOT EXISTS employees
(
    emp_id INTEGER NOT NULL,
    emp_title_id VARCHAR(100),
    birth_date DATE,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    sex CHARACTER(1),
    hire_date DATE,
    PRIMARY KEY(emp_id)
);

CREATE TABLE IF NOT EXISTS titles
(
    title_id VARCHAR(100) NOT NULL,
    title VARCHAR(100),
    PRIMARY KEY(title_id)
);


-- Create FKs
    
ALTER TABLE employees
    ADD    FOREIGN KEY (emp_title_id)
    REFERENCES titles(title_id)
    MATCH SIMPLE
;
    
ALTER TABLE salaries
    ADD    FOREIGN KEY (emp_id)
    REFERENCES employees(emp_id)
    MATCH SIMPLE
;
    
ALTER TABLE dept_emp
    ADD    FOREIGN KEY (emp_id)
    REFERENCES employees(emp_id)
    MATCH SIMPLE
;
    
ALTER TABLE dept_emp
    ADD    FOREIGN KEY (dept_no)
    REFERENCES departments(dept_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_manager
    ADD    FOREIGN KEY (dept_no)
    REFERENCES departments(dept_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_manager
    ADD    FOREIGN KEY (emp_id)
    REFERENCES employees(emp_id)
    MATCH SIMPLE
;
  
-- csv import order: departments, dept_manger, salaries, dept_emp, employees, titles
-- Create Indexes

