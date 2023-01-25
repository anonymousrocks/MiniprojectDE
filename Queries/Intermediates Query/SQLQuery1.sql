SELECT MONTH(OrderDate) as 'Order Month', 
		COUNT(DISTINCT(CustomerId)) AS 'Number of Customer'
FROM dbo.Orders
Where Year(OrderDate) = 1997
Group By MONTH(OrderDate)
