select * from EMPLOYEES;

----HOMEWORK --> display all information who is getting 3th lowest salary
    -- finding the lowest salary (exact number)
    -- and can do SELECT * FROM EMPLOYEES WHERE SALARY = (exact number) -- subquery
    -- then replace the query that giving the exact number, get DYNAMIC query

    select distinct SALARY from EMPLOYEES
    order by SALARY asc;
    -- 3rd min is 2400

    --DYNAMIC query
        -- this 3rd salary, always be the highest number in this table
        -- select MAX(SALARY) from this query ROWNUM is less than 4
    select MAX(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY asc)
    where ROWNUM <4;

    select * from EMPLOYEES
             where SALARY=(select MAX(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY asc)
                                          where ROWNUM <4);

    --INNER query:
        --(select distinct SALARY from EMPLOYEES order by SALARY asc);
        --remove duplicate salaries, ranking low-high, the top will be the lowest salary
    --OUTER query:
        --(select MAX(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY asc) where ROWNUM <4);
        --get lowest salaries, and find the maximum, since ranking them low->high, the maximum will be the 3rd salary=2400
        --2400, and this query will replace itself with 2400
    --DYNAMIC query;
        -- the result

-------------------
-- finding who is making 46th min salary dynamically

    select distinct SALARY from EMPLOYEES
    order by SALARY asc;

    select * from EMPLOYEES
        where SALARY=9500;

    select * from EMPLOYEES
    where SALARY=(select MAX(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY asc)
              where ROWNUM <47);

-------------------------------

