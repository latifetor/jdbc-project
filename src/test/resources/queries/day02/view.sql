SELECT * FROM EMPLOYEES;

select SUBSTR(FIRST_NAME,0,1)||'.'||SUBSTR(LAST_NAME,0,1)||'.' as initials,
FIRST_NAME||' '||EMPLOYEES.LAST_NAME as full_name from EMPLOYEES;

-- UI testing: using full_name but Database gives FIRST_NAME and LAST_NAME in different rows
-- Tester has to come up with "query" to retrieve the full_name
-- and if needs to do it many time, create temporary " saving port" by using "VIEW" table
-- it's NOT a real table, which will NOT store in the Database

CREATE VIEW EmployeeInfo as
select SUBSTR(FIRST_NAME,0,1)||'.'||SUBSTR(LAST_NAME,0,1)||'.' as initials,
FIRST_NAME||' '||EMPLOYEES.LAST_NAME as full_name from EMPLOYEES;

-- VIEW: allows you to select from the VIEW folder.file
-- VIEW: Visual table helps to save some of the edited column as reused

select * from EMPLOYEEINFO;

select initials from EMPLOYEEINFO;

-- if you don't need this file anymore
-- by using DROP VIEW
DROP VIEW EmployeeInfo;