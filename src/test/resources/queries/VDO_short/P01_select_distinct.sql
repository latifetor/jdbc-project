select * from EMPLOYEES;

/*
 MAC --> CMD + ENTER
*/

/*
SELECT STATEMENT:
- will help us to reach data from database
- there are 4 difference syntax:
    1. selecting ENTIRE columns from a table
        select * from TableName;

    2. selecting a SINGLE column from a table
        select columnName from TableName;

    3. selecting MULTIPLE columns from a table
        select ColumnName1, ColumnName1.... from TableName;

    4. selecting columns from a MULTIPLE tables
        select TableName1.ColumnName1,TableName2.ColumnName2 from TableName1, TableName2;

*/
select * from DEPARTMENTS;
select * from EMPLOYEES;
select DEPARTMENT_NAME from DEPARTMENTS;
SELECT DEPARTMENT_NAME FROM DEPARTMENTS;

select DEPARTMENT_ID,DEPARTMENT_NAME from DEPARTMENTS;


select * from DEPARTMENTS,EMPLOYEES;

select EMPLOYEES.First_Name,DEPARTMENTS.department_Name from DEPARTMENTS,EMPLOYEES;


/*
DISTINCT --> Display only different value from result
*/

select FIRST_NAME from EMPLOYEES;
select distinct (FIRST_NAME) from EMPLOYEES;

select SALARY from EMPLOYEES;
select distinct (SALARY) from EMPLOYEES;

