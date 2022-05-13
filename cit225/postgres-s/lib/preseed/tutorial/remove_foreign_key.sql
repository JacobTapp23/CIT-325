-- ------------------------------------------------------------------
--  Program Name:   remove_foreign_key.sql
--  Lab Assignment: N/A
--  Program Author: Michael McLaughlin
--  Creation Date:  12-Oct-2019
-- ------------------------------------------------------------------
--  Change Log:
-- ------------------------------------------------------------------
--  Change Date    Change Reason
-- -------------  ---------------------------------------------------
--  
-- ------------------------------------------------------------------
-- This demonstrates how to remove foreign key constraints.
-- ------------------------------------------------------------------

-- Drop table if it exists.
DROP TABLE IF EXISTS big CASCADE;

-- Create big table.
CREATE TABLE big
( big_id     SERIAL
, big_text   VARCHAR(20) NOT NULL
, CONSTRAINT pk_little_1 PRIMARY KEY (big_id));

-- Describe the big table.
\d big

-- Drop the big table if it exists.
DROP TABLE IF EXISTS little;

-- Create big table.
CREATE TABLE little
( little_id     SERIAL
, big_id        INTEGER     NOT NULL
, little_text   VARCHAR(20) NOT NULL
, CONSTRAINT fk_little_1 FOREIGN KEY (big_id) REFERENCES big (big_id));

-- Describe the big table.
\d little

-- Insert into the big table.
INSERT INTO big
(big_text)
VALUES
('Cat in the Hat 1');

-- Insert into a row into the big table.
INSERT INTO little
(big_id
,little_text)
VALUES
((SELECT CURRVAL('big_big_id_seq'))
,'Thing 1');

-- Insert into a row into the big table.
INSERT INTO little
(big_id
,little_text)
VALUES
((SELECT CURRVAL('big_big_id_seq'))
,'Thing 2');

-- Query the big and little tables.
SELECT * FROM big;
SELECT * FROM little;

-- Query the join between the big and little tables.
SELECT *
FROM   big b JOIN little l ON b.big_id = l.big_id;

-- Remove the not null constraint from the little table.
ALTER TABLE little DROP CONSTRAINT fk_little_1;

-- Insert a row into the little table.
INSERT INTO little
(big_id
,little_text)
VALUES
( 2
,'Thing 3');

-- Query the outer join, which covers the non-matching row.
SELECT *
FROM   big b RIGHT JOIN little l ON b.big_id = l.big_id;

-- Alter the little table and add the foreign key constraint when the data doesn't support it.
ALTER TABLE little ADD CONSTRAINT fk_little_1 FOREIGN KEY (big_id) REFERENCES big (big_id);

-- Insert the missing row in the big table.
INSERT INTO big
(big_text)
VALUES
('Cat in the Hat 2');

-- Query the inner join that now resolves because the missing row in the big table was
-- added to the table.
SELECT *
FROM   big b JOIN little l ON b.big_id = l.big_id;

-- Alter the little table and add the foreign key constraint when the data supports it.
ALTER TABLE little ADD CONSTRAINT fk_little_1 FOREIGN KEY (big_id) REFERENCES big (big_id);
