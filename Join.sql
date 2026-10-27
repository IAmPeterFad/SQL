use MyDatabase

--JOINING TABLE IN SQL
--Basic No Join
--Retrieve all data from customers and orders in two different result

select* from customers;
select* from orders

--Inner join
/* Get all customers along with their orders,
but only for customers who have placed an order */

select c.id, c.first_name, o.order_id, o.sales
from customers as c
inner join orders as o
on c.id = o.customer_id;

--Left join
--Get all customers along with their orders,including those without orders

select c.id, c.first_name, o.order_id, o.sales
from customers as c
left join orders as o
on id = customer_id;

--Right join
--Get all customers along with their orders including orders without matching customers

select o.customer_id,o.order_id,c.first_name,o.sales 
from customers as c
right join orders as o
on id = customer_id

--Get all customers along with their orders including orders without matching customers using left join

select o.customer_id,o.order_id,c.first_name,o.sales
from orders as o
left join customers as c
on id = customer_id

--Full Join
--Get all customers and all orders, even if there's no match

select c.id,c.first_name,o.order_id,o.sales
from customers as c
full join orders as o
on id = customer_id

--Advanced Join Types
--Left anti join
--Get all customers who haven't place any order

select* from customers
left join orders
on id = customer_id
where customer_id is null

--Right anti join
--Get all orders without matching customers

select* from customers
right join orders
on id = customer_id
where id is null

--Using left join

select* from orders
left join customers
on id = customer_id
where id is null

--Full anti join
--Find customers without orders and orders without customers

select* from customers
full join orders
on id = customer_id
where id is null or customer_id is null

/*Get all customers along with their orders, 
but only for customers who have placed an order without using inner join*/

select* from customers
left join orders
on id = customer_id
where customer_id is not null

--Cross join
--Generate all possible combinations of customers and orders

select* from customers
cross join orders