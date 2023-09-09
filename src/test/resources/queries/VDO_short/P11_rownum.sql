select * from EMPLOYEES;

/*
    ROWNUM:
    - limit the number of result displayed in the query result.
    - only works with less then (<) and less then and equals (<=)
    - Does not work with greater than (>) and equals (=)
*/

-- Display only 5 employees information
    select * from EMPLOYEES where ROWNUM <6;

    select * from EMPLOYEES where ROWNUM <=5;

--BAD PRACTICE DUE TO EXECUTION ORDER
    select * from EMPLOYEES where ROWNUM<=7
    order by SALARY desc;

/*
    EXECUTION ORDER:
    - FROM      --> Choose table
    - WHERE     --> Filter (data individually)
    - GROUP BY  --> Aggregates data (based on the provided column)
    - HAVING    --> Filters aggregated data (group data)
    - SELECT    --> Returns Data
    - ORDER BY  --> Sorts Data
*/

--Display all information from employees who is getting first 7 highest salary
    -- find employee information in sorted manner based on salary in desc
    select * from EMPLOYEES order by SALARY desc;

    -- use that table to apply rownum
    select * from (select * from EMPLOYEES order by SALARY desc)
    where ROWNUM<=7;
        -- 1st runs INNER QUERY: get sorted EMPLOYEES.table
        -- then will cut the (sorted EMPLOYEES.table) from line 7 to see in display

--Display all information from employees who is getting seventh highest salary

    -- display 7 highest salary
    select MIN(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY desc)
    where ROWNUM<=7;

    -- from this column, we know that it has only 7 list of the highest salary
    -- when using this column, min salary will give 7th salary and DISTINCT the duplicate salary out
    -- we are managing data with the help of ROWNUM and MIN

    -- who is getting 7th highest salary
    select * from EMPLOYEES where SALARY=12000;

    -- Dynamic:
    select * from EMPLOYEES
    where SALARY=(select MIN(SALARY) from (select distinct SALARY from EMPLOYEES
                                                                  order by SALARY desc) where ROWNUM<=7);

--------------------------------------------------
/*  EXTRA INFORMATION
-- Display all information from employees who is getting first 7 highest salary

    MYSQL - POSTGRESQUL --> LIMIT
        select * from EMPLOYEES
        order by SALARY desc
        LIMIT 7;
            -> cut from lin 7 to display, we don't need to apply any logic)
            -> limit.keyword will work at the end of query execution

    MSSQL --> TOP
        select TOP 7* from EMPLOYEES
        order by SALARY desc;
            -> it will show after sort EMPLOYEES information based on the SALARY
            -> will cut the list from line 7 with the help of TOP.keyword
*/

