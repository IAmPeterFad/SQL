--Null Functions

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