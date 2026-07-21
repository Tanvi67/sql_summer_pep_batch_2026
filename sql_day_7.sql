USE normalization_lab;

SHOW TABLES;


CREATE DATABASE sql_training;


USE sql_training;

DROP TABLE employees;
CREATE TABLE employees (
    emp_id        INT PRIMARY KEY AUTO_INCREMENT,
    first_name    VARCHAR(50),
    last_name     VARCHAR(50),
    email         VARCHAR(100),
    department    VARCHAR(50),
    salary        DECIMAL(10,2),
    bonus_pct     DECIMAL(5,2),
    hire_date     DATE,
    birth_date    DATE,
    last_login    DATETIME
);

INSERT INTO employees
(first_name, last_name, email, department, salary, bonus_pct, hire_date, birth_date, last_login)
VALUES
('Amit',    'Sharma',   'amit.sharma@company.com',    'Sales',       55000.75, 8.5,  '2019-03-15', '1990-06-12', '2026-07-01 09:15:00'),
('Priya',   'Verma',    'priya.verma@company.com',    'Marketing',   62000.33, 10.25,'2020-07-22', '1988-11-25', '2026-07-05 14:42:00'),
('Rahul',   'Nair',     'rahul.nair@company.com',     'IT',          78500.99, 12.0, '2018-01-10', '1992-02-18', '2026-07-10 08:05:00'),
('Sneha',   'Iyer',     'sneha.iyer@company.com',     'Finance',     49500.12, 6.75, '2021-11-05', '1995-09-30', '2026-06-28 17:30:00'),
('Karan',   'Malhotra', 'karan.malhotra@company.com', 'IT',          91000.50,   15.0, '2016-05-19', '1985-04-02', '2026-07-11 11:20:00'),
('Neha',    'Gupta',    'neha.gupta@company.com',     'Sales',       53000.00,   9.4,  '2022-02-28', '1998-01-15', NULL),
('Vikram',  'Singh',    'vikram.singh@company.com',   'HR',          47000.45,  5.5,  '2023-08-14', '1993-07-08', '2026-07-12 19:10:00'),
('Ananya',  'Das',      'ananya.das@company.com',     'Marketing',   58000.87, 7.2,  '2017-09-01', '1991-12-20', '2026-07-09 10:00:00'),
('Rohan',   'Kapoor',   'rohan.kapoor@company.com',   'Finance',     67000.65, 11.1, '2019-12-12', '1989-03-27', '2026-07-02 13:55:00'),
('Ishita',  'Joshi',    'ishita.joshi@company.com',   'HR',          51000.20,   8.0,  '2020-04-04', '1996-10-10', '2026-07-07 16:25:00');

SELECT * FROM employees;

SHOW TABLES;

-- NUMERIC FUNCTIONS

-- ROUND, TRUNCATE, CEIL/CEILING, FLOOR, ABS, MOD, POWER, SQRT, SIGN

-- GREATES/LEAST, EXP, LOG, LOG10, 

-- TRUNCATE :- cuts off decimal places without rounding

-- FLOOR :- ROUND DOWN
-- CEIL :- ROUND UP 

-- ABS :- Absolute values

-- GREATEST VS MAX :- Max is Aggregate func and Greatest is Scalar

-- RAND :- Generate random values

-- DATE AND TIME FUNCTION

-- Current Date and Time Functions

-- CURDATE
-- CURRENT_DATE
-- CURTIME
-- CURRENT_TIME
-- NOW
-- SYSDATE
-- CURRENT_TIMESTAMP


-- EXTRACTING PART OF DATE


-- YEAR
-- MONTH
-- MONTHNAME
-- DAY
-- DAYNAME
-- DAYOFMONTH
-- QUARTER
-- DAYOFWEE
-- MINUTE
-- SECOND



-- HANDS ON NUMERIC


-- Round every employee salary to the nearest whole number


SELECT ROUND(Salary, 0) AS nearest_whole FROM employees;

-- Display each salary truncated to 1 decimal place


SELECT TRUNCATE(Salary, 1) AS truncated_sal FROM employees;


-- Calculate each employee's monthly salary (salary/12), rounded to 2 decimals

SELECT ROUND(Salary/12, 2) AS monthly_salary FROM employees;


-- Calculate bonus amount (salary*bonus_pct/100) for each employee rounded to 2 decimal places , label them bonus_amount

SELECT ROUND(Salary*bonus_pct/100, 2) AS bonus_amount FROM employees;


-- find the difference between each employee salary and the avg salary of all employee ans show its absolute values

SELECT ABS(Salary- (SELECT AVG(Salary) FROM employees)) AS diff_Sal FROM employees;


-- Display the ceiling and dloor values of each employees value side by side

SELECT FLOOR(Salary) AS Floor_value, CEIL(Salary) AS Ceil_Value FROM employees;

