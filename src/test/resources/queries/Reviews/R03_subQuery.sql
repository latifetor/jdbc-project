select *
from EMPLOYEES;

------- SUBQUERY -------
-- TASK 12 - Display those employees firstname,lastname and salary
--           who get higher salary than the employee whose employee_id is 132
    --STEP 1: find me salary of employee_id = 132

    select FIRST_NAME, SALARY
    from EMPLOYEES
    where EMPLOYEE_ID = 132;

    --STEP 2: find me who is getting more than 2100
    select FIRST_NAME, LAST_NAME, SALARY
    from EMPLOYEES
    where SALARY > 2100;

    --SOLUTION: make it dynamic
    select FIRST_NAME, LAST_NAME, SALARY
    from EMPLOYEES
    where SALARY > (select SALARY
                    from EMPLOYEES
                    where EMPLOYEE_ID = 132);

-- TASK 13 -  Display Manager firstname,lastname of Peter,Vargas from employees table
    select * from EMPLOYEES;

    --STEP1: find me manager_id for Peter,Vargas
    select MANAGER_ID
    from EMPLOYEES
    where FIRST_NAME = 'Peter'
      and LAST_NAME = 'Vargas';
    --124

    --STEP2: find me information about employee_id = 124
    select FIRST_NAME, LAST_NAME
    from EMPLOYEES
    where EMPLOYEE_ID = 124;

    --SOLUTION: make it dynamic
    select FIRST_NAME, LAST_NAME
    from EMPLOYEES
    where EMPLOYEE_ID = (select MANAGER_ID
                         from EMPLOYEES
                         where FIRST_NAME = 'Peter'and LAST_NAME = 'Vargas');

-- TASK 14 - Display Employees first_name,last_name who reports to 'Steven King'


    select * from EMPLOYEES;
    --STEP1: find employee_id for 'Steven King'
    select EMPLOYEE_ID from EMPLOYEES
    where FIRST_NAME='Steven' and LAST_NAME='King'; --> 100

    --STEP2: find who as the same manager_Id equals to 'Steven King'
    select FIRST_NAME, LAST_NAME from EMPLOYEES
    where MANAGER_ID=100;

    --SOLUTION: make it dynamic
    select FIRST_NAME, LAST_NAME from EMPLOYEES
    where MANAGER_ID = (select EMPLOYEE_ID from EMPLOYEES
                     where FIRST_NAME = 'Steven' and LAST_NAME = 'King');


-- TASK 15 -  display all information who is getting 11th highest salary
    select distinct SALARY from EMPLOYEES
    order by SALARY DESC;

--STEP1: find 11th highest salary
    select MIN(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY DESC)
    where ROWNUM<12; --10000

--STEP2: find who is getting that salary
    select * from EMPLOYEES
    where SALARY=10000;

--SOLUTION: merge this queries to make it dynamic
    select * from EMPLOYEES
    where SALARY=(select MIN(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY DESC)
                  where ROWNUM<12);

-- TASK 16 - Display employees first_name,last_name who is working in Marketing department
    select * from DEPARTMENTS;

-- STEP1: find marketing department_id
    select DEPARTMENT_ID from DEPARTMENTS
    where DEPARTMENT_NAME='Marketing'; --20

-- STEP2: find employees who is working in this department
    select FIRST_NAME,LAST_NAME,DEPARTMENT_ID from EMPLOYEES
    where DEPARTMENT_ID='20';

-- SOLUTION:
    select FIRST_NAME,LAST_NAME,DEPARTMENT_ID from EMPLOYEES
    where DEPARTMENT_ID=(select DEPARTMENT_ID from DEPARTMENTS
                         where DEPARTMENT_NAME='Marketing');
