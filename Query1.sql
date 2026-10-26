USE MyDatabase
-- Retrieve All Customers Data

select*
from customers

-- Retrieve first_name,country and score columns

select first_name,country,score
from customers

--Retrieve customers with a score not equal to 0

select*
from customers
where score != 0

--Retrieve customers from germany

select first_name,country
from customers
where country = 'Germany'

--Retrieve all customers and sort the results by the highest score

select*
from customers
order by score desc --asc

-- Sort by the country and then by the highest score

select*
from customers
order by country asc,score desc

--Find the total score of each country

select country, sum(score) as Total
from customers
group by country

--Find the total score and total number of customers for each country

select country, sum(score) as Total, count(id) as Total_customers
from customers
group by country

/*Find the average score of each country
Considering customers with a score not equal to zero
and reture only countries with an average score greater than 430*/

select country,avg(score) as avg_score
from customers
where score != 0
group by country
having avg(score) > 430

--Reture unique list of all countries

select distinct
country
from customers

--Retrieve only three customers

select top 3*
from customers

--Retrieve the top three customers with the highest scores

select top 3*
from customers
order by score desc

-- Retrieve the lowest 2 customers based on the score

select top 2*
from customers
order by score asc

--Get the two most recent orders

select top 2*
from orders
order by order_date desc

select
id,
first_name,
'New Cutomers' as customer_type
from customers

--Data Definition Language

/*Create a new table called persons with
columns: id,person_name,birthday and phone*/

create table persons (
id int not null,
person_name varchar(50)not null,
birthday date,
phone varchar(15) not null,
constraint pk_persons primary key (id)
)

select* from persons

--Add a new column called email to the person table

alter table persons
add email varchar(50) not null 

select* from persons

--Remove the column phone from the person table

alter table persons
drop column phone

--Delete table from database

drop table persons

--Data Manipulation

insert into customers(id,first_name,country,score)
values
(6, 'Anna', 'USA', null ),
(7, 'Sam', null, 100)

select* from customers

insert into customers(id, first_name)
values (9, 'Sarah')