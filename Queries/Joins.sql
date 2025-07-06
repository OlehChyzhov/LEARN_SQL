USE MyDatabase;
-- NO JOIN
SELECT * FROM customers;
SELECT * FROM orders;

-- INNER JOIN = JOIN BY DEFAULT
SELECT customers.id, first_name, country, score, order_id, order_date, sales 
FROM customers
INNER JOIN orders ON orders.customer_id = customers.id;

-- LEFT JOIN
SELECT * FROM customers
LEFT JOIN orders ON orders.customer_id = customers.id;

-- RIGHT JOIN
SELECT * FROM customers
RIGHT JOIN orders ON orders.customer_id = customers.id;

-- FULL JOIN
SELECT * FROM customers
FULL JOIN orders ON orders.customer_id = customers.id;

-- LEFT ANTI JOIN: Only unmatching rows
SELECT * FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id
WHERE orders.customer_id IS NULL;

-- RIGHT ANTI JOIN: Only unmatching rows
SELECT * FROM customers
RIGHT JOIN orders ON customers.id = orders.customer_id
WHERE customers.id IS NULL;

-- FULL ANTI JOIN: Only unmatching rows
SELECT * FROM customers
FULL JOIN orders ON customers.id = orders.customer_id
WHERE customers.id IS NULL OR orders.customer_id IS NULL;

-- CROSS JOIN: Every row form the left table with every row from the right table
SELECT * FROM customers
CROSS JOIN orders;

-- MULTIPLE TABLE JOINS
USE SalesDB;

SELECT OrderDate, ShipDate, OrderStatus, ShipAddress, BillAddress, 
Quantity, Sales, CreationTime, FirstName, LastName, Country, Score, Category, Price
FROM Sales.Orders AS o
JOIN Sales.Customers AS c ON o.CustomerID = c.CustomerID
JOIN Sales.Products AS p ON o.ProductID = p.ProductID; 