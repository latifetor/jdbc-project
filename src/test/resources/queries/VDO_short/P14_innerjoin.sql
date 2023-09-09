select * from CUSTOMER;

select * from ADDRESS;

-- combine 2 tables
--1st: try to get all data from both tables
    -- start with the CUSTOMER.table join with ADDRESS.table
    -- by using INNER JOIN to get ONLY matching portion from both tables
    -- matching portion: where CUSTOMER.table ADDRESS_ID equals ADDRESS.table ADDRESS_ID

select * from CUSTOMER inner join ADDRESS
    on CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID;

--1st will check 'Mary Smith' and find the ADDRESS-ID from the CUSTOMER.table and will look for ADDRESS.table
    --where ADDRESS_ID is equal 5 based on the statement and it will find matching row
    -- and merge after 'Mary Smith' information in the table
--for others will work in the same structure

-- it is possible to choose more than 1 column information from this 'matching portion table'
-- to get FIRST_NAME and LAST_NAME from CUSTOMER.table

select CUSTOMER.first_name,CUSTOMER.last_name,ADDRESS.address,ADDRESS.phone
from CUSTOMER inner join ADDRESS
    on CUSTOMER.ADDRESS_ID = ADDRESS.ADDRESS_ID;

-- using Table.Aliases and Column.Aliases to give better name, instead of repeating CUSTOMER and ADDRESS.
select C.first_name,C.last_name,A.address,A.phone
from CUSTOMER C inner join ADDRESS A
                         on C.ADDRESS_ID = A.ADDRESS_ID;
