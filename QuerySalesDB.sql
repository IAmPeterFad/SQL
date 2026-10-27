use SalesDB
/*Task: using salesDB retrieve a list of all orders, along with 
the related customers, product, employee details. For each order display:
order id, customer's name, product name, sales, price, sales person's name"*/


select* from SalesDB.Sales.Orders
select* from SalesDB.Sales.OrdersArchive
select* from SalesDB.Sales.Customers
select* from SalesDB.Sales.Employees
select* from SalesDB.Sales.Products

select o.OrderID,c.FirstName,c.LastName,p.Product,o.sales,p.Price,e.FirstName
from SalesDB.Sales.Orders as o
left join SalesDB.Sales.Customers as c
on o.CustomerID = c.CustomerID
left join SalesDB.Sales.Employees as e
on o.SalesPersonID = e.EmployeeID
left join SalesDB.Sales.Products as p
on o.ProductID = p.ProductID



