--Case Statement

/* Create report showing totals sales for each of the following categories:
High(sales over 50), medium(sales 21-50), low(sales 20 or less)
sort the categories from the highest to the lowest*/

select
Category,
sum(Sales) as TotalSales
from(
select OrderID, Sales,
case 
when Sales > 50 then 'High'
when Sales > 20 then 'Medium' 
else 'Low'
end as Category
from SalesDB.Sales.Orders
)t
group by category
order by TotalSales desc

--Retrieve employee details with gender display as full text

select EmployeeID,FirstName,LastName,
case 
	when Gender = 'M' then 'Male'
	when Gender = 'F' then 'Female'
	else 'Not available'
end as Gender
from SalesDB.Sales.Employees

--Retrieve customers details with abbrevaited values

select CustomerID,FirstName,LastName,Country,
case
	when country = 'Germany' then 'DE'
	when country = 'USA' then 'US'
	else 'n/a'
end CountryAbrr,
case Country
	when 'Germany' then 'DE'
	when 'USA' then 'US'
	else 'n/a'
end CountryAbrr2
from SalesDB.Sales.Customers

select distinct country
from SalesDB.Sales.Customers