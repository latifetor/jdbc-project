select * from COUNTRIES;

/*
LIKE
    - Percent( % )      for matching any sequence of characters. (0 or more)
    - Underscore ( _ )  for matching any single character.
    - contains
    - startswith
    - endswith
*/

-- STARTS WITH
-- Get all countries where country_name starts with 'A';
    select * from COUNTRIES
    where COUNTRY_NAME like 'A%';

-- ENDS WITH
-- Get me all countries where country_name ends with 'a';
    select * from COUNTRIES
    where COUNTRY_NAME like '%a';

-- STARTS WITH and END WITH
-- Get me all countries where country_name starts with 'A' and ends with 'a'
    select * from COUNTRIES
    where COUNTRY_NAME like 'A%a';

-- Get me all countries where country_name starts with 'A' OR ends with 'a';
    select * from COUNTRIES
    where COUNTRY_NAME like 'A%' or COUNTRY_NAME like '%a';

-- CONTAINS
-- Get all countries where country_names contains 'b'
    select * from COUNTRIES
    where COUNTRY_NAME like '%b%';

-- Get all country where country_names contains 'ca'
    select * from COUNTRIES
    where COUNTRY_NAME like '%ca%';

-- Get me all countries where country_names ends with 'a' and have 6 letters
-- underscore ( _ ) represent each single character
    select * from COUNTRIES
    where COUNTRY_NAME like '_____a';

-- Get me all countries where country_names have 5th letter is 'a'
    select * from COUNTRIES
    where COUNTRY_NAME like '____a%';


