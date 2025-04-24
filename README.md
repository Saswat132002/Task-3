# Task-3
# 🛒 SQL for Data Analysis - Ecommerce Dataset

This project demonstrates how to use SQL for data analysis using an eCommerce dataset. It covers key SQL concepts such as filtering, sorting, joining, subqueries, aggregations, views, and query optimization techniques.

## 📁 Project Structure

- `ecommerce_analysis.sql`: Contains all SQL queries written for analysis.
- `wa_ecommerce_db.sql`: Raw SQL dump of the eCommerce database (import into MySQL/PostgreSQL/SQLite).
- `screenshots/`: Folder containing query output screenshots for visual verification.
- `README.md`: Project documentation (you're reading it!).

## 🧰 Tools Used

- SQL (Tested on SQLite for demo)
- DBMS: MySQL / PostgreSQL / SQLite
- Optional: DB Browser for SQLite / MySQL Workbench

## 🔍 Key SQL Concepts Covered

- `SELECT`, `WHERE`, `ORDER BY`, `GROUP BY`
- `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`
- Subqueries
- Aggregate functions: `SUM`, `AVG`, `COUNT`
- Views for reusable queries
- Indexing & query optimization (suggested)

## 🔎 Sample Queries

```sql
-- Get products with price over 100, ordered by price descending
SELECT ProductID, ProductName, ProductPrice
FROM products
WHERE ProductPrice > 100
ORDER BY ProductPrice DESC;

-- Aggregate total revenue by product
SELECT p.ProductName, COUNT(*) AS TotalOrders, SUM(od.DetailPrice) AS TotalRevenue
FROM orderdetails od
JOIN products p ON p.ProductID = od.DetailProductID
GROUP BY p.ProductName
ORDER BY TotalRevenue DESC;
