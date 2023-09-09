select * from EMPLOYEES;

/*
AGGREAGTE_FUNCTIONS - MULTI ROWS - GROUP FUNCTIONS
- it takes multiple rows and return one result
- All of them ignore 'null' value
    - count --> count rows
    - max   --> max value
    - min   --> min value
    - sum   --> total value
    - avg   --> average value
*/
-- How many department? COUNT(*) 27
select * from DEPARTMENTS;
select COUNT (*) from DEPARTMENTS;

-- How many locations? COUNT(*) 23
select * from LOCATIONS;
select COUNT (*) from LOCATIONS;

-- null values
-- How many department_id? = 106 because it will not count 'null' value in that table
-- because counting based on the specific column (DEPARTMENT_ID) then will not count the 'null' value
-- only count if it has any kind of value beside the 'null'
select COUNT(DEPARTMENT_ID) from EMPLOYEES;

-- how many different firstname? = 91
select distinct FIRST_NAME from EMPLOYEES; -- return all the distinct names = 91 rows
select COUNT (distinct FIRST_NAME) from EMPLOYEES; -- return the COUNT (DISTINCTFIRST_NAME) = 91

-- how many employees working as IT_PROG or SA_REP = 35
select COUNT(*) from EMPLOYEES where JOB_ID IN ('IT_PROG','SA_REP');

-- max(salary) = 24000
select max(SALARY) from EMPLOYEES;

-- min(salary) = 2100
select min(SALARY) from EMPLOYEES;

-- avg(salary)
select avg(SALARY) from EMPLOYEES; --6461.831777...

-- cover the average function with ROUND and providing the decimal
select ROUND(avg(SALARY)) from EMPLOYEES;   --6462 the whole number
select ROUND(avg(SALARY),1) from EMPLOYEES; --6461.8
select ROUND(avg(SALARY),2) from EMPLOYEES; --6461.83
select ROUND(avg(SALARY),3) from EMPLOYEES; --6461.832
select ROUND(avg(SALARY),4) from EMPLOYEES; --6461.8318

-- SUM is total number of the salary
select SUM(SALARY) from EMPLOYEES; -- 691416