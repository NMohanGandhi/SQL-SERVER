-- DDL (Data Definition Language) Commands
-- Commands: CREATE, ALTER, DROP, TRUNCATE, RENAME

-- 1. CREATE a table using the CREATE command
CREATE TABLE emp (
    eid TINYINT,
    ename CHAR(10),
    basic_sal INT
);

-- Show the table structure
-- Using sp_help with or without quotes
sp_help emp;
EXEC sp_help 'emp'; -- No error for EXEC command

-- 2. ALTER
-- ALTER command operations:
-- 1. ALTER - ADD: Add new columns to the table
-- 2. ALTER - ALTER: Change the data type of a column
-- 3. ALTER - DROP: Remove a column from the table

-- Add a single column
ALTER TABLE emp ADD mob BIGINT;

-- Add multiple columns
ALTER TABLE emp 
ADD gender CHAR(6),
    have_pan BIT,
    age INT,
    meal CHAR(4);

-- Change the data type of a column
ALTER TABLE emp ALTER COLUMN meal VARCHAR(20);

-- NOTE: Changing multiple column data types in one command is not allowed
-- Example:
-- ALTER TABLE emp ALTER COLUMN meal CHAR, age TINYINT; -- This will fail

-- Drop a column
ALTER TABLE emp DROP COLUMN meal;

-- 3. DROP
-- DROP command can remove tables or databases

-- Create a database and table for demonstration
CREATE DATABASE test;
CREATE TABLE emp1 (
    eid TINYINT,
    ename CHAR(10),
    basic_sal INT
);

-- Drop the database and table
DROP DATABASE test;
DROP TABLE emp1;

-- 4. TRUNCATE
-- TRUNCATE command removes all data but keeps the structure of the table
TRUNCATE TABLE emp;

-- 5. RENAME
-- Rename a table
EXEC sp_rename 'emp1', 'emp2';

-- Rename a database
EXEC sp_renamedb 'practice', 'practice1';
EXEC sp_renamedb 'practice1', 'practice';

-- Rename a column
-- Example: Rename "basic_sal" to "salary" in "emp2" table
EXEC sp_rename 'emp2.basic_sal', 'salary', 'COLUMN';

