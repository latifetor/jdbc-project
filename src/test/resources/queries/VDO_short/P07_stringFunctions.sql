select * from EMPLOYEES;
/*
    STRING FUNCTIONS:

    concatenation operator: ||
    CONCAT(value1, value2);
    UPPER(value);
    LOWER(value);
    INITCAP(value);
    LENGTH(value);
    SUBSTR(columnName, beginningIndex, numberOfChar)
        --> if beginning index 0, it is treated as 1
    ONLY USED for the DISPLAY, does not modify table
 */

 /*
  -------concatenation operator: || ---------
    firstName   lastName
    Steven      King
  in Java:  firstName+" "+lastName      --> Steven King
  in SQL:   firstName||' '||lastName    --> Steven King
*/

select FIRST_NAME||' '||LAST_NAME from EMPLOYEES;

-- display all of the employees email with @gmail domain
select EMAIL||'@gmail.com' from EMPLOYEES;

-----------CONCAT(value1, value2);--------
-- display first_name with space
select CONCAT(FIRST_NAME,' ') from EMPLOYEES;

--display first_name and last_name in the same row
select CONCAT(CONCAT(FIRST_NAME,' '),LAST_NAME) from EMPLOYEES;

--display email and @gmail.com domain in the same row
select CONCAT(EMAIL,'@gmail') from EMPLOYEES;

-----------UPPER(value);--------
--display first_name in UPPER case
select UPPER(FIRST_NAME) from EMPLOYEES;

-----------LOWER(value);--------
--display first_name in LOWER case
select LOWER(FIRST_NAME) from EMPLOYEES;

-----------INITCAP(value);--------
--display first letter is UPPERCASE and rest of them will be LOWERCASE
select INITCAP(EMAIL) from EMPLOYEES;

-----------LENGTH(value);--------
select FIRST_NAME,LENGTH(FIRST_NAME) from EMPLOYEES;

------------SUBSTR(columnName, beginningIndex, numberOfChar)------------
-- to extract any data from the string or partially a string

-- display employee information with the initial first_name and last_name --> S.K.
select FIRST_NAME, LAST_NAME from EMPLOYEES;
select SUBSTR(FIRST_NAME,0,1)||'.'||SUBSTR(LAST_NAME,0,1) as INITIAL_NAME from EMPLOYEES;

-- if beginning index 0, it is treated as 1
select SUBSTR(FIRST_NAME,1,1)||'.'||SUBSTR(LAST_NAME,1,1) as INITIAL_NAME from EMPLOYEES;
