select * from EMPLOYEES;

/*
 WHERE CLAUSE:
 Operators:  >, <, >=, <=, +, !=, or and and
*/
-- Display firstname, lastname and salary information where firstname is James
-- '' is case sensitive
    select FIRST_NAME,LAST_NAME,SALARY from EMPLOYEES where FIRST_NAME='James';

-- Display firstname and salary information who is making less than 5000
    select FIRST_NAME,SALARY from EMPLOYEES
    where SALARY<5000;

-- Display all information who is making less than 5000 and manager id is 114
    select * from EMPLOYEES
    where SALARY<5000 and MANAGER_ID=114;

-- Display firstname, lastname information who is making less than and equal 5000
-- and more than and equal 3000
    select FIRST_NAME,LAST_NAME,SALARY from EMPLOYEES
    where SALARY>=3000 and SALARY<=5000;

/*
BETWEEN --> used for filtering result with range
        --> specify which column we will use to filter, then write
        --> lowest boundary is 3000 and highest boundary is 5000
    syntax: BETWEEN lowest and highest
            lowest/highest boundaries are included
*/
    select FIRST_NAME,LAST_NAME,SALARY from EMPLOYEES
    where SALARY between 3000 and 5000;


-- Display firstname, lastname, salary where firstname is 'David' or 'Peter'
    select FIRST_NAME,LAST_NAME,SALARY from EMPLOYEES
    where FIRST_NAME='David' or FIRST_NAME='Peter';

/*
 IN STATEMENT --> it works same logic with OR for multiple conditions
*/

-- Display firstname, lastname, salary where firstname is 'David' or 'Peter' or 'James'
    select FIRST_NAME,LAST_NAME,SALARY from EMPLOYEES
    where FIRST_NAME in ('David','Peter','James');