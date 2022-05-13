-- ------------------------------------------------------------------
--  Program Name:   apply_lab9_step2.sql
--  Lab Assignment: Lab #9
--  Program Author: Michael McLaughlin
--  Creation Date:  12-Nov-2019
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
--   psql> \i apply_lab9_step2.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Task #1: Insert 6 rows into the common_lookup table.
-- -------------------------------------------------------------------

-- Insert a transaction_type row in common_lookup table.
INSERT INTO common_lookup
( common_lookup_table
, common_lookup_column
, common_lookup_type
, common_lookup_meaning
, common_lookup_code
, created_by
, last_updated_by )
VALUES
('TRANSACTION'              -- common_lookup_table
,'TRANSACTION_TYPE'         -- common_lookup_column
,'CREDIT'                   -- common_lookup_type
,'Credit'                   -- common_lookup_meaning
,'CR'                       -- common_lookup_code
, 1001                      -- created_by
, 1001                      -- last_updated_by
);

-- Insert a transaction_type row in common_lookup table.
INSERT INTO common_lookup
( common_lookup_table
, common_lookup_column
, common_lookup_type
, common_lookup_meaning
, common_lookup_code
, created_by
, last_updated_by )
VALUES
('TRANSACTION'              -- common_lookup_table
,'TRANSACTION_TYPE'         -- common_lookup_column
,'DEBIT'                    -- common_lookup_type
,'Debit'                    -- common_lookup_meaning
,'DR'                       -- common_lookup_code
, 1001                      -- created_by
, 1001                      -- last_updated_by
);

-- Insert a payment_method_type row in common_lookup table.
INSERT INTO common_lookup
( common_lookup_table
, common_lookup_column
, common_lookup_type
, common_lookup_meaning
, created_by
, last_updated_by )
VALUES
('TRANSACTION'              -- common_lookup_table
,'PAYMENT_METHOD_TYPE'      -- common_lookup_column
,'DISCOVER_CARD'            -- common_lookup_type
,'Discover Card'            -- common_lookup_meaning
, 1001                      -- created_by
, 1001                      -- last_updated_by
);

-- Insert a payment_method_type row in common_lookup table.
INSERT INTO common_lookup
( common_lookup_table
, common_lookup_column
, common_lookup_type
, common_lookup_meaning
, created_by
, last_updated_by )
VALUES
('TRANSACTION'              -- common_lookup_table
,'PAYMENT_METHOD_TYPE'      -- common_lookup_column
,'VISA_CARD'                -- common_lookup_type
,'Visa Card'                -- common_lookup_meaning
, 1001                      -- created_by
, 1001                      -- last_updated_by
);

-- Insert a payment_method_type row in common_lookup table.
INSERT INTO common_lookup
( common_lookup_table
, common_lookup_column
, common_lookup_type
, common_lookup_meaning
, created_by
, last_updated_by )
VALUES
('TRANSACTION'              -- common_lookup_table
,'PAYMENT_METHOD_TYPE'      -- common_lookup_column
,'MASTER_CARD'              -- common_lookup_type
,'Master Card'              -- common_lookup_meaning
, 1001                      -- created_by
, 1001                      -- last_updated_by
);

-- Insert a payment_method_type row in common_lookup table.
INSERT INTO common_lookup
( common_lookup_table
, common_lookup_column
, common_lookup_type
, common_lookup_meaning
, created_by
, last_updated_by )
VALUES
('TRANSACTION'              -- common_lookup_table
,'PAYMENT_METHOD_TYPE'      -- common_lookup_column
,'CASH'                     -- common_lookup_type
,'Cash'                     -- common_lookup_meaning
, 1001                      -- created_by
, 1001                      -- last_updated_by
);
