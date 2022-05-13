-- ------------------------------------------------------------------
--  Program Name:   drop_tables.sql
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
--  This drops all tables in a catalog.
-- ==================================================================

SET SESSION "videodb.catalog_name" = 'videodb';
SET CLIENT_MIN_MESSAGES TO ERROR;

--  Verify table name.
SELECT current_setting('videodb.catalog_name');

-- ------------------------------------------------------------------

/* Verify all tables present. */
SELECT table_name
FROM   information_schema.tables
WHERE  table_catalog = current_setting('videodb.catalog_name')
AND    table_schema = 'public';

DO $$
DECLARE
  /* Declare an indefinite length string and record variable. */
  sql  VARCHAR;
  row  RECORD;

  /* Declare a cursor. */
  table_cursor CURSOR FOR
    SELECT table_name
    FROM   information_schema.tables
    WHERE  table_catalog = current_setting('videodb.catalog_name')
    AND    table_schema = 'public';
BEGIN
  /* Open the cursor. */
  OPEN table_cursor;
  LOOP
    /* Fetch table names. */
    FETCH table_cursor INTO row;

    /* Exit when no more records are found. */
    EXIT WHEN NOT FOUND;

    /* Concatenate together a DDL to drop the table with prejudice. */
    sql := 'DROP TABLE IF EXISTS '||row.table_name||' CASCADE';

    /* Execute the DDL statement. */
    EXECUTE sql;
  END LOOP;

  /* Close the cursor. */
  CLOSE table_cursor;
END;
$$;

/* Verify all tables are dropped. */
SELECT table_name
FROM   information_schema.tables
WHERE  table_catalog = current_setting('videodb.catalog_name')
AND    table_schema = 'public';

