select * from EMPLOYEES;

--Task1: how many locations we have for each country
    -- each     = using group by
    -- how many = count(*) or count()
    -- create group based on the country_id then count how many locations for the each country_id

    select COUNTRY_ID, COUNT(*) from LOCATIONS
    group by COUNTRY_ID;

   -- order them based on COUNTRY_ID in asc order
    select COUNTRY_ID, COUNT(*) from LOCATIONS
    group by COUNTRY_ID
    order by COUNTRY_ID; --default as asc

    -- what if I want to see only US, UK and CA
    -- only the input will be the location that we have in US, UK and CA
    -- how to get the location information each row before grouping them
    -- to do something before GROUP BY, by putting WHERE statement after FROM
    -- STEPS: 1st-filter the result, then group them based on the result, then can continues actions
    select COUNTRY_ID, COUNT(*) from LOCATIONS
    where COUNTRY_ID in ('US','UK','CA')
    group by COUNTRY_ID
    order by COUNTRY_ID desc;

-- how can implement "HAVING" or what's forcing us to implement "HAVING"
-- display where location count is bigger than 2
    -- the filter is asking to implement or filter after having groups
    -- because it telling 'count bigger than 2'
    -- in the individual record, can NOT do this, does not know how many US rows when implement WHERE statement
    -- after get the all results, able to tell how many in each COUNTRY_ID for US:4,UK:3,CA:2
    -- and able to put CONDITION where the countries that already COUNT it greater than 2
    -- this COUNT(*) is representing each GROUP, so that able to
    -- put the condition 'bigger than 2' after implementing the group
    -- what was the clause for filtering after the group by, it is a 'HAVING'

    select COUNTRY_ID, COUNT(*) from LOCATIONS
    where COUNTRY_ID in ('US','UK','CA')
    group by COUNTRY_ID
    having COUNT(*)>2
    order by COUNTRY_ID desc;

-- WHERE        = implementing the filters before put into the group
-- GROUP BY     = creating the small group/table for the records that we have in the locations
-- HAVING       = statement, implementing filter for each small group/table
-- get the result and able to implement using
-- ORDER BY     = based on the column_name and based on the type as wants

--------------------------------------------------------------
--TASK2: Display all employee salary in following format as column name EMPLOYEES_SALARY
    -- Ex: having one column, the data will be in this column
        -- Steven makes 24000
        -- Neena  makes 17000
    -- implementing STRING MANIPULATION and DYNAMICALLY get the result

    select * from EMPLOYEES;
    -- need to capture the FIRST_NAME makes SALARY.table --> 2 pipes to concat
    -- need static task in between
    -- STRING MANIPULATION: CONCAT(value1,value2)
    -- to get column_name to display differently, by using AS (aliases)

    select FIRST_NAME||'makes '||SALARY as Employee_salary
    from EMPLOYEES;

