select * from EMPLOYEES;

----------------DDL / DML -----------------
-- DQL: Data Query Language: SELECT statement (only)
-- DML: Data Manipulation Language
-- DDL: Data Definition Language

--------------------join--------------------

-- INNER JOIN RETURN ONLY THE DATA THAT MATCH FROM BOTH TABLE ACCORDING TO CONDITION
-- Display all first_name and  related department_name
-- INNER JOIN RETURN ONLY THE DATA THAT MATCH FROM BOTH TABLE ACCORDING TO CONDITION
-- Display all first_name and  related department_name
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

-- STEVEN EXECUTIVE
-- DAVID IT
-- ...
-- ..
-- .

SELECT FIRST_NAME,DEPARTMENT_NAME FROM EMPLOYEES
                                           INNER JOIN DEPARTMENTS ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;


SELECT FIRST_NAME,DEPARTMENT_NAME FROM EMPLOYEES E
                                           INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

SELECT FIRST_NAME,DEPARTMENT_NAME,D.DEPARTMENT_ID FROM EMPLOYEES E
                                                           INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;


-- IT IS POSSIBLE TO ADD MORE STATEMENT TO FILTER OR ORDER RESULTS
SELECT FIRST_NAME,DEPARTMENT_NAME FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE DEPARTMENT_NAME LIKE 'S%'
ORDER BY DEPARTMENT_NAME ASC,FIRST_NAME ASC;

-- HOW MANY EMPLOYEES WORKS IN DEPARTMENTS
SELECT DEPARTMENT_NAME,COUNT(FIRST_NAME) FROM EMPLOYEES E
                                                  JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE DEPARTMENT_NAME LIKE 'S%'
GROUP BY DEPARTMENT_NAME;


-- LEFT OUTER JOIN RETURN EVERYTHING THAT MATCH + UNIQUE FOR LEFT
-- Display all first_name and department_name including the  employee without department
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

SELECT FIRST_NAME,DEPARTMENT_NAME FROM EMPLOYEES E
                                           LEFT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

SELECT FIRST_NAME,DEPARTMENT_NAME FROM DEPARTMENTS D
                                           RIGHT JOIN EMPLOYEES E ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;

-- RIGHT OUTER JOIN RETURN EVERYTHING THAT MATCH + UNIQUE FOR RIGHT
-- Display all first_name and department_name including the department without employee
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

SELECT FIRST_NAME,DEPARTMENT_NAME FROM EMPLOYEES E
                                           RIGHT JOIN DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID;

SELECT FIRST_NAME,DEPARTMENT_NAME FROM DEPARTMENTS D
                                           LEFT JOIN EMPLOYEES E on D.DEPARTMENT_ID = E.DEPARTMENT_ID;


-- FULL OUTER JOIN RETURNS EVERYTHING
-- Display all firstname and department name including the department without employees
-- and also employees without the department
SELECT FIRST_NAME,DEPARTMENT_NAME FROM DEPARTMENTS D
                                           FULL JOIN EMPLOYEES E on D.DEPARTMENT_ID = E.DEPARTMENT_ID;

-- LEFT OUTER JOIN RETURN EVERYTHING THAT MATCH + THOSE DID NOT MATCH FROM LEFT TABLE
-- Display all first_name and department_name including the  employee without department


-- RIGHT OUTER JOIN
-- Display all first_name and department_name including the department without employee


-- FULL OUTER JOIN
-- Display all firstname and department name including the department without employees
-- and also employees without the department


--TASK 1-1
-- From the departments and locations tables,
-- display the department name, city, and state province for each department.


--TASK 1-2
-- display only department names ends with Sales


-- TASK 2
-- From employees, departments, and locations tables,
-- find those employees whose first name contains a letter 'z'.
-- Return first name, last name, department, city, and state province.


--TASK 3
-- From the employees and departments table,
-- compute the average salary, number of employees for each department.
-- Return department name, average salary and number of employees.


--TASK 4
-- From the employees, departments, and locations tables,
-- find full name (first and last name), and salary of those employees
-- who work in any department located in Oxford .


--TASK 5
-- From the employees, departments, and locations tables,
-- find avg salary for each city



----- SELF JOIN ---
-- Display  all employees and their  managers information


-- Given the Employee table, write a SQL query that finds out employees who earn more than their managers.
