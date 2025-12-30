CREATE PROCEDURE GetAllProducts
AS
BEGIN
    SELECT * FROM Products;
END;
GO
--EXEC GetAllProducts;

-----------
--2
CREATE PROCEDURE GetProductsByType
    @ProductType NVARCHAR(100)
AS
BEGIN
    SELECT *
    FROM Products
    WHERE ProductType = @ProductType
      AND QuantityInStock > 0;
END;
GO
--EXEC GetProductsByType 'Взуття';
----------
--3
CREATE PROCEDURE Top3OldestCustomers
AS
BEGIN
    SELECT TOP 3 *
    FROM Customers
    ORDER BY RegistrationDate ASC;
END;
GO

----------
--4
CREATE PROCEDURE BestEmployee
AS
BEGIN
    SELECT TOP 1
        E.FullName,
        SUM(SI.Quantity * SI.SalePrice) AS TotalSales
    FROM Employees E
    JOIN Sales S ON E.EmployeeID = S.EmployeeID
    JOIN SaleItems SI ON S.SaleID = SI.SaleID
    GROUP BY E.FullName
    ORDER BY TotalSales DESC;
END;
GO

-------
--5
CREATE PROCEDURE IsManufacturerProductAvailable
    @Manufacturer NVARCHAR(100)
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Products
        WHERE Manufacturer = @Manufacturer
          AND QuantityInStock > 0
    )
        SELECT 'yes' AS Result;
    ELSE
        SELECT 'no' AS Result;
END;
GO
--EXEC IsManufacturerProductAvailable 'Nike';


--6
CREATE PROCEDURE MostPopularManufacturer
AS
BEGIN
    SELECT TOP 1
        P.Manufacturer,
        SUM(SI.Quantity * SI.SalePrice) AS TotalSales
    FROM Products P
    JOIN SaleItems SI ON P.ProductID = SI.ProductID
    GROUP BY P.Manufacturer
    ORDER BY TotalSales DESC;
END;
GO


--7
CREATE PROCEDURE DeleteCustomersAfterDate
    @Date DATE
AS
BEGIN
    DELETE FROM Customers
    WHERE RegistrationDate > @Date;

    SELECT @@ROWCOUNT AS DeletedCount;
END;
GO
EXEC DeleteCustomersAfterDate '2022-01-01';
