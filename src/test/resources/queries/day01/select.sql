select * from EMPLOYEES;

select * from DEPARTMENTS;

-- SQL language is not case sensitivity

-- retrieving: individual column
-- display firstname from employees table
select FIRST_NAME from EMPLOYEES;

-- retrieving: multiple columns
select FIRST_NAME,LAST_NAME from EMPLOYEES;

-- retrieving: multiple columns
select SALARY,EMAIL from EMPLOYEES;

-- display all information from location table
-- by checking with the schema table to identify the correct column
select * from LOCATIONS;

-- display country name and region id from countries table
select COUNTRY_NAME, REGION_ID from COUNTRIES;

/*
 select: what we want to display
 from: what is the resource, where we can get the information (tableName most of the time)
*/
-- display job id and job title from job table
select JOB_ID,JOB_TITLE from JOBS;




