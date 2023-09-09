-- your manager is asking for all jobs and their average salary.
select * from EMPLOYEES;

-- get average salary for 'IT_PROG'
select avg(SALARY) from EMPLOYEES where JOB_ID='IT_PROG';

-- get average salary for 'AC_ACCOUNT'
select avg(SALARY) from EMPLOYEES where JOB_ID='AC_ACCOUNT';

-- have to run queries 19 different JOB_IDS each of them have to be filtered first
-- because it is not a good solution; instead of writing one by one
-- by grouping them based on their job_id

-- GROUP BY claud: based on the column_name, that we're providing
-- SQL is creating provided many group and putting them into those group
-- the aggregate function works by taking multiple rows, return one result
-- for each of them are getting aggregate functional implemented,
-- not for one big table but for each of them, we have aggregate function is getting implemented
select JOB_ID,avg(SALARY) from EMPLOYEES group by JOB_ID;

-- implement all the aggregate functions after grouping them
select JOB_ID,avg(SALARY),COUNT(*),SUM(SALARY),MIN(SALARY),MAX(SALARY)
from EMPLOYEES group by JOB_ID;

-- with the Group by.claud: can only use the column that choose for the group by
-- because when using GROUP BY column, it will display only one time
-- able to use AGGREGATE FUNCTIONS because it is taking multiple rows from each of the group
-- and returning only one result

-- Display how many departments we have in each location
select *  from DEPARTMENTS;

-- Group them based on the location_id,
-- and see for each locations how many different Department_Name number we have?
-- to see list of the location_ids and each of Departments count next to it

select LOCATION_ID,COUNT(*) from DEPARTMENTS group by LOCATION_ID;

-- order result based on number of departments in desc
select LOCATION_ID,COUNT(*) from DEPARTMENTS group by LOCATION_ID
order by 2 DESC;

-- based on the number of columns, we should included in SELECT statement not original table
-- the 2 (INDEX): is pointing to the 2nd Column: COUNT(*) is not about original table
-- if change to be 1(INDEX) is pointing to the 1st Column: LOCATIONS_ID
-- Number of Columns, INDEX starts from 1 and can be using with ORDER BY

-- display how many countries we have in each regions

select * from REGIONS; -- There are 4 REGION
-- starting from checking the REGIONS table, only has REGION_ID AND REGION_NAME there are NO countries
select * from COUNTRIES;
-- go back and look at COUNTRIES table, there are different REGION_ID and differect COUNTRY_NAME
-- the question asking to "display how many countries we have in each regions"
-- how these tables will be converted to the "GROUP BY"
-- how many countries we have in each regions:
    -- There are 4 REGIONS and REGION_ID is a "primary key" of REGIONS.table
    -- which used as "foreign key" in COUNTRIES.table which are 4
    -- GROUP BY based on REGION_ID = 4 groups
    -- the input list (COUNTRIES)  = 25 different countries
    -- one by one checking the list, with their all information (COUNTRY_ID) and (COUNTRY_NAME)
    -- we are carrying them into groups, basically spitting them one COUNTRIES.table
    -- into 4 different small tables with their all information (whole row)
    -- and implement AGGREGATE FUNCTIONS in each small tables
select REGION_ID,COUNT(*) from COUNTRIES
GROUP BY REGION_ID;

-- order them based on number countries in desc
select REGION_ID,COUNT(*) from COUNTRIES
GROUP BY REGION_ID
order by COUNT (*) ASC ;

------------------------
-- get me total salary fo each department from employees tables.
-- select it from DEPARTMENT_ID, total amouth salary, how many employees working in each DEPARTMENT
-- after select and implement from
select DEPARTMENT_ID,SUM(SALARY),COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY COUNT (*) ASC;

-- after select and implement from EMPLOYEES,
-- it will be grouped before groping them,
-- (the order of SQL class), there is one filter condition: DEPARTMENT_ID should not be null
select DEPARTMENT_ID,SUM(SALARY),COUNT(*)
FROM EMPLOYEES
-- where statement coming before grouping them into the group
-- to remove 'null' DEPARTMENT_ID from the result
where DEPARTMENT_ID is not null
GROUP BY DEPARTMENT_ID
ORDER BY COUNT (*) ASC;

-- display JOB_ID where their average salary more than 5K
-- able to group everyone, then implement the filteration
select JOB_ID, AVG(SALARY)
from EMPLOYEES
group by JOB_ID
HAVING AVG(SALARY) > 5000;
-- after grouping employee can implement 'HAVING' statement
-- 'HAVING' is equal to where, the only difference is where we use is changed

-- display department where their average salary is more than 6k
select DEPARTMENT_ID,ROUND(AVG(SALARY))
FROM EMPLOYEES -- full input 107
where DEPARTMENT_ID is not null
-- filter with WHERE statement before grouping them - input 106
GROUP BY DEPARTMENT_ID
-- will get certain 11 groups based on DEPARTMENT_ID
having AVG(SALARY)>6000
ORDER BY 2 ASC;
-- each of them will be checked AVG(SALARY)>6000 then will move to the result

-- IQ: display duplicate (more than one) firstname from employees table
-- needs to group them based on their FIRST_NAME
-- even if it is only one name, it have to be put in one group

select FIRST_NAME,COUNT(*)
-- counting for how many names in each group?
from EMPLOYEES
group by FIRST_NAME
-- grouping = 91
having COUNT(*) > 1;
-- counting more than one time in each group

-- display department_id where employees count is bigger than 5
-- grouping employees based on their DEPARTMENT_ID
-- and looking for what are the number of EMPLOYEE that each DEPARTMENT has
-- filter them, to see only DEPARTMENT where they have more than 5 EMPLOYEES
    -- if to filtering after the group by   --> using 'HAVING'
    -- if to filtering before the group by  --> using 'WHERE'
-- order by 2 for based on the COUNT(*)

select DEPARTMENT_ID, COUNT(*)
from EMPLOYEES
group by DEPARTMENT_ID
HAVING COUNT(*) > 5
order by 2 DESC;