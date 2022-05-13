-- ------------------------------------------------------------------
--  Program Name:   apply_lab6_step2.sql
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
--   psql> \i apply_lab6_step2.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Task #1: Drop two indexes from the common_lookup table.
--            1. nq_common_lookup_n1
--            2. uq_common_lookup_u1
-- -------------------------------------------------------------------

-- Drop unique index on the context name.
DROP INDEX IF EXISTS nq_common_lookup_n1;

-- Drop unique index on the context name.
DROP INDEX IF EXISTS uq_common_lookup_u1;

-- ------------------------------------------------------------------
--  Task #2: Add the three new columns to the common_lookup table:
--            1. common_lookup_table
--            2. common_lookup_column
--            3. common_lookup_code
-- ------------------------------------------------------------------

-- Alter table and add common_lookup_table column.
ALTER TABLE common_lookup
ADD COLUMN common_lookup_table varchar(30);

-- Alter table and add common_lookup_table column.
ALTER TABLE common_lookup
ADD COLUMN common_lookup_column varchar(30);

-- Alter table and add common_lookup_table column.
ALTER TABLE common_lookup
ADD COLUMN common_lookup_code varchar(2);

-- ------------------------------------------------------------------
--  Task #3: Update the common_lookup_table and common_lookup_column
--           columns with data from the common_lookup_context
--           column and a literal ADDRESS or ADDRESS_TYPE value for
--           those rows where the common_lookup_context value is
--           an uppercase MULTIPLE value.
-- ------------------------------------------------------------------

UPDATE common_lookup
SET    common_lookup_table =
         CASE
           WHEN common_lookup_context = 'MULTIPLE' THEN 'ADDRESS'
           ELSE common_lookup_context
         END
,      common_lookup_column = 
         CASE
           WHEN common_lookup_context = 'MULTIPLE' THEN 'ADDRESS_TYPE'
           ELSE common_lookup_context || '_TYPE'
         END;

-- ------------------------------------------------------------------
--  Task #4: Drop the common_lookup_context column from the 
--           common_lookup table.
-- ------------------------------------------------------------------

ALTER TABLE common_lookup
DROP COLUMN common_lookup_context;

-- ------------------------------------------------------------------
--  Task #5: Add two columns for the telephone table to the 
--           common_lookup table.
-- ------------------------------------------------------------------
INSERT INTO common_lookup
( common_lookup_table
, common_lookup_column
, common_lookup_type
, common_lookup_meaning
, created_by
, last_updated_by )
VALUES
('TELEPHONE'                  -- common_lookup_table
,'TELEPHONE_TYPE'             -- common_lookup_column
,'HOME'                       -- common_lookup_type
,'Home'                       -- common_lookup_meaning
, 1                           -- created_by
, 1                           -- last_updated_by
);

INSERT INTO common_lookup
( common_lookup_table
, common_lookup_column
, common_lookup_type
, common_lookup_meaning
, created_by
, last_updated_by )
VALUES
('TELEPHONE'                  -- common_lookup_table
,'TELEPHONE_TYPE'             -- common_lookup_column
,'WORK'                       -- common_lookup_type
,'Work'                       -- common_lookup_meaning
, 1                           -- created_by
, 1                           -- last_updated_by
);

-- ------------------------------------------------------------------
--  Task #6: Update the telephone_type foreign key values in the
--           telephone table by using an UPDATE statement.
-- ------------------------------------------------------------------

UPDATE telephone
SET    telephone_type =
        (SELECT cl1.common_lookup_id
	 FROM   common_lookup cl1 JOIN common_lookup cl2
	 ON     cl1.common_lookup_type = cl2.common_lookup_type
	 WHERE  cl1.common_lookup_table = 'TELEPHONE'
	 AND    cl1.common_lookup_column = 'TELEPHONE_TYPE'
	 AND    cl2.common_lookup_table = 'ADDRESS'
	 AND    cl2.common_lookup_column = 'ADDRESS_TYPE'
	 AND    telephone_type = cl2.common_lookup_id);

-- ------------------------------------------------------------------
--  Task #7: Alter the common_lookup table to add a not null
--           constraint to the following columns:
--            1. common_lookup_table
--            2. common_lookup_column
--           Create a uq_common_lookup unique index on three columns:
--            1. common_lookup_table
--            2. common_lookup_column
--            3. common_lookup_type
-- ------------------------------------------------------------------

ALTER TABLE common_lookup
ALTER COLUMN common_lookup_table SET NOT NULL;

ALTER TABLE common_lookup
ALTER COLUMN common_lookup_column SET NOT NULL;

CREATE UNIQUE INDEX uq_common_lookup 
ON common_lookup (common_lookup_table, common_lookup_column, common_lookup_type);
