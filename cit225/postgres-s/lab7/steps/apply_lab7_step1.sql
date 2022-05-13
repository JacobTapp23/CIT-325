-- ------------------------------------------------------------------
--  Program Name:   apply_lab7_step1.sql
--  Lab Assignment: Lab #7
--  Program Author: Michael McLaughlin
--  Creation Date:  08-Nov-2019
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
--   psql> \i apply_lab7_step1.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Task #1: Insert two rows for the YES and NO type values for
--           the active_flag column of the price table.
-- ------------------------------------------------------------------

INSERT INTO common_lookup
( common_lookup_table
, common_lookup_column
, common_lookup_type
, common_lookup_meaning
, common_lookup_code
, created_by
, last_updated_by )
VALUES
('PRICE'                    -- common_lookup_table
,'ACTIVE_FLAG'              -- common_lookup_column
,'YES'                      -- common_lookup_type
,'Yes'                      -- common_lookup_meaning
,'Y'                        -- common_lookup_code
, 1001                      -- created_by
, 1001                      -- last_updated_by
);

INSERT INTO common_lookup
( common_lookup_table
, common_lookup_column
, common_lookup_type
, common_lookup_meaning
, common_lookup_code
, created_by
, last_updated_by )
VALUES
('PRICE'                    -- common_lookup_table
,'ACTIVE_FLAG'              -- common_lookup_column
,'NO'                       -- common_lookup_type
,'No'                       -- common_lookup_meaning
,'N'                        -- common_lookup_code
, 1001                      -- created_by
, 1001                      -- last_updated_by
);

-- ------------------------------------------------------------------
--  Task #2: Insert three rows for each of the following for 1, 3, 
--           and 5 day rentals in both the price_type column of the 
--           price table and rental_item_type column of the 
--           rental_item table.
-- ------------------------------------------------------------------

INSERT INTO common_lookup
( common_lookup_table
, common_lookup_column
, common_lookup_type
, common_lookup_meaning
, common_lookup_code
, created_by
, last_updated_by )
VALUES
('PRICE'                    -- common_lookup_table
,'PRICE_TYPE'               -- common_lookup_column
,'1-DAY RENTAL'             -- common_lookup_type
,'1-Day Rental'             -- common_lookup_meaning
,'1'                        -- common_lookup_code
, 1001                      -- created_by
, 1001                      -- last_updated_by
);

INSERT INTO common_lookup
( common_lookup_table
, common_lookup_column
, common_lookup_type
, common_lookup_meaning
, common_lookup_code
, created_by
, last_updated_by )
VALUES
('PRICE'                    -- common_lookup_table
,'PRICE_TYPE'               -- common_lookup_column
,'3-DAY RENTAL'             -- common_lookup_type
,'3-Day Rental'             -- common_lookup_meaning
,'3'                        -- common_lookup_code
, 1001                      -- created_by
, 1001                      -- last_updated_by
);

INSERT INTO common_lookup
( common_lookup_table
, common_lookup_column
, common_lookup_type
, common_lookup_meaning
, common_lookup_code
, created_by
, last_updated_by )
VALUES
('PRICE'                    -- common_lookup_table
,'PRICE_TYPE'               -- common_lookup_column
,'5-DAY RENTAL'             -- common_lookup_type
,'5-Day Rental'             -- common_lookup_meaning
,'5'                        -- common_lookup_code
, 1001                      -- created_by
, 1001                      -- last_updated_by
);

INSERT INTO common_lookup
( common_lookup_table
, common_lookup_column
, common_lookup_type
, common_lookup_meaning
, common_lookup_code
, created_by
, last_updated_by )
VALUES
('RENTAL_ITEM'              -- common_lookup_table
,'RENTAL_ITEM_TYPE'         -- common_lookup_column
,'1-DAY RENTAL'             -- common_lookup_type
,'1-Day Rental'             -- common_lookup_meaning
,'1'                        -- common_lookup_code
, 1001                      -- created_by
, 1001                      -- last_updated_by
);

INSERT INTO common_lookup
( common_lookup_table
, common_lookup_column
, common_lookup_type
, common_lookup_meaning
, common_lookup_code
, created_by
, last_updated_by )
VALUES
('RENTAL_ITEM'              -- common_lookup_table
,'RENTAL_ITEM_TYPE'         -- common_lookup_column
,'3-DAY RENTAL'             -- common_lookup_type
,'3-Day Rental'             -- common_lookup_meaning
,'3'                        -- common_lookup_code
, 1001                      -- created_by
, 1001                      -- last_updated_by
);

INSERT INTO common_lookup
( common_lookup_table
, common_lookup_column
, common_lookup_type
, common_lookup_meaning
, common_lookup_code
, created_by
, last_updated_by )
VALUES
('RENTAL_ITEM'              -- common_lookup_table
,'RENTAL_ITEM_TYPE'         -- common_lookup_column
,'5-DAY RENTAL'             -- common_lookup_type
,'5-Day Rental'             -- common_lookup_meaning
,'5'                        -- common_lookup_code
, 1001                      -- created_by
, 1001                      -- last_updated_by
);
