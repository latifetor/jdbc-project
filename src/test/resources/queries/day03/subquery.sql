select * from EMPLOYEES;

--Display all information who is making max salary

    --First: find max(salary) with one query
    select max(SALARY) from EMPLOYEES; --24000

    --then using that input as a filter for salary
    --can NOT put select *, MAX(SALARY) to get the result,
    --because it is AGGREGATE function will NOT working directly with the statement FIRST_NAME, LAST_NAME or
    --implementing either as a one statement and get one result or implementing group by for multiple group
    --can NOT get that information at the same time for AGGREGATE function with regular column.name

    select * from EMPLOYEES
    where SALARY=24000; -- Steven King

-- the problem to this query is if there is any changing, the result will not be valid
-- to make this query DYNAMIC, which should not have any STATIC input in the query
-- this '24000' should be replaced with the query that giving for 'maximum salary dynamically' NOT 'static' way
-- the query that's providing SALARY=24000 is   select max(SALARY) from EMPLOYEES; --24000
-- it is dynamic solution
-- if the 'Steven King' salary changes, we cannot find person who is getting max salary with the query above
    select * from EMPLOYEES
    where SALARY=(select max(SALARY) from EMPLOYEES);

-- what's happen? there may have multiple queries in one statement, called --> SUBQUERY
    -- 1st the INNER QUERY executed and the result will be replace itself value
    -- = select MAX(SALARY) from EMPLOYEES=24000
    -- 2nd the OUTER QUERY will executed and will give the same result as INNER QUERY
    -- but in one query we are finding DYNAMIC result = MAX(SALARY) not to provide STATIC
    -- whenever run this query will return the correct result

-- TASK: Give all information who is getting min salary

    select min(SALARY) from EMPLOYEES;
        -- 2100
    select * from EMPLOYEES where SALARY=2100;
        -- TJ Olson
    select * from EMPLOYEES where SALARY=(select min(SALARY) from EMPLOYEES);

--QA: display all information, who is second highest salary

    select MAX(SALARY) from EMPLOYEES;
        --STEP1: find max salary: 24000

    select MAX(SALARY) from EMPLOYEES
    where SALARY < 24000;
        --STEP2: second max salary = 17000

    select * from EMPLOYEES where SALARY=17000;
        --result: get the second highest salary

    select * from EMPLOYEES where SALARY=(select MAX(SALARY) from EMPLOYEES
                                          where SALARY < (select MAX(SALARY) from EMPLOYEES));
        -- DYNAMIC SOLUTION:
            -- there are 3 layer of the queries
            -- the 1st innest query:
                --(select MAX(SALARY) from EMPLOYEES)); = get executed = 24000 and replace itself
            -- the 2nd inner query:
                --(select MAX(SALARY) from EMPLOYEES where SALARY < () = get executed = 17000 and replace itself
            -- the 3rd outer query:
                -- select * from EMPLOYEES where SALARY=(); = get executed with DYNAMIC result

-- TASK: Display all information who is getting more than average?
        -- find average salary = 6461.83
    select ROUND(avg(SALARY)) from EMPLOYEES;

        -- find who get more than average (6462) salary
    select * from EMPLOYEES
    where SALARY>6462;

    select * from EMPLOYEES
    where SALARY>(select (avg(SALARY)) from EMPLOYEES);



