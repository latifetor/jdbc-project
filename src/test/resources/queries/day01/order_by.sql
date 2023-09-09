SELECT * FROM EMPLOYEES;

/*
    ORDER_BY:
    - it allows us to sort data based on provided column
    - as a "Default" it will order the result ASCENDING ORDER (A-Z,0-9)
    - IF you want to sort it DESCENDING (Z-A,9-0) order we need to specify right after column name
*/

-- display all employees based on salary in ASC order
-- Default: Ascending order but can be implicitly write it as ASC
select * from EMPLOYEES
ORDER BY SALARY;

-- by Descending order
select * from EMPLOYEES
ORDER BY SALARY DESC;

-- display all the employees based on their firstName DESC
select * from EMPLOYEES
order by FIRST_NAME desc;

-- can we implement the filter and order by in the same time
-- display all info where employee_id is less than 120 and order them based on salary DESC
select * from EMPLOYEES
where EMPLOYEE_ID<120
order by SALARY DESC;

-- display all info from employee and order them based on firstname asc and lastname desc
-- will display FirstName in Asc and the LastName in DESC
-- in case of the same name LastName will be in DESC
select * from EMPLOYEES
order by FIRST_NAME, LAST_NAME DESC;






