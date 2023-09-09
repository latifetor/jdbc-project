/*
 ORDER BY --> used for sorting result
 - AS A DEFAULT it will sort data in ASC (0-9,A-Z)
*/

select * from countries
order by REGION_ID;

select * from countries
order by REGION_ID asc;

/*
 ORDER BY --> used for sorting result
 -  DESC will order data (9-0, Z-A)
*/

select * from countries
order by REGION_ID DESC;

-- we can use WHERE clause together
select * from COUNTRIES
where REGION_ID=3
order by COUNTRY_NAME;

select * from COUNTRIES
where REGION_ID=1
order by COUNTRY_NAME desc;