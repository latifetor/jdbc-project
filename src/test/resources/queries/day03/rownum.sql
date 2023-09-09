SELECT * FROM EMPLOYEES;

/*  ROWNUM:
    it limits rows based on provided number
*/
    select * from EMPLOYEES
    where ROWNUM<11; -- display the first 10 rows
        -- using < (less than) or <= (less than or equals)

-- display all information from employees who is getting first 5 highest salary
-- it BAD practice, it is getting data before order them based on salary
-- and cut the list from line 6 then it tries to order thme between first 5 rows
-- that is why we are getting wrong list

    select * from EMPLOYEES
    where ROWNUM<6
    order by SALARY desc;
    -- * ISSUE: ORDER of EXECUTION in SQL
        -- having ROWNUM with the WHERE statement but ORDER BY statement come after ROWNUM
        -- we can NOT use ROWNUM and ORDER BY in this way
        -- to filter everyone, then rank them based on high to low and get the first one
        -- what's happening here is, getting the first 5 without any ORDER, then you ordering among them
        -- but the existing, this query has a problem does not display the correct result
        -- it is taking original EMPLOYEES.table

--what we need to change?
    -- should not be getting the original EMPLOYEES.table, should get ORDER EMPLOYEES.table
    -- we don't have to call directly EMPLOYEES.table, using SUBQUERY we can call MANIPULATED.table
    -- that's the important feature and it will our job more easiere for solving these kinds of problem
--what does it mean?
    -- what is the correct table: with ORDER.list
    select * from EMPLOYEES order by SALARY DESC;
        -- to be able get first 5 from this list
        -- needs to provide this ORDER.table.query as a EMPLOYEES.table for ROWNUM.query

--How can we do? select from ORDER.table instead
--CORRECT answer
    -- using ORDERED BY SALARY desc EMPLOYEES.table as an input
    -- after FROM keyword then cutting first 5 with ROWNUM
    select *
    from (select * from EMPLOYEES order by SALARY DESC)
    where ROWNUM < 6;

    -- select * from ORDER.table (get the same table) which is not original EMPLOYEES.table because
    -- from: the source of the data change manipulated an order
    -- we can implementing the ROWNUM with WHERE statement
    -- then we get the correct first 5 data list
    -- because we change the data source, which from ORDER.table
    -- it is select * from not the regular EMPLOYEES.table from ORDER.(EMPLOYEES)table which we previously selected
    -- after get the result then will cut the row from that

    -- IF to display first 10 just change: WHERE ROWNUM < 11

---------------------------------------------------------------
--display all information who is getting 5th highest salary
    -- when saying "5th highest salary" maybe might have the duplicated value in2 or 3 people making the same salary
    -- we need to remove the duplicated value, to see the salary amount for the 1st, 2nd or 3nd one

    select distinct SALARY from EMPLOYEES order by SALARY desc;

    select * from (select distinct SALARY from EMPLOYEES order by SALARY desc)
    where ROWNUM <6;

        -- we need to understand the question first,
        -- need to get the salary list, remove the duplicated value and see what is the 1st highest salary and next
        -- to be able to remove duplicated value by using DISTINCT
        -- to be able to cut this list and get the first 5 salaries with DYNAMICALLY,
        -- by changing the data source to be the MANIPULATED.table
        -- then using MIN function to SELECT the value

    -- first to need to find what is the 5th highest salary
        -- without knowing the number get the 5th salary from this query

    select MIN(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY desc)
    where ROWNUM <6;

-- who is making 5th highest salary?
    -- result with hardcode value:
    select * from EMPLOYEES
    where SALARY = 13000;

    --DYNAMIC way
    select * from EMPLOYEES
    where SALARY = (select MIN(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY desc)
                    where ROWNUM <6);

    -- HOW DOES IT WORKS?
    -- 1st QUERY: we are changing the EMPLOYEES.table ORDER
        --> (select distinct SALARY from EMPLOYEES order by SALARY desc)
        --> this is manipulated EMPLOYEES.table, where we removed duplicate salaries and order them high to low
    --2nd QUERY:
        --> (select MIN(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY desc) where ROWNUM <6);
        --> it takes ORDERED EMPLOYEES.table as input, get first 5 highest salary and then gets the minimum one
        --> because MIN will be always the 5th highest salary since we cut the rows for the highest 5
    --3rd QUERY:
        --> return the information of the 5th highest salary after execution = 130000

--------------------------------------------------
--IQ how do you find who is making 37Th highest salary
    -- for the Nth highest salary formula is ROWNUM < N+1
    -- for the 37th highest salary formula is ROWNUM < 37 + 1

select * from EMPLOYEES
where SALARY = (select MIN(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY desc)
                where ROWNUM <38);

-- by changing only one place at the ROUWNUM to 38 (less than 38)
    -- (select MIN(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY desc) where ROWNUM <38); = 4800
    -- at the end to see who is making 4800 high salary

--HOMEWORK --> display all information who is getting 3th lowest salary
    -- finding the lowest salary

select * from EMPLOYEES;

