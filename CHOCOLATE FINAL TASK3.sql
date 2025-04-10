-- CREATE DATABASE AND TABLE
CREATE DATABASE ChocolateSalesDB;
USE ChocolateSalesDB;

CREATE TABLE ChocolateSales (
    OrderID INT PRIMARY KEY,
    Country VARCHAR(100),
    Product VARCHAR(100),
    Category VARCHAR(100),
    Sales DECIMAL(10,2),
    Boxes INT,
    OrderDate DATE
);
-- INSERT SAMPLE DATA
INSERT INTO ChocolateSales (OrderID, Country, Product, Category, Sales, Boxes, OrderDate)
VALUES
(1, 'USA', 'Dark Chocolate', 'Premium', 1500.00, 30, '2023-01-10'),
(2, 'Canada', 'Milk Chocolate', 'Standard', 1200.00, 25, '2023-01-15'),
(3, 'Germany', 'White Chocolate', 'Standard', 800.00, 18, '2023-02-01'),
(4, 'USA', 'Milk Chocolate', 'Standard', 1600.00, 35, '2023-02-15'),
(5, 'Canada', 'Dark Chocolate', 'Premium', 2000.00, 40, '2023-03-01');


-- BASIC SELECT WITH FILTERING
SELECT * FROM ChocolateSales WHERE Country = 'USA';


-- GROUP BY ABD AGGREGATION
SELECT Country, SUM(Sales) AS TotalSales, AVG(Boxes) AS AvgBoxes
FROM ChocolateSales
GROUP BY Country;

-- CREATE PRODUCTDETAILS TABLE FOR JOIN
CREATE TABLE ProductDetails (
    Product VARCHAR(100) PRIMARY KEY,
    Brand VARCHAR(100),
    Rating INT
);

INSERT INTO ProductDetails (Product, Brand, Rating)
VALUES
('Dark Chocolate', 'ChocoLux', 5),
('Milk Chocolate', 'SweetTreats', 4),
('White Chocolate', 'SnowDelight', 3);

-- INNER JOIN
SELECT cs.Product, cs.Sales, pd.Brand, pd.Rating
FROM ChocolateSales cs
INNER JOIN ProductDetails pd ON cs.Product = pd.Product;

-- SUBQUERY EXAMPLE
SELECT *
FROM ChocolateSales
WHERE Sales > (
    SELECT AVG(Sales) FROM ChocolateSales
);
-- CREATE A VIEW
CREATE VIEW CountrySalesView AS
SELECT Country, SUM(Sales) AS TotalSales
FROM ChocolateSales
GROUP BY Country;


-- USAGE
SELECT * FROM CountrySalesView;

-- ADD INDEXES FOR OPTIMIZATION
CREATE INDEX idx_country ON ChocolateSales(Country);
CREATE INDEX idx_product ON ChocolateSales(Product);