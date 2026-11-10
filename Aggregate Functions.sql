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
from MyDatabase.dbo.orders
group by customer_id

--Windows Functions
--Find the total sales across all orders

select sum(Sales) TotalSales
from SalesDB.Sales.Orders

--Find total sales for each product

select
ProductID,
sum(Sales) TotalSales
from SalesDB.Sales.Orders
group by ProductID

--Find the total sales for each product
--Additionally provide details such as orderid and orderdate

select
OrderID,
OrderDate,
ProductID,
sum(Sales) over(partition by productid) TotalSalesByProduct
from SalesDB.Sales.Orders

--Window Functions Syntax

--Find the total sales across all orders
--Additionaly provide details such as orderid and orderdate

select OrderID,OrderDate,
sum(sales) over() TotalSales
from SalesDB.Sales.Orders

--Find the total sales across all orders
--Find the total sales for each products
--Additionaly provide details such as orderid and orderdate

select OrderID,OrderDate,ProductID,sales,
sum(sales) over() as TotalSales,
sum(sales) over(partition by ProductID) TotalSalesByProduct
from SalesDB.Sales.Orders

--Find the total sales for each combination of product and order status

select ProductID,OrderStatus,sales,
sum(sales) over(partition by ProductID, OrderStatus) SalesByProductAndStatus
from SalesDB.Sales.Orders

--OrderBy

--Rank each orders based on their sales from highest to the lowest
--Additionally provide details such as orderid, orderdate

select OrderID,OrderDate,Sales,
rank() over(order by Sales desc) RankSales
from SalesDB.Sales.Orders

select
OrderID,
OrderDate,
OrderStatus,
Sales,
sum(Sales) over(partition by OrderStatus order by OrderDate 
rows between current row and 2 following) TotalSales
from SalesDB.Sales.Orders