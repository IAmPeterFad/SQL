--SQL FUNCTIONS
use MyDatabase

--CONCAT
--Show a list of customers' firstname togetheir with their country in one column.

select first_name +' '+ country 
CONCAT
from customers

--Lower case
--Transform the customers firstname to lowercase

SELECT lower(first_name) as low_name
FROM customers