SELECT * FROM EMPLOYEES;

/*
CONDITIONS: used to FILTER the rows
WHERE is the keyword; to implement the filters
*/

-- display all information of where firstName is 'David'
-- whatever inside singleCase ' ' is case-sensitive
select * from EMPLOYEES
where FIRST_NAME='David';

select * from EMPLOYEES
where FIRST_NAME='David' and LAST_NAME='Lee';

-- display firstname, lastname, salary where firstname is Peter
select FIRST_NAME,LAST_NAME,SALARY from EMPLOYEES
where FIRST_NAME='Peter';

-- display all information from employees where salary is bigger than 6000
select * from EMPLOYEES
where SALARY>6000;

-- display email of who is making less than 5000
-- we can display something, that don't use it the filter input
-- filter input and display is independence from each other
-- this will filter the result in the backend under the hood basically
-- and will display only email, not effecting the basic filteration
select EMAIL from EMPLOYEES
where SALARY<5000;

-- display all info from employees who is making more than 7000 and department_id is 60
select * from EMPLOYEES
where SALARY>7000 and DEPARTMENT_ID=60;

-- display all info from employees where salary is equals or more than 3000 and salary equals or less than 7000
select * from EMPLOYEES
where SALARY >= 3000 and SALARY <= 7000;

-- BETWEEN STATEMENT

select * from EMPLOYEES
where SALARY between 3000 and 7000;

-- display all info from Employees who is working al IT_PROG or MK-MAN
-- solution#1
select * from EMPLOYEES
where JOB_ID='IT_PROG' or JOB_ID='MK-MAN';

-- solution#2
select * from EMPLOYEES
where JOB_ID in ('IT_PROG','MK-MAN' );

-- display all info where employee id = 121,142,154,165
-- solution #1
select * from EMPLOYEES
where EMPLOYEE_ID=121 or EMPLOYEE_ID=142 or EMPLOYEE_ID=154 or EMPLOYEE_ID=165;

-- solution #2
select * from EMPLOYEES
where EMPLOYEE_ID IN (121,142,154,165);

-- display all the info where country_id is US and IT
select * from COUNTRIES
where COUNTRY_ID in ('US','IT');

-- display all the info except where country_id is US and IT
select * from COUNTRIES
where COUNTRY_ID NOT IN ('US','IT');

-- is NULL
select * from EMPLOYEES
where DEPARTMENT_ID is null;

select * from EMPLOYEES
where MANAGER_ID is null;

-- is NOT NULL
select * from EMPLOYEES
where DEPARTMENT_ID is NOT NULL;