-- Using MOD(), List only employees whose emp_id is an odd number

SELECT * FROM employees WHERE MOD(emp_id, 2) = 1;

-- Find the square root of each employee salary

SELECT SQRT(Salary) AS root_salary FROM employees;

-- AMONG (Salary, bonus_pct*10000), display the greater value for each employee using greates

SELECT GREATEST(Salary, bonus_pct*10000) AS greater_value FROM employees;



-- DATE ARITHEMETIC FUNCTIONS

-- DATE_ADD
-- DATE_SUB
-- ADDDATE - Short hand for DATE_ADD
-- SUBDATE - short hand for DATE_SUB


-- DATEDIFF


-- FORMATTING FUNCTION

-- DATE_FORMAT
-- TIME_FORMAT

-- CONVERSION FUNCTIONS

-- STR_TO_DATE
-- CAST

-- DISPLAY EACH EMPLOYEE HIRE DATE FORMATTED AS "DD MONTH YYYY"

-- CALCULATE THE EXACT NUMBER OF DAYS EACH EMPLOYEE HAS WORKED AT THE COMPANY (FROM HIRE DATE TO TODAY)

SELECT first_name, DATEDIFF(CURDATE(), hire_date ) AS Total_days FROM employees;

-- CALCULATE EACH EMPLOYEE CURRENT AGE IN YEARS USING BIRTH DATE

SELECT first_name, TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) AS Age_in_yrs FROM employees;


-- DISPLAY THE DAY OF THE WEEKK ON WHICH EACH EMPLOYEE WAS HIRED ("Friday")

SELECT first_name, DAYNAME(hire_date) AS hired_wee FROM employees;

-- FIND THE EMPLOYEE WHO WERE HIRED IN THE MONTH OF "DECEMBER" (ANY YEAR)

SELECT first_name, hire_date FROM employees WHERE MONTHNAME(hire_date) = "December";

-- ADD THREE YEARS TO EACH EMPLOYEE HIRE DATE AND DISPLAY IT THEIR "ELIGIBLE FOR PENSION" DATE

SELECT first_name, hire_date, DATE_ADD(hire_date, INTERVAL 3 YEAR) AS eligible_for_pension FROM employees;

-- FIND THE LAST DATE OF MONTH IN WHICH EACH EMPLOYEE WAS BORN

SELECT first_name, FROM employees;

-- LIST OF EMPLOYEE HIRED IN THE LAST 5 YEARS, ORDERED BY THE MOST RECENTLY HIRED FIRST

SELECT * FROM employees ORDER BY hire_date DESC LIMIT 5;

-- DISPLAY THE YEAR AND THE QUARTER OF EACH EMPLOYEE'S HIRE DATE " 2019 - Q1"


SELECT YEAR(hire_date) AS YEAR_HIRE, QUARTER(hire_date) AS Quarter_hire FROM employees;



-- LAST_DAY()

-- MIS FUNC

-- MAKEDATE
-- MAKETIME

-- EXTRACT
-- UTC_DATE
-- UTC_TIME
-- UTC_TIMESTAMP

/*# INTRODUCTION TO VIEWS
VIEWS-VIRTUAL table. stores sql query ,not separate data
table-physical table while view-loginal table not physically present in database 
WHY USNG VIEWS
--SECURITY,SIMPLICITY,REUSABLE SQL,HIDE COMPLEX QUERIES
*/
CREATE VIEW employee_basic AS 
SELECT first_name,last_name,department,salary FROM employees;
SELECT * FROM employee_basic;
SHOW FULL TABLES WHERE Table_type='View';
DESC employee_basic;

/*VIEW WITH FILTER
Business:CEO wants only high salary employees
*/
CREATE VIEW high_salary AS SELECT*FROM employees WHERE salary>70000;
SELECT * FROM high_salary;

/*
UPDATE THROUGH VIEW
updating a view updates the base table (when view is updatable
*/
SET SQL_SAFE_UPDATES = 0;
UPDATE employee_basic SET salary=75000 WHERE first_name='Neha';  #this will not make any changes in  original table as we are uodating in view not in table
SELECT first_name,salary FROM employees WHERE first_name='Neha';

#REPLACE AND DROP VIEW
CREATE OR REPLACE VIEW employee_basic AS SELECT first_name,department,salary FROM employees;
SELECT * FROM employee_basic;
CREATE VIEW temp_view AS SELECT*FROM employees;
DROP VIEW temp_view;

/*
VIEW PRACTCE
*/
#CREATE delhi employees view
CREATE VIEW delhi_employees AS
SELECT *
FROM employees
WHERE city = 'Delhi';

#create name and dalary view
CREATE VIEW name_salary_view AS
SELECT
first_name,
last_name,
salary
FROM employees;
SELECT* FROM name_salary_view;

