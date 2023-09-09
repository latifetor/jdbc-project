select * from EMPLOYEES;

/*
    Create table syntax:
        create table TableName(
            colName1 DataType Constraints,
            colName2 DataType Constraints(optional)
            colName3 DataType Constraints,
            ...
    );
    constraints: setting limitation/restriction
*/
----- CREATE TABLE-----
-- Data Definition part
-- define 5 columns to defining data.structure

CREATE TABLE scrumteam(
    emp_id Integer PRIMARY KEY,
    first_name varchar(30) not null,
    last_name varchar(20) not null,
    job_title varchar(20),
    salary Integer
);

select * from SCRUMTEAM;

-- checking the table
-- it will work only one time if we run the CREATE TABLE
-- because when we run it, it try to create the SCRUMTEAM.table again
-- but since we already run and having the table structure
-- the name has been used by the existing object

/*
    INSERT INTO tableName (column1, column2,...)
    VALUES (value1, value2, ...);
*/
INSERT INTO SCRUMTEAM(emp_id, first_name, last_name, job_title, salary)
VALUES (1,'Maya','Gafulrova','Developer',150000);

INSERT INTO SCRUMTEAM(emp_id, first_name, last_name, job_title, salary)
VALUES (2,'Harold','Finch','Tester',110000);

INSERT INTO SCRUMTEAM(emp_id, first_name, last_name, job_title, salary)
VALUES (3,'Michael','Scofield','Scrum Master',90000);

INSERT INTO SCRUMTEAM(emp_id, first_name, last_name, job_title, salary)
VALUES (4,'Ellen','Deegenere','PO',90000);

INSERT INTO SCRUMTEAM(emp_id, first_name, last_name, job_title, salary)
VALUES (5,'Peterson','Meadowlee','BA',120000);

-- save changes so that other people, connections can get the updates.
-- did DDL/DML changing, which changing the structure of data in database
-- which we need to update it
commit;

/*
 UPDATE table_name
 SET column1 = value1,
 column2 = value2, ...
 WHERE condition;
*/
select * from SCRUMTEAM;

UPDATE SCRUMTEAM
SET SALARY=SALARY+5000;

UPDATE SCRUMTEAM
SET SALARY=110000
where EMP_ID = 3;

commit work;

/*
DELETE FROM table_name
WHERE condition;
*/
DELETE FROM SCRUMTEAM
WHERE EMP_ID = 1;

commit ;

-- we implement CRUD operations
    -- CREATE   (INSERT)
    -- READ     (SELECT)
    -- UPDATE   (UPDATE)
    -- DELETE   (DELETE)

-------ALTER-----------
--ADD NEW COLUMN
ALTER TABLE SCRUMTEAM ADD gender varchar(10);

select * from SCRUMTEAM;

UPDATE SCRUMTEAM
SET gender = 'Male'
where EMP_ID = 5;

UPDATE SCRUMTEAM
SET gender = 'Male'
where EMP_ID in (2,3,4);

--RENAME THE COLUMN
ALTER TABLE SCRUMTEAM RENAME COLUMN salary TO annual_salary;

--DROP COLUMN
ALTER TABLE SCRUMTEAM DROP COLUMN gender;

--RENAME TABLE (permanent rename)
ALTER TABLE SCRUMTEAM RENAME TO agileteam;

select * from agileteam;

--TRUNCATE
TRUNCATE TABLE agileteam;

--DROP TABLE
DROP TABLE agileteam;

commit;

/*
 IQ --> what is the difference between TRUNCATE and DROP
    TRUNCATE    --> it will delete table content, but keep the table structure
    DROP        --> it will delete all content and table structure itself
 */

