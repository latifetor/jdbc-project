
/*
-------VIEW-------
    syntax:
    Create VIEW tableName AS
    Type Query Here

    CREATE or REPLACE VIEW tableName As
    Type Query Here
 */

select * from EMPLOYEES;


create VIEW PERSONAL_INFO as
select FIRST_NAME||' '||LAST_NAME as "Full Name" from EMPLOYEES;

-- get the information of the full name column
-- to be able to store this query, just like a "Visual Table" --> VIEW
-- when we need it, will be able to call this VIEW again
-- by using syntax: above the query and run
-- PERSONAL_INFO will be created in the view.folder (visible in Database) or at the Output (console)
-- this is NOT physical exist and it does NOT hold any data
-- when we want to get "Full Name" information, it will get data from EMPLOYEES.table
-- it make reusable to our query

-- to get another column from other tables or same table
-- it is possible to change or replace the VIEW with the help of "CREATE OR REPLACE VIEW"
-- will be able to update existing one, if don't have will create one for

CREATE OR REPLACE VIEW PERSONAL_INFO AS --UPDATE
select FIRST_NAME||' '||LAST_NAME as "Full Name", SALARY*12 as "Annual Salary" from EMPLOYEES;

-- it is possible to get data from one column in the VIEW
-- specify "Full Name" column, then and using from VIEW.table "PERSONAL_INFO"
-- it will recognized what we try to get, when running the query,
-- it returns the information from PERSONAL_INFO VIEW, just like we did
select "Full Name" from PERSONAL_INFO;

--------DROP VIEW-------
-- will delete the VIEW from the database
-- after DROP VIEW keyword, which VIEW will be dropped
-- run and check from Output
DROP VIEW PERSONAL_INFO;


