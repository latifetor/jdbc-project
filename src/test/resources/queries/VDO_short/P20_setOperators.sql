select * from DEVELOPERS;

select * from TESTERS;

/*
 UNION
 - to merge more them one table vertically
 - will remove DUPLICATE rows
 - will sort data in an order as default ASC

 */

select * from DEVELOPERS
union
select * from TESTERS;

-- using name of the column, which has the same column from TESTER and DEVELOPERS
-- TYPE of columns are matching and having 2 independence queries

select NAMES from DEVELOPERS
union
select NAMES from TESTERS;

--------------------------------------------
/*
    UNION ALL
    - will not Remove DUPLICATE rows
    - will not sort the data results
*/

select NAMES from DEVELOPERS
union all
select NAMES from TESTERS;

--------------------------------------------
/*
MINUS
 - It removes same data from first table and gives result from first table
 - It returns records from first query that is not present in second query.
 - Order of the queries are important
*/
select NAMES from DEVELOPERS
MINUS
select NAMES from TESTERS;

-- if changing the order of the table
-- it will show the different between the tables by removing same things from TESTER.table
-- and will show UINQUE part of TESTER.table

select NAMES from TESTERS
MINUS
select NAMES from DEVELOPERS;

----------------------------------------------
--INTERSECT
select NAMES from TESTERS
intersect
select NAMES from DEVELOPERS;

