--SQL FUNCTIONS
use MyDatabase

--CONCAT
--Show a list of customers' firstname togetheir with their country in one column.

select first_name, country, 
CONCAT(first_name, '-', country) as name_country
from customers

--Lower case
--Transform the customers firstname to lowercase

SELECT lower(first_name), score
FROM customers

--Upper case
--Transform the customers firstname to uppercase

select upper(first_name)
from customers

--Trim 
--Find customers whose first name contain leading or trailing spaces

select 
	first_name,
	len(first_name) len_name,
	len(trim(first_name)) as len_trim_name
from customers
where first_name != trim(first_name)


