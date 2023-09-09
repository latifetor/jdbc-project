select * from EMPLOYEES;

--TASK1 - display department names from departments table
    select DEPARTMENT_NAME from DEPARTMENTS;

--TASK2 - display first_name, last_name, department_id, salary from employees
    select FIRST_NAME,LAST_NAME,DEPARTMENT_ID,SALARY from EMPLOYEES;

--TASK 3 - display first_name, last_name, department_id, salary from employees whose salary is higher than 9000
    select FIRST_NAME,LAST_NAME,DEPARTMENT_ID,SALARY from EMPLOYEES
    where SALARY>9000;

--TASK 4 - display first_name, last_name, department_id, salary from employees
--         whose salary equals or more than 9000 and salary equals or less than 15000
--         sort result based on salary asc
    -- option#1
    select FIRST_NAME,LAST_NAME,DEPARTMENT_ID,SALARY from EMPLOYEES
    where SALARY>=9000 and SALARY<=15000
    order by SALARY; --> as default it will sort in ASC order
    --ORDER BY 4;

    -- option#2
    select FIRST_NAME,LAST_NAME,DEPARTMENT_ID,SALARY from EMPLOYEES
    where SALARY BETWEEN 9000 and 15000 -- BETWEEN LOWER AND UPPER (this boundaries are included)
    order by SALARY ASC;

--TASK 5 -  display first_name, last_name, department_id, salary from employees
--          whose firstname is Peter and salary is bigger than 5000
--          sort result based on salary desc
    select FIRST_NAME,LAST_NAME,DEPARTMENT_ID,SALARY from EMPLOYEES
    where FIRST_NAME='Peter' and SALARY>5000
    order by SALARY;

--TASK 6 - display country_id, country_name from countries table for region id 2 or 4
--         sort result based on region_id desc and country_name asc

    --option#1
    select COUNTRY_ID,COUNTRY_NAME,REGION_ID from COUNTRIES
    where REGION_ID=2 or REGION_ID=4 -- using OR Aggregate functions
    order by REGION_ID desc,COUNTRY_NAME asc;

    --option#2
    select COUNTRY_ID,COUNTRY_NAME,REGION_ID from COUNTRIES
    where REGION_ID in (2,4) -- using IN statement
    order by REGION_ID desc,COUNTRY_NAME asc;

--TASK 7 -  display employee firstname and lastname as fullname , salary as annual salary  , job_id
--          whose job_id starts with S

    select FIRST_NAME||' '||LAST_NAME as FULLNAME,SALARY*12 as ANNUAL_SALARY,JOB_ID
    from EMPLOYEES
    where JOB_ID like 'S%';
    -- % percent: refers 0 or more characters
    -- _ underscore: refers single characters

    -- whose job_id starts with S and total 6 letters
    select FIRST_NAME||' '||LAST_NAME as FULLNAME,SALARY*12 as ANNUAL_SALARY,JOB_ID
    from EMPLOYEES
    where JOB_ID like 'S_____';

-- TASK 8 - display country id and country name where country name ends with a
    select COUNTRY_ID,COUNTRY_NAME from COUNTRIES
    where COUNTRY_NAME like '%a';

-- TASK 9 -  display country id and country name where country name ends with a and third letter is i
    select COUNTRY_ID, COUNTRY_NAME from COUNTRIES
    where COUNTRY_NAME like '__i%a';

------ INTERVIEW QUESTION  -->
/*
    Write a query to print first_name and salary for all employees in the Employee table
    who earn a salary larger than 3000
    Sort your results in ascending order of the last 3 characters in the employees first_name
    if two or more employees have first_names ending with same 3 characters, then sort them by highest salary
*/
    select FIRST_NAME,SALARY from EMPLOYEES
    where EMPLOYEES.SALARY>3000
    order by LOWER(SUBSTR(FIRST_NAME,-3)),SALARY DESC;
        -- using LOWER to organize the order