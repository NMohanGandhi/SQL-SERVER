-- DML (Data Manipulation Language)
-- Commands: INSERT, UPDATE, DELETE

-- Definitions:
-- INSERT: The INSERT statement is used to add new rows of data into a table. You can insert single or multiple rows at once and specify the columns into which data is being inserted.
-- UPDATE: The UPDATE statement modifies existing data in a table based on specified conditions.
-- DELETE: The DELETE statement removes rows from a table based on specified conditions. Without a condition, all rows will be deleted.

-- DELETE vs TRUNCATE:
-- DELETE:
-- 1. Removes specific rows based on the WHERE clause.
-- 2. If no WHERE clause is specified, all rows are deleted.
-- 3. DELETE operations can be rolled back if they are part of a transaction.
-- 4. Triggers defined on the table are executed.
-- 5. Slower compared to TRUNCATE because it logs each deleted row individually in the transaction log.

-- TRUNCATE:
-- 1. Removes all rows from a table but retains the table structure.
-- 2. Cannot delete specific rows (no WHERE clause allowed).
-- 3. TRUNCATE is faster as it deallocates the data pages used by the table.
-- 4. Cannot be rolled back if it is not part of a transaction.
-- 5. Triggers are not executed.

-- Example for DELETE:
DELETE FROM EMP WHERE AGE > 30;

-- Example for TRUNCATE:
TRUNCATE TABLE EMP;

-- 1. INSERT
SELECT * FROM EMP;

-- Insert single row with all columns specified
INSERT INTO EMP (EID, ENAME, BASIC_SAL, MOB, GENDER, HAVE_PAN, AGE)
VALUES (1, 'RAM', 10000, 9837487990, 'MALE', 1, 25);

-- Insert multiple rows with all columns specified
INSERT INTO EMP (EID, ENAME, BASIC_SAL, MOB, GENDER, HAVE_PAN, AGE)
VALUES (2, 'SREE', 9000, 8374879901, 'FEMALE', 0, 22),
       (3, 'MOUNIKA', 12000, 7487990190, 'FEMALE', 0, 24);

-- Insert rows without specifying column names (ensure column order matches table structure)
INSERT INTO EMP
VALUES (4, 'BHANU', 14000, 9901123444, 'MALE', 1, 26),
       (5, 'GANESH', 8000, 7487990183, 'MALE', 1, 25),
       (6, 'VENKATESH', 7500, 8879901890, 'MALE', 0, 27);

-- Insert rows specifying only selected columns
INSERT INTO EMP (EID, ENAME, BASIC_SAL, GENDER, AGE)
VALUES (7, 'UMA', 18000, 'MALE', 30);

INSERT INTO EMP (EID, ENAME, BASIC_SAL, MOB, GENDER, HAVE_PAN, AGE)
VALUES (8, 'RAMU', 10000, 7790487990, 'MALE', 1, 25),
       (9, 'SIRI', 16000, 9887645678, 'FEMALE', 0, 26),
       (10, 'PRATHIMA', 15000, 9837487990, 'FEMALE', 1, 26);

-- Example of handling errors during insertion:
-- Attempt to insert a duplicate key (if primary key exists):
-- INSERT INTO EMP (EID, ENAME) VALUES (1, 'DUPLICATE');
-- This will throw an error if EID=1 already exists in the table.

SELECT * FROM EMP;
SELECT * FROM EMP2;

-- Drop a column (example on EMP2)
ALTER TABLE EMP2 DROP COLUMN EID;

-- 2. UPDATE
-- Update records conditionally (use WHERE clause to avoid unintentional updates)
UPDATE EMP SET HAVE_PAN = 1 WHERE HAVE_PAN IS NULL;

-- Example: Increase BASIC_SAL by 10% for employees with salary below 10,000
UPDATE EMP SET BASIC_SAL = BASIC_SAL * 1.1 WHERE BASIC_SAL < 10000;

-- Example: Update gender to uppercase format
UPDATE EMP SET GENDER = UPPER(GENDER) WHERE GENDER IS NOT NULL;

-- Example: Update multiple columns simultaneously
UPDATE EMP
SET BASIC_SAL = BASIC_SAL + 2000,
    AGE = AGE + 1
WHERE GENDER = 'MALE';

-- Example: Set HAVE_PAN to 0 and GENDER to 'UNKNOWN' for specific rows
UPDATE EMP
SET HAVE_PAN = 0,
    GENDER = 'UNKNOWN'
WHERE BASIC_SAL < 10000;

-- Common Mistakes in UPDATE:
-- 1. Forgetting the WHERE clause, which updates all rows:
-- UPDATE EMP SET BASIC_SAL = 5000; -- This updates the salary for all employees.

-- 2. Incorrect conditions leading to unintended updates:
-- UPDATE EMP SET BASIC_SAL = BASIC_SAL * 1.2 WHERE GENDER = 'UNKNOWN';

-- 3. Updating using invalid column names or datatypes:
-- UPDATE EMP SET GENDER = 123; -- Throws an error as GENDER is a CHAR column.

-- 3. DELETE
-- Delete rows conditionally (use WHERE clause to avoid deleting all rows)
DELETE FROM EMP WHERE AGE > 30;

-- Example: Remove records of employees with no PAN details
DELETE FROM EMP WHERE HAVE_PAN = 0;

-- Example: Delete all records (use with caution!)
-- DELETE FROM EMP; -- This deletes all rows from the table

-- Notes:
-- Always use WHERE clause for UPDATE and DELETE to prevent accidental modifications.
-- Avoid using commands without understanding the scope and impact.