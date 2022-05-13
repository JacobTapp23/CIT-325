-- ------------------------------------------------------------------
--  Program Name:   drop_routines.sql
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
--  This drops all functions & procedures (routines) from a catalog.
-- ------------------------------------------------------------------
--  Drop any function or procedure that is not overloaded.
-- ==================================================================

-- Set session variable.
SET SESSION "videodb.catalog_name" = 'videodb';

--  Verify table name.
SELECT current_setting('videodb.catalog_name');

-- ------------------------------------------------------------------

/* Verify all tables present. */
SELECT routine_name
,      routine_type
FROM   information_schema.routines
WHERE  specific_catalog = current_setting('videodb.catalog_name')
AND    specific_schema = 'public';

DO $$
DECLARE
  /* Declare an indefinite length string and record variable. */
  sql  VARCHAR;
  row  RECORD;

  /* Declare a cursor. */
  routine_cursor CURSOR FOR
    SELECT routine_name
    ,      routine_type
    FROM   information_schema.routines
    WHERE  specific_catalog = current_setting('videodb.catalog_name')
    AND    routine_schema = 'public';
BEGIN
  /* Open the cursor. */
  OPEN routine_cursor;
  LOOP
    /* Fetch table names. */
    FETCH routine_cursor INTO row;

    /* Exit when no more records are found. */
    EXIT WHEN NOT FOUND;

    /* Concatenate together a DDL to drop the table with prejudice. */
    sql := 'DROP '||row.routine_type||' IF EXISTS '||row.routine_name;

    /* Execute the DDL statement. */
    EXECUTE sql;
  END LOOP;

  /* Close the cursor. */
  CLOSE routine_cursor;
END;
$$;

/* Verify all tables are dropped. */
SELECT routine_name
,      routine_type
FROM   information_schema.routines
WHERE  specific_catalog = 'videodb'
AND    specific_schema = 'public';
