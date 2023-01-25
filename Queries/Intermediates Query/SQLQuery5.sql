SELECT Sales_Category, COUNT(OrderID) Orders
FROM (
SELECT 
	CASE 
		WHEN Sales <=100 THEN '1. <=100'
		WHEN Sales <=250 THEN '2. 100<x<=250'
		WHEN Sales <=500 THEN '3. 250<x<=500'
		WHEN Sales >500 THEN '4. >500'
	END AS Sales_Category,
	OrderID
FROM (
	SELECT OrderID, (SUM(UnitPrice) * Sum(Quantity)) Sales
	FROM dbo."Order Details"
	GROUP BY OrderID
	) AOS
) SC
GROUP BY Sales_Category
ORDER BY 1