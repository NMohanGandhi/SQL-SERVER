-- # DDL Commands in SQL
-- This script demonstrates the usage of common Data Definition Language (DDL) commands
-- including CREATE, ALTER, DROP, TRUNCATE, and RENAME. Each command is explained
-- with examples, making it ideal for beginners and those looking to understand DDL operations.
--
-- ## Requirements
-- - A SQL Server database environment (e.g., Microsoft SQL Server, Azure SQL)
-- - Basic knowledge of SQL syntax

-- ## Definitions of Commands
-- 1. CREATE: Used to create new database objects like tables, views, or databases.
-- 2. ALTER: Allows modification of existing database objects, such as adding, modifying, or removing columns.
-- 3. DROP: Permanently deletes database objects like tables or databases.
-- 4. TRUNCATE: Removes all rows from a table but retains its structure.
-- 5. RENAME: Renames existing database objects like tables, columns, or databases.

-- ## 1. CREATE Command
-- Used to create new database objects such as tables, views, or databases
CREATE TABLE emp (
    eid TINYINT,          -- Employee ID
    ename CHAR(10),       -- Employee name
    basic_sal INT         -- Basic salary
);

-- Show the table structure
-- Using sp_help to view table details
sp_help emp;
EXEC sp_help 'emp'; -- Equivalent command using EXEC

-- ## 2. ALTER Command
-- Used to modify existing database objects
-- ALTER operations:
-- 1. ADD: Add new columns to the table
-- 2. ALTER: Change the data type of a column
-- 3. DROP: Remove a column from the table

-- Add a single column
ALTER TABLE emp ADD mob BIGINT; -- Add a mobile number column

-- Add multiple columns
ALTER TABLE emp 
ADD gender CHAR(6),      -- Gender (e.g., Male, Female)
    have_pan BIT,        -- Has PAN card (1 = Yes, 0 = No)
    age INT,             -- Age of the employee
    meal CHAR(4);        -- Meal preference (e.g., Veg, Non-Veg)

-- Change the data type of a column
ALTER TABLE emp ALTER COLUMN meal VARCHAR(20); -- Update "meal" column data type to VARCHAR(20)

-- NOTE: Changing multiple column data types in one command is not allowed
-- Example:
-- ALTER TABLE emp ALTER COLUMN meal CHAR, age TINYINT; -- This will fail

-- Drop a column
ALTER TABLE emp DROP COLUMN meal; -- Remove the "meal" column

-- ## 3. DROP Command
-- Used to delete database objects permanently
-- Drop the database and table examples

-- Create a database and table for demonstration
CREATE DATABASE test;
CREATE TABLE emp1 (
    eid TINYINT,          -- Employee ID
    ename CHAR(10),       -- Employee name
    basic_sal INT         -- Basic salary
);

-- Drop the database and table
DROP DATABASE test; -- Permanently deletes the database "test"
DROP TABLE emp1;    -- Permanently deletes the table "emp1"

-- ## 4. TRUNCATE Command
-- Used to remove all records from a table while retaining its structure
TRUNCATE TABLE emp; -- Removes all data from "emp" table

-- ## 5. RENAME Command
-- Used to rename database objects
-- Rename a table
EXEC sp_rename 'emp1', 'emp2'; -- Rename table "emp1" to "emp2"

-- Rename a database
EXEC sp_renamedb 'practice', 'practice1'; -- Rename database "practice" to "practice1"
EXEC sp_renamedb 'practice1', 'practice'; -- Rename it back to "practice"

-- Rename a column
-- Example: Rename "basic_sal" to "salary" in the "emp2" table
EXEC sp_rename 'emp2.basic_sal', 'salary', 'COLUMN'; -- Change column name

-- ## Best Practices
-- 1. Always back up critical data before performing destructive operations like DROP or TRUNCATE.
-- 2. Use descriptive names for tables and columns to improve readability.
-- 3. Test commands in a development environment before running them in production.
-- 4. Use database version control to track changes.

-- ## Sample Output
-- After running `sp_help emp`:
-- Column Name   Type     Nullable
-- --------------------------------
-- eid           TINYINT  No
-- ename         CHAR(10) Yes
-- basic_sal     INT      Yes
-- mob           BIGINT   Yes
-- gender        CHAR(6)  Yes
-- have_pan      BIT      Yes
-- age           INT      Yes
