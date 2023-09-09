select * from CUSTOMER;

select * from CUSTOMER C full outer join ADDRESS A
    on C.ADDRESS_ID = A.ADDRESS_ID;

-- it gives matching portions:
-- plus UNIQUE for the right-side of the ADDRESS.table with address without customer information
-- and UNIQUE for the left-side of the CUSTOMER.table with customer without address information

-- using with ALIASES
select C.FIRST_NAME, C.LAST_NAME, A.ADDRESS, A.PHONE
from CUSTOMER C full outer join ADDRESS A
      on C.ADDRESS_ID = A.ADDRESS_ID;

-- using FULL JOIN which give the same result
select C.FIRST_NAME, C.LAST_NAME, A.ADDRESS, A.PHONE
from CUSTOMER C full join ADDRESS A
                                on C.ADDRESS_ID = A.ADDRESS_ID;

