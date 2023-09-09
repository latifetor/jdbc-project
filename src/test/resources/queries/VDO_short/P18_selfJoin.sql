select * from EMPLOYEES;

select EMPLOYEE_ID, FIRST_NAME, LAST_NAME, MANAGER_ID from EMPLOYEES;

--what is 'David Austin' MANAGER_ID=103
--check the employee who has EMPLOYEE_ID=103 which is 'Alexander Hunold'
--'Alexandar Hunold' is a Manager of 'David Austin'
--we use same table twice, means SELF JOIN
--SELF JOIN= using same table; with INNER, LEFT,RIGHT,FULL OUTER JOIN to join itself
--there is NO 'self join' keyword

-- 1st looking for EMPLOYEES.worker (table aliases for EMPLOYEE_ED) table; MANAGER_ID which is=103
-- using EMPLOYEES.table to join itself
-- using inner join EMPLOYEES.table, after find MANAGER_ID from the worker.table in the second usage
-- call this table as 'manager.table' --> check MANAGER.table EMPLOYEE_ID, then can find the solution:
-- after that will combine/merge the same table with itself by using WORKERS.table
-- which the first run gets the WORKERS.table MANAGER>ID WHERE WORKER table, Manager_ID = in the second usage
-- which call it as MANAGERS where MANAGERS.table EMPLOYEE.ID

select WORKERS.FIRST_NAME, WORKERS.LAST_NAME, MANAGER.FIRST_NAME, MANAGER.LAST_NAME
from EMPLOYEES WORKERS inner join EMPLOYEES MANAGER
    ON WORKERS.MANAGER_ID=MANAGER.EMPLOYEE_ID;




