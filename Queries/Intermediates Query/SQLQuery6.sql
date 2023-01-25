SELECT *
FROM (
	SELECT  C.CompanyName, (SUM(OD.UnitPrice) * Sum(OD.Quantity)) Sales
	FROM dbo."Order Details" OD 
	LEFT JOIN dbo.Orders O on OD.OrderID = O.OrderID
	LEFT JOIN dbo.Products P on OD.ProductID = P.ProductID
	LEFT JOIN dbo.Customers C on O.CustomerID = C.CustomerID
	WHERE YEAR(O.OrderDate) = 1997
	GROUP BY C.CompanyName
	
	) AOS
WHERE Sales >500
ORDER BY 2 DESC