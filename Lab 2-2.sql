USE AdventureWorks2012;

/*
Product ID, Name, Selling Start Date for products that were sold after 01/01/2007 and have the color black and ordered by selling start date
*/
select P.ProductID,P.Name,CAST(P.SellStartDate AS date) AS SellStartDate
from Production.Product P
where P.SellStartDate > '01/01/2007' AND P.Color LIKE 'black'
ORDER BY SellStartDate ASC

/*
Customer ID, Account Number, Oldest Order Date and total number of orders for each customer
*/
select S.CustomerID, S.AccountNumber, MIN(S.OrderDate) as OldestDate, COUNT(S.CustomerID) as TotalOrders
from Sales.SalesOrderHeader S
GROUP BY S.CustomerID, S.AccountNumber
ORDER BY TotalOrders DESC

/*
Product ID, Name and List Price for Products that have the highest list price
*/
select P.ProductID, P.Name, P.ListPrice
from Production.Product P
where P.ListPrice = (
	select MAX(P.ListPrice)
	from Production.Product P
	)


/*
Product ID, Name, TotalQuantity grouped by ProductID, Name and TotalQuantity greater than 3000 and having a descending order by TotalQuantity
*/
select P.ProductID, P.Name, SUM(S.OrderQty) as TotalQuantity
from Production.Product P,Sales.SalesOrderDetail S
where P.ProductID = S.ProductID
GROUP BY P.ProductID, P.Name
HAVING SUM(S.OrderQty) > 3000
ORDER BY SUM(S.OrderQty) DESC

/*
CustomerID, AccountNumber for customers who have never ordered before
*/
select SC.CustomerID, Sc.AccountNumber
from Sales.Customer SC LEFT JOIN Sales.SalesOrderHeader SH on SC.CustomerID = SH.CustomerID
WHERE SH.CustomerID IS NULL

/*
CustomerID, FirstName, LastName, EmailAddress ordered by CustomerID
*/

select SC.CustomerID, PP.FirstName, PP.LastName, EA.EmailAddress
from Person.Person PP, Person.EmailAddress EA, Sales.Customer SC
where PP.BusinessEntityID = SC.PersonID AND SC.PersonID = EA.BusinessEntityID
ORDER BY SC.CustomerID ASC