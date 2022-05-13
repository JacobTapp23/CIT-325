-- ------------------------------------------------------------------
--  Program Name:   drop_sequences.sql
--  Lab Assignment: N/A
--  Program Author: Michael McLaughlin
--  Creation Date:  26-Oct-2019
-- ------------------------------------------------------------------
--  Change Log:
-- ------------------------------------------------------------------
--  Change Date    Change Reason
-- -------------  ---------------------------------------------------
--  
-- ==================================================================
--  This drops all sequences in a catalog but should be run after
--  you drop all tables that define a sequence by using a SERIAL
--  auto incrementing _ID value.
-- ==================================================================

SET SESSION "videodb.catalog_name" = 'videodb';
SET CLIENT_MIN_MESSAGES TO ERROR;

--  Verify table name.
SELECT current_setting('videodb.catalog_name');

-- ------------------------------------------------------------------

/* Verify all tables present. */
SELECT sequence_name
FROM   information_schema.sequences
WHERE  sequence_catalog = current_setting('videodb.catalog_name')
AND    sequence_schema = 'public';

DO $$
DECLARE
  /* Declare an indefinite length string and record variable. */
  sql  VARCHAR;
  row  RECORD;

  /* Declare a cursor. */
  sequence_cursor CURSOR FOR
    SELECT sequence_name
    FROM   information_schema.sequences
    WHERE  sequence_catalog = current_setting('videodb.catalog_name')
    AND    sequence_schema = 'public';
BEGIN
  /* Open the cursor. */
  OPEN sequence_cursor;
  LOOP
    /* Fetch table names. */
    FETCH sequence_cursor INTO row;

    /* Exit when no more records are found. */
    EXIT WHEN NOT FOUND;

    /* Concatenate together a DDL to drop the table with prejudice. */
    sql := 'DROP SEQUENCE IF EXISTS '||row.sequence_name;

    /* Execute the DDL statement. */
    EXECUTE sql;
  END LOOP;

  /* Close the cursor. */
  CLOSE sequence_cursor;
END;
$$;

/* Verify all tables are dropped. */
SELECT sequence_name
FROM   information_schema.sequences
WHERE  sequence_catalog = current_setting('videodb.catalog_name')
AND    sequence_schema = 'public';

