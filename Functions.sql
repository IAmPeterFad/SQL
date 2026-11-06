--SQL FUNCTIONS
use MyDatabase

--CONCAT
--Show a list of customers' firstname togetheir with their country in one column.

select first_name, country, 
CONCAT(first_name, '-', country) as name_country
from customers

--Lower case
--Transform the customers firstname to lowercase

SELECT lower(first_name), score
FROM customers

--Upper case
--Transform the customers firstname to uppercase

select upper(first_name)
from customers

--Trim 
--Find customers whose first name contain leading or trailing spaces

select 
	first_name,
	len(first_name) len_name,
	len(trim(first_name)) as len_trim_name
from customers
where first_name != trim(first_name)

--Replace
--Remove dashes(-) from a phone number

select '123-456-7890' as Phone,
replace('123-456-7890','-', '') as clean_phone

--Replace the file extence from .txt to .csv

select 'report.txt' as file_name,
replace('report.txt', '.txt', '.csv') as new_filename

--Calculate the length of each customer's first name

select first_name, len(first_name) as length
from customers

--Retrieve the first two characters of each first name

select left(trim(first_name), 2) 
from customers

--Retrieve the last two characters of each first name

select first_name, right(first_name, 2) as last_2
from customers

--Substring
--Retrieve the list of customers first name after removing the first character

select first_name, substring(trim(first_name),2) --len(trim(first_name)) -1 
from customers

--Numbers Functions

select 3.516 as Number,
round(3.516, 1) as Round1,
round(3.516, 2) as Round2,
round(3.516, 0) as Round0

select -10,
abs(-10),
abs(10)

--Date and Time Function

select 
OrderID,
CreationTime,
'2026-10-31' HardCoded,
getdate() Today
from SalesDB.Sales.Orders

select
OrderID,
CreationTime,
--datetrunc
datetrunc(day, CreationTime) as Day_DT,
datetrunc(minute, CreationTime) as minute_DT,
--datename
datename(month,CreationTime) as Month_Name,
datename(weekday, CreationTime) as Day_Name,
--Datepart
datepart(quarter, CreationTime) as Quarter,
datepart(weekday, CreationTime) as Weekday,
datepart(week, CreationTime) as Week,
datepart(hour, CreationTime) as Hour,
year(CreationTime) as Year,
month(CreationTime) as Month,
day(CreationTime) as Day
from SalesDB.Sales.Orders

select
datetrunc(month,CreationTime) as CreationTime,
count(*) as GP
from SalesDB.Sales.Orders
group by datetrunc(month,CreationTime)

--End of month

select
OrderID,
CreationTime,
eomonth(CreationTime) as EndOfMonth,
cast(datetrunc(month, CreationTime) as date) as StartOfMonth
from salesDB.sales.orders

--How many order were placed each years?

select year(OrderDate) as year, count(*) NrOfOrders
from SalesDB.Sales.Orders
group by year(OrderDate)

--How many order were placed each month?

select datename(month, OrderDate) as Month, count(*) as NrOfOrders
from SalesDB.Sales.Orders
group by datename(month, OrderDate)

--Show all orders that were placed during the month of february

select OrderID, datename(month, OrderDate) as Month, OrderStatus, Quantity
from SalesDB.Sales.Orders
where month(OrderDate) = 2 --Always use numbers to filter
--where datename(month, OrderDate) = 'February'