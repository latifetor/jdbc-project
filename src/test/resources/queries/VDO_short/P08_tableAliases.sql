select * from EMPLOYEES;

/*
Used to give temporary name to tables as columns
    Column Aliases -> we use as keyword to give temporary columnName
        Select columnName as “name” from table;
    Table Aliases -> given with a space
        Select column from TableName Name;
Note: we are just displaying and nothing will change in database

*/

-- Column Aliases
select FIRST_NAME||' '||EMPLOYEES.LAST_NAME as "Full Name" from EMPLOYEES;

select CONCAT(EMAIL,'@gmail.com') as "Email Address" from EMPLOYEES;

-- Table Aliases
-- can get multiple columns from multiple table

    -- select EMPLOYEES.FIRST_NAME, EMPLOYEES.LAST_NAME, DEPARTMENTS.DEPARTMENT_NAME from EMPLOYEES, DEPARTMENTS;
        --> instead of keep writing, after EMPLOYEES table to point EMPLOYEE table itself
        --> by using TableAliases, type 'e' as initial for EMPLOYEES.table
        --> instead of using EMPLOYEES.table inside the query, type 'E' which refers the EMPLOYEES.table
        --> instead of using DEPARTMENT.table, 'D' to refers the DEPARTMENT

select E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME from EMPLOYEES E, DEPARTMENTS D;

        --> E refers = EMPLOYEES.table
        --> D refers = DEPARTMENT.table






