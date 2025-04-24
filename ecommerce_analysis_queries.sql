
-- 1. Basic SELECT and WHERE
SELECT ProductID, ProductName, ProductPrice
FROM products
WHERE ProductPrice > 100
ORDER BY ProductPrice DESC;

-- 2. INNER JOIN: products with orderdetails
SELECT p.ProductName, od.DetailPrice
FROM products p
INNER JOIN orderdetails od ON p.ProductID = od.DetailProductID
LIMIT 10;

-- 3. LEFT JOIN: include products with or without orders
SELECT p.ProductName, od.DetailPrice
FROM products p
LEFT JOIN orderdetails od ON p.ProductID = od.DetailProductID
ORDER BY p.ProductName
LIMIT 10;

-- 4. Subquery: Find products more expensive than average
SELECT ProductName, ProductPrice
FROM products
WHERE ProductPrice > (
    SELECT AVG(ProductPrice) FROM products
)
ORDER BY ProductPrice DESC;

-- 5. Aggregate Function: Total sales per product
SELECT p.ProductName, COUNT(*) AS TotalOrders, SUM(od.DetailPrice) AS TotalRevenue
FROM orderdetails od
JOIN products p ON p.ProductID = od.DetailProductID
GROUP BY p.ProductName
ORDER BY TotalRevenue DESC
LIMIT 10;

-- 6. Create a view for product revenue
CREATE VIEW ProductRevenue AS
SELECT p.ProductID, p.ProductName, SUM(od.DetailPrice) AS Revenue
FROM orderdetails od
JOIN products p ON p.ProductID = od.DetailProductID
GROUP BY p.ProductID, p.ProductName;

-- 7. Index suggestion (write only, does not execute in SQLite)
-- CREATE INDEX idx_detailproductid ON orderdetails(DetailProductID);
