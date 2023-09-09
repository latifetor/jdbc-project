SELECT * FROM EMPLOYEES;

/*
  1. Column aliases --> it is temporary name to show in display

  2. Table aliases  --> it is temporary name to show in display
     ex. EMPLOYEES  as E

  NOTE: ONLY displaying and it does not affect on the Database
*/
-- display departments where their average salary is more than 6k
select DEPARTMENT_ID, round(avg(SALARY))
from EMPLOYEES
where DEPARTMENT_ID is not null
group by DEPARTMENT_ID
having avg(SALARY) > 6000
order by 2 ASC;

-- the query below second column name is "ROUND(AVG(SALARY))" which is not relatively name
-- to be able to change the name of the column that we using "GROUP BY" more
-- as " STRING " : This column as "  "
    -- if using " " --> it allows to use space in between
    -- without "  " --> it not allows to use space in between, using underscore_ to separate
select DEPARTMENT_ID, round(avg(SALARY)) as "AVERAGE_salary"
from EMPLOYEES
where DEPARTMENT_ID is not null
group by DEPARTMENT_ID
having avg(SALARY) > 6000
order by 2 ASC;

-- 2# way
select DEPARTMENT_ID, round(avg(SALARY)) as AVERAGE_salary
from EMPLOYEES
where DEPARTMENT_ID is not null
group by DEPARTMENT_ID
having avg(SALARY) > 6000
order by 2 ASC;

--manager is asking display annual salary for all employees as annual_salary
--to make salary as yearly, by implementing: multiply * to each of the column
--it will duplicate the SALARY with 12 but will get in the "Column_name" = "SALARY*12"
--to rename this column by using AS

select FIRST_NAME, SALARY*12 as Annual_salary
from EMPLOYEES;

----------------------STRING MANIPULATION----------------------------------
/*
-- How to concatenate the column by using || (pipe)
    CONCAT:
        - Java --> +  first_name+" " +last_name
        - SQL  --> || first_name||' '||last_name
*/

-- I want to get full_name column where we have firstname+" "+lastname
select FIRST_NAME||' '||LAST_NAME as full_name
from EMPLOYEES;

--using || to concat: add DOMAIN @cydeo.com to all the emails in the employees table.
select EMAIL||'@cydeo.com' from EMPLOYEES;

--using concat(FUNCTION) by giving column_name and providing text that want to be concatenated
select CONCAT(EMAIL,'@cydeo.com') from EMPLOYEES;

--lowercase
select lower(EMAIL||'@cydeo.com') from EMPLOYEES;

--UPPERCASE
select UPPER(EMAIL||'@cydeo.com') from EMPLOYEES;

--INITCAP: it makes first letter UPPERCASE
select INITCAP(EMAIL||'@cydeo.com') from EMPLOYEES;

--Length: giving the length of email
select EMAIL,LENGTH(EMAIL) as email_length from EMPLOYEES;

-- display all employees where first_name length equals 6
select FIRST_NAME from EMPLOYEES where length(FIRST_NAME) = 6;

-- another solution
select FIRST_NAME from EMPLOYEES where FIRST_NAME like '______';

-- how many question?
select COUNT(*) from EMPLOYEES where FIRST_NAME like '______';

-- display initial from first_name and last_name
    --> Stephen King = S.K.
    --> Nena Taylor  = N.T.
-- SUBSTR(columnName, beginningIndex, numberOfChar)
    --> it allows to pick number of characters from the sorting index
select * from EMPLOYEES;
select SUBSTR(FIRST_NAME,0,1)||'.'||SUBSTR(LAST_NAME,0,1)||'.' as initials from EMPLOYEES;
-- using SUBSTR get the first index only 1 character from FIRST_NAME
-- and then SUBSTR get the first index only 1 character from LAST_NAME

select SUBSTR(FIRST_NAME,0)||'.'||SUBSTR(LAST_NAME,0,1)||'.' as initials from EMPLOYEES;
-- FIRST_NAME will get all of characters
-- LAST_NAME will get the first index ans only 1 character

select SUBSTR(FIRST_NAME,1,1)||'.'||SUBSTR(LAST_NAME,1,1)||'.' as initials from EMPLOYEES;
-- get the same result
-- it does not matter giving index 0 or 1 the SQL convert to index: 1
-- instead of giving "some error"

select FIRST_NAME,SUBSTR(FIRST_NAME,-2,2) as reverse_two_char from EMPLOYEES;
-- putting -index: it will start from the end (reverse)

select FIRST_NAME,SUBSTR(FIRST_NAME,-3) as reverse_three_char from EMPLOYEES;

/*
    - if beginning index is 0, it is treated as 1
    - if the beginning index negative, it will start from backwards
    - if we don't specify number of char it will worktill the end

 */

