USE AdventureWorks2008R2;

SELECT 
	c.CustomerID, 
	c.TerritoryID,
	COUNT(o.SalesOrderid) [Total Orders],
	CASE
		WHEN COUNT(o.SalesOrderid) = 0
		THEN 'No Orders'
		WHEN COUNT(o.SalesOrderid) = 1
		THEN 'One Time'
		WHEN COUNT(o.SalesOrderid) < 5
		THEN 'Regular'
		WHEN COUNT(o.SalesOrderid) < 12
		THEN 'Often'
		ELSE 'Very Often'
		END AS 'ORDER FREQUENCY'
FROM 
	Sales.Customer c
	LEFT OUTER JOIN Sales.SalesOrderHeader o ON c.CustomerID = o.CustomerID
WHERE 
	DATEPART(year, OrderDate) = 2007
GROUP BY 
	c.TerritoryID, c.CustomerID;


	---Q2---
SELECT 
	c.CustomerID,
	c.TerritoryID,
	COUNT(o.SalesOrderid) [Total Orders],
	DENSE_RANK() OVER 
	(PARTITION BY c.TerritoryID ORDER BY COUNT(o.SalesOrderid) DESC) AS Rank
FROM 
	Sales.Customer c
	LEFT OUTER JOIN Sales.SalesOrderHeader o ON c.CustomerID = o.CustomerID
WHERE 
	DATEPART(year, OrderDate) = 2007
GROUP BY 
	c.TerritoryID, c.CustomerID;


	--3--

select MAX(SS.Bonus) AS Max_Bonus_Canada
from Person.StateProvince PS,Sales.SalesPerson SS, HumanResources.Employee HE
where CountryRegionCode = 'CA' AND SS.TerritoryID = PS.TerritoryID AND HE.BusinessEntityID= SS.BusinessEntityID AND HE.Gender = 'M'

--4--
SELECT  t.Color AS Color,t.Total_Qty as Total_Qty,t.Month_No AS Month
FROM (       
   SELECT PP.Color AS Color,SUM(SS.OrderQty) as Total_Qty,MONTH(SH.OrderDate) AS Month_No,
          ROW_NUMBER() OVER (PARTITION BY MONTH(SH.OrderDate) 
                             ORDER BY SUM(SS.OrderQty) DESC) As rn
   FROM Sales.SalesOrderDetail SS, Production.Product PP, Sales.SalesOrderHeader SH
   WHERE SS.ProductID = PP.ProductID AND SS.SalesOrderID = SH.SalesOrderID AND YEAR(SH.OrderDate) = 2007 AND PP.Color IS NOT NULL
   GROUP BY PP.Color, MONTH(SH.OrderDate)) AS t
WHERE t.rn = 1
ORDER BY t.Month_No

--5--
SELECT distinct(SC.CustomerID),(SC.AccountNumber)
FROM Sales.Customer SC, Sales.SalesOrderHeader SH, Sales.SalesOrderDetail SS
WHERE SC.CustomerID = SH.CustomerID AND SS.SalesOrderID = SH.SalesOrderID AND SS.ProductID NOT LIKE '708'
ORDER BY SC.CustomerID ASC

