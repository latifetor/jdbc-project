select * from EMPLOYEES;

/*
    LIKE statement:
    - Percent %     --> for matching any sequence of characters. (0 or more)
    - underscore _  --> for matching any single character.
    with the logic of   - contains
                        - starts with
                        - ends with
*/
-- display all employees where first_name starts with B
select * from EMPLOYEES where FIRST_NAME like 'B%';

-- display all employees where firstname starts with B and length of it 5 letter
select * from EMPLOYEES where FIRST_NAME like 'B____';

-- display 5 letter firstname from employees where middle char is z
select * from EMPLOYEES where FIRST_NAME like '__z__';

-- display firstname from emplyees where first name ends with 'e'
select * from EMPLOYEES where FIRST_NAME like '%e';

-- display all employees where job_id contain 'IT'
select * from EMPLOYEES where JOB_ID like '%IT%';

-- display all information where firstname start with 'H' and ending with 'l'
select * from EMPLOYEES where FIRST_NAME like 'H%l';