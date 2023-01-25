SELECT C.CompanyName, C.ContactTitle, C.Country,  
		MIN(O.OrderDate) FirstPurchase, 
		MAX(O.OrderDate) LastPurchase,
		YEAR(MAX(O.OrderDate)) - YEAR(MIN(O.OrderDate)) +1  YearCount,
		DATEDIFF(day, MIN(O.OrderDate), MAX(O.OrderDate))DaysInterval,
		COUNT(OS.OrderID) TotalOrder,
		SUM(OS.TotalSalesAfterDC) TotalPurchase,
		SUM(OS.TotalQ) TotalQ,
		(SUM(OS.TotalQ) / COUNT(OS.OrderID)) QPerOrder,
		ROUND((SUM(OS.TotalSalesAfterDc) / COUNT(OS.OrderID)),2) AvgPerOrder
FROM (SELECT OD.OrderID,
		ROUND(sum(((UnitPrice * Quantity) * (1-Discount))),2) TotalSalesAfterDc,
		SUM(OD.Quantity) TotalQ
FROM dbo."Order Details" OD
Group by OD.OrderID) OS
LEFT JOIN dbo.Orders O ON OS.OrderId = O.OrderID
LEFT JOIN Customers C ON O.CustomerID = C.CustomerID
GROUP BY C.CompanyName, C.ContactTitle, C.Country

