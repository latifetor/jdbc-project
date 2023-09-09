select * from CUSTOMER;

select * from CUSTOMER C left outer join ADDRESS A
    on C.ADDRESS_ID = A.ADDRESS_ID;

-- since we have LEFT OUTER. keyword, will get UNIQUE PART of CUSTOMER.table
-- which is LEFT.table
-- when running will get all data including customer without address information

-- to get customer first_name and last_name for specific column
select C.FIRST_NAME, C.LAST_NAME,A.ADDRESS,A.PHONE
from CUSTOMER C left outer join ADDRESS A
    on C.ADDRESS_ID = A.ADDRESS_ID;

-- LEFT OUTER JOIN and LEFT JOIN will give the same result there is NO difference
-- both refer the same action