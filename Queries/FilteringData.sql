-- NOT
SELECT * 
FROM customers
WHERE NOT country = 'USA';

-- BETWEEN
SELECT * FROM customers WHERE score BETWEEN 300 AND 600;

-- IN / NOT IN
Select * FROM customers WHERE country IN ('USA', 'Germany'); -- Use this insead of multiple 'OR' operators
Select * FROM customers WHERE country NOT IN ('USA', 'Germany');

-- LIKE
SELECT * FROM customers WHERE first_name LIKE '%r%';
SELECT * FROM customers WHERE first_name LIKE '__r%';