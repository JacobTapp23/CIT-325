-- ------------------------------------------------------------------
--  Program Name:   remove_not_null.sql
--  Lab Assignment: N/A
--  Program Author: Michael McLaughlin
--  Creation Date:  09-Oct-2019
-- ------------------------------------------------------------------
--  Change Log:
-- ------------------------------------------------------------------
--  Change Date    Change Reason
-- -------------  ---------------------------------------------------
--  
-- ------------------------------------------------------------------
-- This demonstrates removing and replacing a not null constraint.
-- ------------------------------------------------------------------

-- Drop the demo table if it exists.
DROP TABLE IF EXISTS demo;

-- Create the demo table.
CREATE TABLE demo
( demo_id    SERIAL
, demo_text  VARCHAR(10) NOT NULL );

-- Describe the demo table.
\d demo

-- Insert into a row into the demo table.
INSERT INTO demo
(demo_text)
VALUES
('Thing 1');

-- Insert into a row into the demo table.
INSERT INTO demo
(demo_text)
VALUES
(null);

-- Alter the demo table by removing the not null constraint.
ALTER TABLE demo ALTER COLUMN demo_text DROP NOT NULL;

-- Describe the demo table.
\d demo

-- Insert into a row into the demo table.
INSERT INTO demo
(demo_text)
VALUES
(null);

-- Query the demo table.
SELECT * FROM demo;

-- Update the null value in the demo_text column.
UPDATE demo
SET    demo_text = 'Thing 2'
WHERE  demo_text IS NULL;

-- Query the demo table.
SELECT * FROM demo;

-- Alter the demo table by adding a not null constraint to the table.
ALTER TABLE demo ALTER COLUMN demo_text SET NOT NULL;

-- Describe the demo table.
\d demo
