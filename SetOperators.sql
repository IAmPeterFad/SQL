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

