--Set Operator
--Union
--Combine the data from employees and customers into one table

select FirstName,LastName 
from sales.Customers
union 
select FirstName,LastName 
from sales.Employees

--Union all
--Combine the data from employees and customers into one table, including duplicate

select FirstName, LastName from sales.Employees
union all
select FirstName, LastName from sales.Customers

--Except
--Find the employees who are not customers at the same times

select FirstName, LastName from sales.Employees
except
select FirstName, LastName from sales.Customers

--Intersect
--Find the employees who are also customers

select FirstName, LastName from sales.Employees
intersect
select FirstName, LastName from sales.Customers

--Orders data are store in seperate tables combine all orders into one report without duplicate

select
'Order' as SourceTable,
[OrderID],[ProductID],[CustomerID],[SalesPersonID],[OrderDate],[ShipDate],[OrderStatus],
[ShipAddress],[BillAddress],[Quantity],[Sales],[CreationTime]
from Sales.Orders
union
select
'OrderArchive' as SourceTable,
[OrderID],[ProductID],[CustomerID],[SalesPersonID],[OrderDate],[ShipDate],[OrderStatus],
[ShipAddress],[BillAddress],[Quantity],[Sales],[CreationTime]
from Sales.OrdersArchive
order by OrderID