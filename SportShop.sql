/* ===== СОЗДАНИЕ БАЗЫ ДАННЫХ ===== */
CREATE DATABASE SportShop;
GO

USE SportShop;
GO

/* ===== ТАБЛИЦА ТОВАРОВ ===== */
CREATE TABLE Products (
    ProductID INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100),
    ProductType NVARCHAR(50),
    QuantityInStock INT,
    CostPrice MONEY,
    Manufacturer NVARCHAR(100),
    SalePrice MONEY
);

/* ===== ТАБЛИЦА СОТРУДНИКОВ ===== */
CREATE TABLE Employees (
    EmployeeID INT IDENTITY PRIMARY KEY,
    FullName NVARCHAR(100),
    Position NVARCHAR(50),
    HireDate DATE,
    Gender NVARCHAR(10),
    Salary MONEY
);

/* ===== ТАБЛИЦА КЛИЕНТОВ ===== */
CREATE TABLE Customers (
    CustomerID INT IDENTITY PRIMARY KEY,
    FullName NVARCHAR(100),
    Email NVARCHAR(100),
    Phone NVARCHAR(20),
    Gender NVARCHAR(10),
    BirthDate DATE,
    RegistrationDate DATE,
    DiscountPercent INT,
    IsSubscribed BIT
);

/* ===== ТАБЛИЦА ПРОДАЖ ===== */
CREATE TABLE Sales (
    SaleID INT IDENTITY PRIMARY KEY,
    SaleDate DATE,
    EmployeeID INT,
    CustomerID INT NULL,
    CONSTRAINT FK_Sales_Employee FOREIGN KEY (EmployeeID)
        REFERENCES Employees(EmployeeID),
    CONSTRAINT FK_Sales_Customer FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
);

/* ===== ТАБЛИЦА ДЕТАЛЕЙ ПРОДАЖ ===== */
CREATE TABLE SaleItems (
    SaleItemID INT IDENTITY PRIMARY KEY,
    SaleID INT,
    ProductID INT,
    Quantity INT,
    SalePrice MONEY,
    CONSTRAINT FK_SaleItems_Sale FOREIGN KEY (SaleID)
        REFERENCES Sales(SaleID),
    CONSTRAINT FK_SaleItems_Product FOREIGN KEY (ProductID)
        REFERENCES Products(ProductID)
);

/* ===== ДАННЫЕ: ТОВАРЫ ===== */
INSERT INTO Products VALUES
('Футболка Nike', 'Одяг', 50, 300, 'Nike', 600),
('Кросівки Adidas', 'Взуття', 30, 1200, 'Adidas', 2000),
('Шорти Puma', 'Одяг', 40, 400, 'Puma', 800),
('Кросівки Nike Air', 'Взуття', 20, 1500, 'Nike', 2500);

/* ===== ДАННЫЕ: СОТРУДНИКИ ===== */
INSERT INTO Employees VALUES
('Іваненко Петро', 'Продавець', '2021-03-10', 'Чоловік', 15000),
('Коваль Олена', 'Старший продавець', '2020-06-01', 'Жінка', 18000);

/* ===== ДАННЫЕ: КЛИЕНТЫ ===== */
INSERT INTO Customers VALUES
('Сидоренко Андрій', 'andriy@mail.com', '0501112233', 'Чоловік', '1980-05-12', '2019-04-10', 10, 1),
('Петренко Марія', 'maria@mail.com', '0673334455', 'Жінка', '1979-09-20', '2018-02-15', 15, 0),
('Бондар Ігор', 'ihor@mail.com', '0937778899', 'Чоловік', '1995-01-05', '2023-07-01', 5, 1);

/* ===== ДАННЫЕ: ПРОДАЖИ ===== */
INSERT INTO Sales VALUES
('2024-01-10', 1, 1),
('2024-02-05', 2, 2),
('2024-03-01', 1, NULL);

/* ===== ДАННЫЕ: ПРОДАННЫЕ ТОВАРЫ ===== */
INSERT INTO SaleItems VALUES
(1, 1, 2, 2000),
(1, 3, 1, 800),
(2, 2, 1, 2500),
(3, 1, 1, 600);
