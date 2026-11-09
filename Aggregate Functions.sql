--Aggregate Functions

select customer_id,
--Find the total number of orders
count(*) as TotalOrders,
--Find the total sales of all orders
sum(sales) as TotalSales,
--Find the average sales of all orders
avg(sales) as AvgSales,
--Find the highest sales of all orders
max(sales) as HighestSales,
--Find the lowest sales of all orders
min(sales) as LowestSales
from orders
group by customer_id