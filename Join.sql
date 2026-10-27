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
