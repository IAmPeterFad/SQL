use MyDatabase
-- Comparison Operators

--Retrieve all customers from germany

select* from customers
where country = 'germany'

--Retrieve all customers who are not from germany

select* from customers
where country != 'germany'

-- Retrieve all customers with a score greater than 500

select* from customers
where score > 500

-- Retrieve all customers with a score of 500 or more.

select* from customers
where score >= 500

-- Retrieve all customers with a score less than 500

select* from customers
where score < 500

-- Retrieve all customers with a score of 500 or less

select* from customers
where score <= 500

--Logical Operators
--Retrieve all customers from USA and have a score greater than 500

select* from customers
where country = 'USA' and score > 500

--Retrieve all customers who are either from USA or have a score greater than 500

select* from customers
where country = 'USA' or score > 500

--Retrieve all customers with a score not less than 500

select* from customers
where not score < 500

--Range Operators 
--Retrieve all customers whose score fall between 100 and 500

select* from customers
where score between 100 and 500

select* from customers
where score >= 100 and score <= 500

--Membership operators
--Retrieve customers from either Germany or USA

select* from customers
where country = 'Germany' or country = 'USA'

select* from customers
where country in ('Germany', 'USA')

--Find all customers whose first name start with M

select* from customers
where first_name like 'M%'

--Find all customers whose first name end with n

select* from customers
where first_name like '%n'

--Find all customers whose first name contain 'r'

select* from customers
where first_name like '%r%'

--Find all customers with first name has 'r' in the third position

select* from customers
where first_name like '__r%'
