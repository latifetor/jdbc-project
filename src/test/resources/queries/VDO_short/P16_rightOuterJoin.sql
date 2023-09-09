select * from CUSTOMER;

select * from CUSTOMER C right outer join ADDRESS A
    on C.ADDRESS_ID = A.ADDRESS_ID;

-- finding FIRST_NAME, LAST_NAME and PHONE information
select C.FIRST_NAME, C.LAST_NAME, A.ADDRESS, A.PHONE
from CUSTOMER C right outer join ADDRESS A
    on C.ADDRESS_ID = A.ADDRESS_ID;

-- using RIGHT JOIN: will give the same result
select C.FIRST_NAME, C.LAST_NAME, A.ADDRESS, A.PHONE
from CUSTOMER C right join ADDRESS A
    on C.ADDRESS_ID = A.ADDRESS_ID;

-- the position of the table, if you are using LEFT or RIGHT JOIN is important to get the data
-- deciding which table should be left or right
-- by using LEFT OUTER JOIN with the same  QUERY
select C.FIRST_NAME, C.LAST_NAME, A.ADDRESS, A.PHONE
from ADDRESS A left join CUSTOMER C
    on A.ADDRESS_ID = C.ADDRESS_ID;
