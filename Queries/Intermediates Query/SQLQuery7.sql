SELECT Order_month, ProductName
FROM(
	SELECT *, ROW_NUMBER() OVER(PARTITION BY Order_month ORDER BY Sales DESC) Sales_Rank
		FROM (
			SELECT MONTH(O.OrderDate) Order_month, 
					P.ProductName, 
					(SUM(OD.UnitPrice) * Sum(OD.Quantity)) Sales
			FROM dbo."Order Details" OD 
			LEFT JOIN dbo.Orders O on OD.OrderID = O.OrderID
			LEFT JOIN dbo.Products P on OD.ProductID = P.ProductID
			WHERE YEAR(O.OrderDate) = 1997
			GROUP BY MONTH(O.OrderDate), P.ProductName
			) PS ) Sr
WHERE Sales_Rank <= 5