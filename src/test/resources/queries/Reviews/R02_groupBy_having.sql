select * from COUNTRIES;

--------------- GROUP BY, HAVING  -------------------

-- TASK 10- 1 -  how many city we have in each country from locations table

    select COUNTRY_ID,COUNT(*) from LOCATIONS -- count the row
    group by COUNTRY_ID;

    -- BEST practice in this example since we need to count cities
    select COUNTRY_ID,COUNT(CITY) from LOCATIONS --count city row only
    group by COUNTRY_ID;

    -- COUNT(*) vs COUNT(columnName)
    -- COUNT(*) --> will count row
    -- COUNT(columnName) --> will count columnName
    select FIRST_NAME, DEPARTMENT_ID from EMPLOYEES;
    select COUNT(DEPARTMENT_ID) from EMPLOYEES;  --106
    select COUNT(*) from EMPLOYEES;              --107


-- TASK 10- 2  - order them based on city count in desc
    select COUNTRY_ID,COUNT(CITY) as CITY_COUNT
    from LOCATIONS
    group by COUNTRY_ID
    order by CITY_COUNT desc;

-- TASK 10- 3 -  filter result where country id starts with C
    select COUNTRY_ID,COUNT(CITY) as CITY_COUNT from LOCATIONS
    where COUNTRY_ID like 'C%'
    group by COUNTRY_ID
    order by CITY_COUNT desc;

-- TASK 10- 3 -  display country id if city count is bigger than 1
    select COUNTRY_ID,COUNT(CITY) as CITY_COUNT from LOCATIONS
    group by COUNTRY_ID
    having COUNT(CITY)>1
    order by CITY_COUNT desc;

-- TASK 11 -1  How many employees is working for each department
    select DEPARTMENT_ID,COUNT(*) as EMPLOYEES_COUNT from EMPLOYEES
    group by DEPARTMENT_ID ;

-- TASK 11 -2  ignore null departments
    select DEPARTMENT_ID,COUNT(*) as EMPLOYEES_COUNT from EMPLOYEES
    where DEPARTMENT_ID is not null
    group by DEPARTMENT_ID;


-- TASK 11 -3  display department id where employees count is less than 5
    select DEPARTMENT_ID,COUNT(*) as EMPLOYEES from EMPLOYEES
    where DEPARTMENT_ID is not null
    group by DEPARTMENT_ID
    having COUNT(*)<5;

