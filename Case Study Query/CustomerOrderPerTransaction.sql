SELECT OS.OrderID, O.OrderDate, CAT.CategoryName, C.CompanyName, C.ContactTitle, C.Country,
		TotalQ, TotalSalesAfterDc, (TotalSalesAfterDc / TotalQ) PricePoint, 
	CASE 
		WHEN O.OrderDate != CI.FirstPurchase THEN 'OLD'
		WHEN O.OrderDate = CI.FirstPurchase THEN 'NEW'
	END AS RetentionStats
FROM (SELECT OD.OrderID, OD.ProductID, 
		SUM(Quantity) TotalQ, ROUND(sum(((UnitPrice * Quantity) * (1-Discount))),2) TotalSalesAfterDc
FROM dbo."Order Details" OD GROUP BY OD.OrderID, OD.ProductID) OS
LEFT JOIN dbo.Orders O ON OS.OrderId = O.OrderID
LEFT JOIN Customers C ON O.CustomerID = C.CustomerID
LEFT JOIN Products P on OS.ProductID = P.ProductID
LEFT JOIN  Categories CAT on P.CategoryID = CAT.CategoryID
LEFT JOIN (SELECT 
				CustomerID,
				MIN(O.OrderDate) FirstPurchase
			FROM Orders O
			GROUP BY CustomerID) CI ON O.CustomerID = CI.CustomerID

