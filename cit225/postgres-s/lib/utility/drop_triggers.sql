-- ------------------------------------------------------------------
--  Program Name:   drop_triggers.sql
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
--  This drops all triggers in a catalog.
-- ==================================================================

SET SESSION "videodb.catalog_name" = 'videodb';
SET CLIENT_MIN_MESSAGES TO ERROR;

--  Verify table name.
SELECT current_setting('videodb.catalog_name');

-- ------------------------------------------------------------------

/* Verify all tables present. */
SELECT trigger_name
FROM   information_schema.triggers
WHERE  trigger_catalog = current_setting('videodb.catalog_name')
AND    trigger_schema = 'public';

DO $$
DECLARE
  /* Declare an indefinite length string and record variable. */
  sql  VARCHAR;
  row  RECORD;

  /* Declare a cursor. */
  trigger_cursor CURSOR FOR
    SELECT trigger_name
    FROM   information_schema.triggers
    WHERE  trigger_catalog = current_setting('videodb.catalog_name')
    AND    trigger_schema = 'public';
BEGIN
  /* Open the cursor. */
  OPEN trigger_cursor;
  LOOP
    /* Fetch table names. */
    FETCH trigger_cursor INTO row;

    /* Exit when no more records are found. */
    EXIT WHEN NOT FOUND;

    /* Concatenate together a DDL to drop the table with prejudice. */
    sql := 'DROP TRIGGER IF EXISTS '||row.trigger_name;

    /* Execute the DDL statement. */
    EXECUTE sql;
  END LOOP;

  /* Close the cursor. */
  CLOSE trigger_cursor;
END;
$$;

/* Verify all tables are dropped. */
SELECT trigger_name
FROM   information_schema.triggers
WHERE  trigger_catalog = current_setting('videodb.catalog_name')
AND    trigger_schema = 'public';

