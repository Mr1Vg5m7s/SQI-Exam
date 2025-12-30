--1
SELECT C.FullName, COUNT(C.CustomerID) AS УникальныХПокупателеЙ
FROM Sales S
JOIN Customers C ON S.CustomerID = C.CustomerID
GROUP BY C.FullName;


--2
SELECT P.ProductType AS ВидТовара, AVG(P.SalePrice) AS СредняяЦена
FROM Products P
WHERE P.ProductType = 'Взуття'  
GROUP BY P.ProductType;

--3 - ?
SELECT S.SaleDate AS ДатаПродажи, AVG(SI.SalePrice) AS СредняяЦенаПродажи
 FROM Sales S
JOIN SaleItems SI ON S.SaleID = SI.SaleID
GROUP BY S.SaleDate

--4
SELECT TOP 1 P.Name, P.ProductType, SI.SalePrice, S.SaleDate
FROM Sales S
JOIN SaleItems SI ON S.SaleID = SI.SaleID
JOIN Products P ON SI.ProductID = P.ProductID
ORDER BY S.SaleDate DESC

--5
SELECT TOP 1 P.Name, P.ProductType, SI.SalePrice, S.SaleDate
FROM Sales S
JOIN SaleItems SI ON S.SaleID = SI.SaleID
JOIN Products P ON SI.ProductID = P.ProductID
ORDER BY S.SaleDate ASC

--6
--7

SELECT FullName, BirthDate
FROM Customers
WHERE YEAR(GETDATE()) - YEAR(BirthDate) = 45

