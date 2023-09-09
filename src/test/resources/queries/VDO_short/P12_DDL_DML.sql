select * from EMPLOYEES;

/*
 CREATE: TABLE syntax:
    create table TableName(
        colName1 DataType Constraints,
        colName2 DataType Constraints (option),
        colName3 DataType Constraints
        ...
    );
 NOTE: Constraints are NOT mandatory
 */

 create table students(
     student_id integer PRIMARY KEY,
     first_name varchar(15) NOT NULL,
     email varchar(50) UNIQUE,
     age integer CHECK ( age>18 ),
     status varchar(50) DEFAULT 'ACTIVE'

 );

select * from STUDENTS;

/*
    INSERT syntax:
        INSERT INTO tableName (column1, column2,...)
        VALUE (value1, value2, ...);
    in the real work environment, while the developer creating data or tables into Database
    their will not provide the PRIMARY KEY DATA manually, they will use 'AUTO INCREMENT' behind the scene

*/

INSERT INTO students (student_id, first_name, email, age) VALUES (1,'Mitcheal','mitc@gmail.com',20);

INSERT INTO students (student_id, first_name, email, age, status) VALUES (2,'JULIA','mitch@gmail.com',19,'ACTIVE');

INSERT INTO students (student_id, first_name, email, age, status) VALUES (3,'John','john@gmail.com',19,'ACTIVE');

INSERT INTO students (student_id, first_name, email, age) VALUES (4,'Pamila','pami@gmail.com',20);

commit;
-- to save changes in Database, we need to use COMMIT or COMMIT WORK;

/*
    UPDATE syntax:
        UPDATE table_name
        SET column1 = value1,
            column2 = value2, ...
        WHERE condition;
*/
UPDATE students SET status='INACTIVE'
where student_id=1;
-- 'UPDATE' statement without 'WHERE' updates all table rows at once:

select * from students;

commit;

/*
DELETE FROM table_name
WHERE condition;
*/
delete from STUDENTS
where student_id=1;

commit;

select * from STUDENTS;
-- ALTER-->
    --  ADD NEW COLUMN      --> add columnName  type
        alter table STUDENTS add gender varchar(10);

    -- update John gender as Male
        update STUDENTS
        set gender='Male' where STUDENT_ID=3;

    --  RENAME THE COLUMN   --> rename column to newColumn
        alter table STUDENTS rename column email to emailAddress;

    --  DROP COLUMN         --> drop column columnName
        alter table STUDENTS drop column gender;

    --  RENAME TO           --> rename to newTable
        alter table STUDENTS rename to friends;

        select * from FRIENDS;
    commit;

-- TRUNCATE --> remove the table content
    -- truncate table tableName
        truncate table friends;

-- DROP: will remove table with conten
    -- drop table tableName
        drop table FRIENDS;

    select * from FRIENDS;
