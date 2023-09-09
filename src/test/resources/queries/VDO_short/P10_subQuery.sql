select * from EMPLOYEES;

------------SUBQUERY---------------
-- a subquery allows us to use multiple SELECT statement, where we basically have a query within a query.
-- using "Query inside Query"

-- HR database, there is EMPLOYEES.table
-- who get the maximum salary in EMPLOYEES.table
    select * from EMPLOYEES
    order by SALARY desc;

-- get the data in sorted manner based on the SALARY, we know who get the maximum salary
-- this is the expected result, but we need to get ONLY this data out after the execution
-- this is still not the correct result, that we are expected to get yet

-- STEP 1: need to find the MAX.SALARY from EMPLOYEES.table
    select max(SALARY) from EMPLOYEES; --24000

-- STEP 2: WHO is getting the MAX.SALARY
    select * from EMPLOYEES where SALARY=24000;

    -- but this query is 'HARD_CODE', it might be changed which we have to 'UPDATE' this query which is not a good way
    -- if we know this SALARY come from the previous query, we have to find a 'DYNAMIC' solution
-- DYNAMIC SOLUTION:
    -- instead of MAX(SALARY), will be using existing query
    -- which return always MAX(SALARY) from EMPLOYEES.table inside with the () parentheses

    select * from EMPLOYEES
    -- this is called "OUTER QUERY"
    where SALARY = (select max(SALARY) from EMPLOYEES);
                    -- this is called "INNER QUERY"
    -- RUN: will give the same data always and based on the MAX.SALARY from EMPLOYEES first
    -- and "INNER QUERY" will run, will return MAX.SALARY which is 24000
    -- then the "OUTER QUERY" will try to get all information from the EMPLOYEES.table based on their salary
    -- if the salary = equals MAX, the salary will be displayed in the screen as a result

---------------------------------------------------
-- SUBQUERY with 2 difference tables
select * from EMPLOYEES;
-- in this table, there are EMPLOYEE_ID, FIRST_NAME, LAST_NAME and other
-- but we are looking for DEPARTMENT_ID
-- 'Steven King' has EMPLOYEE_ID = 100 and has DEPARTMENT_ID 90
-- 'Alexander Hunold' has EMPLOYEE_ID = 103 and has DEPARTMENT_ID 60, know only DEPARTMENT_ID, but not DEPARTMENT_NAME
-- Q: get all employees first-name, last_name who is working currently in IT Department
    --> there is NO DEPARTMENT_NAME information in this EMPLOYEES.table
    --> where can we find the DEPARTMENT_NAME information by using DEPARTMENTS.table

select * from DEPARTMENTS;
-- from the DEPARTMENTS.table department_id = 60 is IT, which 'Alexandar Hunold' is currently working
-- this is PRIMARY KEY and FOREIGN KEY connection
-- compare the two tables: DEPARTMENTS.table and EMPLOYEES.table
    --> EMPLOYEE_ID is a PRIMARY KEY in EMPLOYEES.table
    --> DEPARTMENT_ID is a PRIMARY KEY in DEPARTMENT.table
    --> finding the connection point which is FOREIGN KEY in between these two tables,
    --> in EMPLOYEES.table there is DEPARTMENT_ID is the FOREIGN KEY to connect EMPLOYEES.table and DEPARTMENT.table
    --> to be able to find "who is currently working which any departments
    --> by using DEPARTMENT_ID to make connection with DEPARTMENT.table

-- Get all the employees first_name, last_name who is working currently in IT department
-- STEP1: find IT department in DEPARTMENT_ID = 60 from DEPARTMENT.table
    select DEPARTMENT_ID from DEPARTMENTS
    where DEPARTMENT_NAME='IT';

-- STEP2: will use STEP1: information into EMPLOYEES.table to get
-- all the employees first_name, last_name who is working currently in IT department
    select FIRST_NAME, LAST_NAME from EMPLOYEES
    where DEPARTMENT_ID=60;

-- DYNAMIC SOLUTION:
    --> to make value be DYNAMICALLY, STEP1: return DYNAMIC DEPARTMENT_ID result
    -- which will give the same result at STEP2: but giving DYNAMICALLY result
select FIRST_NAME, LAST_NAME from EMPLOYEES
where DEPARTMENT_ID=(select DEPARTMENT_ID from DEPARTMENTS
                     where DEPARTMENT_NAME='IT');

-- will be able to change to any DEPARTMENT_NAME='XXX') easily
-- Get all the employees first_name, last_name who is working currently in Executive department
select FIRST_NAME, LAST_NAME from EMPLOYEES
where DEPARTMENT_ID=(select DEPARTMENT_ID from DEPARTMENTS
                     where DEPARTMENT_NAME='Executive');
