CREATE DATABASE db_payroll
USE db_payroll

-- TABLES
CREATE TABLE employee (
	employee_id int NOT NULL PRIMARY KEY IDENTITY (1,1),
	job_id int NOT NULL,
	first_name varchar(50) NOT NULL,
	date_of_hire date
);

CREATE TABLE job (
	job_id int NOT NULL PRIMARY KEY IDENTITY (1,1),
	job_title varchar(50),
	job_dept varchar(50),
	salary_id int NOT NULL
);

CREATE TABLE salary (
	salary_id int NOT NULL PRIMARY KEY IDENTITY(1,1),
	hourly_rate money NOT NULL
);

CREATE TABLE payroll (
	payroll_date date NOT NULL,
	employee_id int NOT NULL,
	hours_worked int NOT NULL
);

-- ALTERS
ALTER TABLE employee
ADD FOREIGN KEY (job_id) REFERENCES job(job_id);

ALTER TABLE job
ADD FOREIGN KEY (salary_id) REFERENCES salary(salary_id);

ALTER TABLE payroll
ADD FOREIGN KEY (employee_id) REFERENCES employee(employee_id);

ALTER TABLE employee
ADD last_name varchar(50);

-- INSERTS
INSERT INTO salary
VALUES
(19.50),
(20.00),
(20.50),
(21.00),
(21.50)
;
SELECT * FROM salary;

INSERT INTO job
VALUES
('AR Director', 'Accounting', 2),
('HR Director', 'Human Resources', 4),
('Developer', 'IT', 5),
('Customer Service Manager', 'Operations', 3),
('Sales Manager', 'Sales and Marketing', 1);

SELECT * FROM job;

INSERT INTO employee (job_id, first_name, last_name, date_of_hire)
VALUES
(1, 'Sam', 'Smith', '2018-11-28'),
(4, 'Amanda', 'James', '2020-04-01'),
(3, 'David', 'McGrath', '2021-12-11'),
(2, 'Valerie', 'Ringer', '2014-07-31'),
(5, 'Andrea', 'Antivilo', '2019-02-04');

SELECT * FROM employee;

INSERT INTO payroll
VALUES
('2023-06-07', 1, 40),
('2023-06-07', 2, 25),
('2023-06-07', 3, 38),
('2023-06-07', 4, 22),
('2023-06-07', 5, 34);


-- QUERIES
SELECT * FROM employee
	INNER JOIN payroll ON employee.employee_id = payroll.employee_id
	INNER JOIN job ON employee.job_id = job.job_id
	INNER JOIN salary ON job.salary_id = salary.salary_id
;

SELECT 
employee.first_name AS 'First Name:',
employee.last_name AS 'Last Name:',
payroll.hours_worked AS 'Hours:',
salary.hourly_rate AS 'Rate:',
payroll.hours_worked * salary.hourly_rate AS 'Total Pay:'
FROM employee
INNER JOIN payroll ON employee.employee_id = payroll.employee_id
INNER JOIN job ON employee.job_id = job.job_id
INNER JOIN salary ON job.salary_id = salary.salary_id;