#Employees hired after 2023;
CREATE VIEW employee_details AS
SELECT
emp_id,
first_name,
last_name,
department,
salary,
hire_date
FROM employees;

SELECT *
FROM employees
WHERE hire_date > '2023-12-31';
#or
SELECT *
FROM employees
WHERE YEAR(hire_date) > 2023;

#IT department only
CREATE VIEW IT_department AS select*FROM employees WHERE DEPARTMENT='IT';
SELECT * FROM IT_department;

/*
INTRODUCTION TO INDEXES
How does Google search billions of records quickly
Index speeds up seaching .Similar to book index
WHY USE INDEXES
--faster search,sorting,better filtering,better joins
DISADVANTAGES
--extra storage,slower insery/update/delete,too many indexes reduce performance

*/
#CREATE INDEX
CREATE INDEX idx_email ON employees(email);
SHOW INDEX FROM employees;

#COMPOSITE INDEX
#leftmost Prefic Rule: (department,salary) helps department
CREATE INDEX id_dept_salary ON employees(department,salary);  #it will follow leftmode pregix rule firsly it will group based on department then group based on salary
SHOW INDEX FROM employees;

#UNIQUE INDEX
CREATE UNIQUE INDEX  idx_phone ON employees(phone);
SHOW INDEX FROM employees;

#DROP INDEX
DROP INDEX idx_email ON employees;
SHOW INDEX FROM employees;

#HANDS ON VIEWS AND INDEXES
#create a view named top_paid_it_employees that contains only employees from the IT department having salary greater than 70,000 .display the records ordered by salary in descending order
CREATE VIEW top_paid_it_employees AS
SELECT * 
FROM employees
WHERE department = 'IT' 
  AND salary > 70000
ORDER BY salary DESC;

#create a view named annual_salary_view displaying employee ID,Full Name (first+last name), department,monthly salary and annual salary(salaryx12).
CREATE VIEW annual_salary_view AS
SELECT
emp_id AS Employee_ID,
CONCAT(first_name,' ',last_name) AS Full_Name,
department,
salary AS Monthly_Salary,
(salary * 12) AS Annual_Salary
FROM employees;

#create a view named department_salary_summary showing Department,Total Employees,Average Salary, and Highest salary
CREATE VIEW department_salary_summary AS
SELECT
department,
COUNT(*) AS Total_Employees,
AVG(salary) AS Average_Salary,
MAX(salary) AS Highest_Salary
FROM employees
GROUP BY department;

#create a view displaying employees who joined after 1 january 2023. show employee name ,department,hire date and city
CREATE VIEW employee_detail AS
SELECT
CONCAT(first_name,' ',last_name) AS employee_Name,
department,
hire_date
FROM employees
WHERE hire_date > '2023-1-1';
SELECT*FROM employee_detail;

#CREATE a view containing employees whose salary is greater than average salary of all employees .display name,department and salary
CREATE VIEW above_avg_salary_view AS
SELECT
CONCAT(first_name,' ',last_name) AS Employee_Name,
department,
salary
FROM employees
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
);

#the HR team frequently searches employees using their email address.cretae an appropritae undex,verify it and then delete it
CREATE INDEX idx_email
ON employees(email);

-- Step 2: Verify Index
SHOW INDEX FROM employees;

-- Step 3: Delete Index
DROP INDEX idx_email
ON employees;

-- Step 4: Verify Again (Optional)
SHOW INDEX FROM employees;

/*The finnace team frequently executes:
 SELECT*FROM employees WHERE department ='Finance' AND city ='Patna';
 Create  the mose suitable composite index and display all indexes*/
CREATE INDEX idx_department_city
ON employees(department, city);
SHOW INDEX FROM employees;
 #create a view showing employees whose city starts with 'D' and salary is greater than 50,000. Display the results ordered by latest hire date
 
CREATE VIEW city_salary_view AS
SELECT
emp_id,
CONCAT(first_name,' ',last_name) AS Employee_Name,
department,
city,
salary,
hire_date
FROM employees
WHERE city LIKE 'D%'
AND salary > 50000;

#create a view showing only those departments where the avg salary is greater than 65,000. dispplay department ,number of employeees and avg salary

CREATE VIEW high_salary_departments AS
SELECT
department,
COUNT(*) AS Total_Employees,
AVG(salary) AS Average_Salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 65000;

#create a view named employee_report containing Employee ID ,Full name,department, city,salary and a salary category using CASE; high>=80000 ,medium(60000 -799990,low(<60000).
SELECT
emp_id AS Employee_ID,
CONCAT(first_name,' ',last_name) AS Full_Name,
department,
salary,
CASE
    WHEN salary >= 80000 THEN 'High'
    WHEN salary BETWEEN 60000 AND 79999 THEN 'Medium'
    ELSE 'Low'
END AS Salary_Category
FROM employees;
