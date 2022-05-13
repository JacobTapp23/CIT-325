-- ------------------------------------------------------------------
--  Program Name:   apply_lab6_step1.sql
--  Lab Assignment: Lab #6
--  Program Author: Michael McLaughlin
--  Creation Date:  05-Nov-2019
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
--   psql> \i apply_lab6_step1.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Task #1: Add rental_item_type column.
-- ------------------------------------------------------------------
ALTER TABLE rental_item
ADD COLUMN rental_item_type int;

-- ------------------------------------------------------------------
--  Task #2: Add foreign key constraint on rental_item_type column.
-- ------------------------------------------------------------------
ALTER TABLE rental_item
ADD CONSTRAINT fk_rental_item_5 FOREIGN KEY (rental_item_type)
REFERENCES common_lookup (common_lookup_id);

-- ------------------------------------------------------------------
--  Task #3: Add rental_item_price column.
-- ------------------------------------------------------------------
ALTER TABLE rental_item
ADD COLUMN rental_item_price decimal(12,2);
