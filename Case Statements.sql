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