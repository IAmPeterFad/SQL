--Window Rank Function

--Rank the orders based on their sales from highest to lowest

select OrderID,Sales,
row_number() over(order by Sales desc) SalesRank_Row,
rank() over(order by Sales desc) SalesRank_Rank,
dense_rank() over(order by Sales desc) SalesRank_Dense
from SalesDB.Sales.Orders

--Find the top highest sales for each product

select*
from(
	select OrderID,ProductID,Sales,
	row_number() over(partition by ProductID order by Sales Desc) RankByProduct
	from SalesDB.Sales.Orders
)t where RankByProduct = 1

--Find the lowest two customers based on their total sales

select*
from(
	select CustomerID,
	sum(Sales) TotalSales,
	rank() over(order by Sum(Sales)) RankCustomers
	from SalesDB.Sales.Orders
	group by CustomerID
)t where RankCustomers <= 2