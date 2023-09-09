SELECT * from EMPLOYEES;

-- SELECT DISTINCT STATEMENT
/*
    it show different values from query result based provided column
    removed the duplicated values
*/
-- it returns 107
SELECT FIRST_NAME from EMPLOYEES;

-- it removed duplicates and return 91 result
select DISTINCT FIRST_NAME FROM EMPLOYEES;

-- display 107 rows nothing changed, it will check each row to filter different columns
-- * is all columns
-- if using select distinct includes with Primary-key will not make any different
-- because Primary-key is already removing the duplicated values

SELECT DISTINCT * FROM EMPLOYEES;


SELECT * FROM JOBS;
SELECT JOB_ID FROM JOBS;
select Distinct JOB_ID from JOBS;
-- since Primary-key can not be duplicated, it gives the same result with distinct.
-- JOB_ID is Primary-key, there is no different
-- return 19 rows




