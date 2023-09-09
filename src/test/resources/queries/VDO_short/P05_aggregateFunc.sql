
-- AGGREGATE FUNCTIONS
-- count()  --> gives count of results
    -- with the help of count() -> how many departments?, how many employees?

    select * from EMPLOYEES;
    select count(*) from EMPLOYEES;

    select count(*) from EMPLOYEES
    where JOB_ID='IT_PROG';

    select count(*) from COUNTRIES
    where COUNTRY_NAME like 'B%';

-- max() --> give max value of column
    --> find the maximum salary from the employees
    select * from EMPLOYEES;
    select max(SALARY) from EMPLOYEES;

-- min() --> give min value of column
    --> find the minimum salary from the employees
    select * from EMPLOYEES;
    select min(SALARY) from EMPLOYEES;

-- sum() --> give total value of column
    select * from EMPLOYEES;
    select sum(SALARY) from EMPLOYEES;

    -- Total salary for IT_PROG
    select sum(SALARY) from EMPLOYEES
    where JOB_ID='IT_PROG';

-- avg() --> gives average value of column
    select * from EMPLOYEES;
    select avg(SALARY) from EMPLOYEES;

    select avg(SALARY) from EMPLOYEES
    where JOB_ID='IT_PROG';

-- ROUND is not an AGGREGATE FUNCTIONAL
    -- round() --> give rounded version of number (decimal)
    -- if we don't have second parameter to round it will give integer

    select avg(SALARY) from EMPLOYEES;
    select round(avg(SALARY)) from EMPLOYEES;

    -- in the parameter, providing the number of decimal -> 1 decimal
    select round(avg(SALARY),1) from EMPLOYEES;

    -- in the parameter, providing the number of decimal -> 2 decimal
    select round(avg(SALARY),2) from EMPLOYEES;



