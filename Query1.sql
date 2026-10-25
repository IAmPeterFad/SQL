USE MyDatabase
-- Retrieve All Customers Data

/*select*
from customers*/

-- Retrieve first_name,country and score columns

/*select first_name,country,score
from customers*/

--Retrieve customers with a score not equal to 0

/*select*
from customers
where score != 0*/

--Retrieve customers from germany

/*select first_name,country
from customers
where country = 'Germany'*/

--Retrieve all customers and sort the results by the highest score

/*select*
from customers
order by score desc --asc*/

-- Sort by the country and then by the highest score

/*select*
from customers
order by country asc,score desc*/

--Find the total score of each country

select country, sum(score) as Total
from customers
group by country

--Find the total score and total number of customers for each country

select country, sum(score) as Total, count(id) as Total_customers
from customers
group by country