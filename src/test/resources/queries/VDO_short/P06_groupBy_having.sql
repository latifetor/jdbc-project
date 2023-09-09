--GROUP BY --> Divides rows into small groups

select * from EMPLOYEES;
-- how many employees we have?
-- by using COUNT function to find
select COUNT(*) from EMPLOYEES;

-- how many employees we have for each JOB_ID?
-- by using GROUP BY:
-- implement AGGREGATE functions

select JOB_ID,count(*) from EMPLOYEES
group by JOB_ID;

select JOB_ID,max(SALARY) from EMPLOYEES
group by JOB_ID;

select JOB_ID, min(SALARY) from EMPLOYEES
group by JOB_ID;


select JOB_ID,count(*),max(SALARY), min(SALARY), sum(SALARY), avg(SALARY) from EMPLOYEES
group by JOB_ID;

--HAVING--
--where employees first_name starts with A : one individual condition
    --check each employee_name one by one
select FIRST_NAME from EMPLOYEES where FIRST_NAME like 'A%';

--display the job_id where employees count bigger than 5
    --first will count how many employees we have for each job_id
        --> by grouping all the employees based on the job_id
    --filter them according to their count
        --> if the count of the employees is bigger than 5 then will be display in the screen

select JOB_ID,count(*),max(SALARY), min(SALARY), sum(SALARY), avg(SALARY)
from EMPLOYEES
group by JOB_ID
having COUNT(*)>5;
--using AGGREGATE_FUNCTION "COUNT" it will return "how many"

--display the job_id where employees avg(SALARY) is bigger than 7000
select JOB_ID,COUNT(*),max(SALARY), min(SALARY), sum(SALARY), avg(SALARY)
from EMPLOYEES
group by JOB_ID
having AVG(SALARY)>7000;

select JOB_ID,COUNT(*),max(SALARY), min(SALARY), sum(SALARY), avg(SALARY)
from EMPLOYEES
group by JOB_ID
having MAX(SALARY)>10000;