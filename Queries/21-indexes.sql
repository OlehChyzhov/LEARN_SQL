/*
-------------------------------------
Clustered Index:
-------------------------------------
1. Rows are sorted based on the column the clustered index is created on.
2. Creates a B-TREE structure:
   - Data Pages -> Leaf nodes (store the actual data).
   - Index Pages -> Intermediate nodes (store key ranges and pointers to the next level in the tree, helping quickly locate data).


-------------------------------------
Clustered Index Structure (B-Tree):
-------------------------------------
            [Root Index Page]
                   |
                1:300
                   |
            -------------------
           |                   |
       [Index Page]       [Index Page]
           1:200               1:201
        (Keys 1–10)         (Keys 11–20)
           |                   |
      ------------        ------------
     |            |      |            |
 [Data Page]  [Data Page] [Data Page] [Data Page]
   1:100        1:101       1:102       1:103
 (Keys 1–5)   (Keys 6–10)  (Keys 11–15) (Keys 16–20)


- Index Pages: Intermediate nodes (store key ranges & pointers).
- Data Pages: Leaf nodes (store actual data rows).


-------------------------------------
Non-Clustered Index:
-------------------------------------

1. The actual data pages are not changed (rows remain in their original order).
2. It creates index pages that store:
   - The indexed column values (sorted).
   - Pointers (addresses) to the actual rows in the data pages (these pointers are stored at the leaf level).
3. The B-Tree structure is otherwise the same as in the clustered index,
   but the leaves contain references to data rows instead of the data itself.
*/

-- CREATE [CLUSTERED | NONCLUSTERED] INDEX index_name ON table_name (column1, column2, ...)


----------------------------------- CLUSTERED and NONCLUSTERED Indexes ---------------------------------------

-- Creates a clustered index on CustomerID (physically sorts data by CustomerID)
CREATE CLUSTERED INDEX idx_DbCustomers_CustomerID ON Sales.DbCustomers (CustomerID);

-- Creates a non-clustered index on LastName (creates separate index structure with pointers to data)
CREATE NONCLUSTERED INDEX idx_DbCustomers_LastName ON Sales.DbCustomers (LastName);

-- Uses non-clustered index on LastName to locate rows with 'Brown'
SELECT *
FROM Sales.DbCustomers
WHERE LastName = 'Brown';


--------------------------------------- Composite Index ---------------------------------------

-- Creates composite index on (Country, Score) (first sorted by Country, then by Score)
CREATE INDEX idx_DbCustomers_CountryScore ON Sales.DbCustomers (Country, Score);

-- Query uses both columns in the same order as the index is created
SELECT *
FROM Sales.DbCustomers
WHERE Country = 'USA' AND Score > 500;

-- This query also uses the index (the leftmost column 'Country' is included)
SELECT *
FROM Sales.DbCustomers
WHERE Country = 'USA';


--------------------------------------- Columnstore Index ---------------------------------------
