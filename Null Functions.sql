--Null Functions

select* from SalesDB.Sales.Customers

select
customerid,
firstName,
isnull(lastname, '') LastName,
coalesce(score, 0) as Score
from SalesDB.Sales.Customers

--Find the average scores of the customers

select
customerid,
score,
coalesce(score, 0) Score2,
avg(Score) over() AvgScore1,
avg(coalesce(score, 0)) over() AvgScore2
from SalesDB.Sales.Customers

/*Display the full name of customers in a single field
by merging their first and last names, and add 10 bonus points to each customer's score*/

select 
customerID,
concat(FirstName, ' ', LastName) as FullName,
coalesce(score, 0) + 10 ScoreWithBonus
from SalesDB.Sales.Customers

select*
from SalesDB.Sales.Customers

--Sort the customers from the lowest to the highest score with Nulls appearing last

select CustomerID, Score
--case when score is null then 1 else 0 end Flag
from SalesDB.Sales.Customers
order by case when score is null then 1 else 0 end, score asc

--Find the sales price of each order by dividing sales by quality

select
OrderID,
Quantity,
Sales,
Sales/nullif(Quantity, 0) as Prices
from SalesDB.sales.Orders

--Is Null and is not null
--Identify the customers who have no scores

select*
from SalesDB.Sales.Customers
where score is null

--Show a list of customers who have scores

select*
from SalesDB.Sales.Customers
where score is not null

--list all details of customers who have not placed any orders

select
c.CustomerID,
c.FirstName,
c.LastName,
o.OrderID,
o.OrderStatus
from SalesDB.Sales.Customers as c
left join SalesDB.Sales.Orders as o
on c.CustomerID = o.CustomerID
where o.OrderID is null

-- Null || Empty string || Blank space

with orders as (
select 1 id, 'A' Category union
select 2, null union
select 3, '' union
select 4, '  '
)

select*,
datalength(Category) CategoryLen,
--Data policy Null and Empty string
datalength(trim(Category)) policy1,
--Data policy Null only
nullif(trim(Category), '') NullPolicy,
--Data policy Null only
coalesce(nullif(trim(Category), ''), 'unknown') UnknownPolicy
from orders
