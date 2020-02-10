use Misal_Vighnesh_Test;

--FUNCTION TO RETURN THE TOTAL SALES VALUE FOR A GIVEEN MONTH OF A YEAR

ALTER FUNCTION dbo.GET_TOTAL_SALES(@Month1 int, @Year1 int) 
RETURNS int  
AS  
BEGIN    
    DECLARE @Total int    
    SELECT @Total = Coalesce(Sum(TotalDue),0)
    FROM AdventureWorks2008R2.Sales.SalesOrderHeader
    where month(OrderDate) = @Month1 and year(Orderdate) = @Year1
    RETURN @Total
End;

select dbo.GET_TOTAL_SALES(7,2005);

--CREATE THE REQUIRED TABLE IN MY DATABASE

CREATE TABLE DateRange
(
DateID INT IDENTITY, 
DateValue DATE,
Month INT,
DayOfWeek INT
);

--CREATE A PROCEDURE TO AUTO POPULATE A TABLE
ALTER Procedure procedure1(@StartDate DATE, @NumberofConsecutiveDays INT) AS
BEGIN
	DELETE from DateRange;
	BEGIN
    DECLARE @Counter INT = 0;
	WHILE (@Counter < @NumberofConsecutiveDays)
    BEGIN
        INSERT INTO DateRange
        VALUES (
				@StartDate,
                DATEPART(MONTH, @StartDate), 
                DatePart(DAY, @StartDate) );
		SET @Counter += 1;
        SET @StartDate = DATEADD(day,1, @StartDate);
	END
END
END;

--EXEC THE PROCEDURE BY SUPPLYING THE REQUIRED ARGUMENTS
EXEC procedure1 @StartDate = '2019-11-10', @NumberofConsecutiveDays = 400;
select * from DateRange;
