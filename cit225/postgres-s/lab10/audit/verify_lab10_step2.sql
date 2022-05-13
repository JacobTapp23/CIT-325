-- ------------------------------------------------------------------
--  Program Name:   apply_lab10_step2.sql
--  Lab Assignment: Lab #10
--  Program Author: Michael McLaughlin
--  Creation Date:  22-Feb-2022
-- ------------------------------------------------------------------
--  Change Log:
-- ------------------------------------------------------------------
--  Change Date    Change Reason
-- -------------  ---------------------------------------------------
--  
-- ------------------------------------------------------------------
--
-- ------------------------------------------------------------------
-- Instructions:
-- ------------------------------------------------------------------
-- You first connect to the Postgres database with this syntax:
--
--   psql -U student -d videodb -W
--
-- Then, you call this script with the following syntax:
--
--   psql> \i apply_lab10_step2.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Task #1: Count rows from import target table: [8].
-- ------------------------------------------------------------------

-- Counting importing rental items.
SELECT   COUNT(*)
FROM     rental_item;
		 
-- ------------------------------------------------------------------
--  Task #2: Count rows from import and import target tables: [4089].
-- ------------------------------------------------------------------

SELECT COUNT(*)
FROM   rental_item;