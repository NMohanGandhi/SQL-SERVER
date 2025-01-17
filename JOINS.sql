--- # JOIN Operations in SQL

--- ## Table Definitions

-- ### Sample Data for T1
-- | ID   |
-- |------|
-- | 1    |
-- | 1    |
-- | 2    |
-- | NULL |
-- | NULL |

-- ### Sample Data for T2
-- | ID   |
-- |------|
-- | 1    |
-- | 3    |
-- | NULL |

-- Create table T1 with sample data
CREATE TABLE T1(
	ID INT
);

INSERT INTO T1 VALUES(1),
				 (1),
				 (2),
				 (NULL),
				 (NULL);

-- Create table T2 with sample data
CREATE TABLE T2(
	ID INT
);

INSERT INTO T2 VALUES(1),
				 (3),
				 (NULL);

-- Display data from both tables
SELECT * FROM T1;
SELECT * FROM T2;

--- ## Join Definitions and Examples

-- ### INNER JOIN
-- Retrieves matching records from both tables based on the join condition.
-- This join excludes records with no match in either table.
SELECT * FROM T1 INNER JOIN T2 ON T1.ID = T2.ID;

-- ### LEFT JOIN
-- Retrieves all records from the left table (T1) and the matching records from the right table (T2).
-- If there is no match, the result will include NULLs for the right table's columns.
SELECT T1.ID, T2.ID FROM T1 LEFT JOIN T2 ON T1.ID = T2.ID;

-- ### RIGHT JOIN
-- Retrieves all records from the right table (T2) and the matching records from the left table (T1).
-- If there is no match, the result will include NULLs for the left table's columns.
SELECT * FROM T1 RIGHT JOIN T2 ON T1.ID = T2.ID;

-- ### FULL JOIN
-- Combines the results of INNER JOIN, LEFT JOIN, and RIGHT JOIN.
-- Retrieves all records from both tables, with NULLs for non-matching records in either table.
SELECT * FROM T1 FULL JOIN T2 ON T1.ID = T2.ID;

-- ### CROSS JOIN
-- Produces a Cartesian product by combining every record in the first table with every record in the second table.
-- This join does not require a condition and results in all possible combinations.
SELECT * FROM T1 CROSS JOIN T2;
