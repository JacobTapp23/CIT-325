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
--  Drop any function or procedure that is overloaded.
-- ==================================================================

-- Set session variable.
SET SESSION "videodb.catalog_name" = 'videodb';

--  Verify table name.
SELECT current_setting('videodb.catalog_name');

-- ------------------------------------------------------------------
/* Create zero parameter overloaded function. */
CREATE FUNCTION hello()
RETURNS text AS
$$
DECLARE
  output  VARCHAR;
BEGIN
  SELECT 'Hello World!' INTO output;
  RETURN output;
END
$$ LANGUAGE plpgsql;
 
/* Create one parameter overloaded function. */
CREATE FUNCTION hello(whom text)
RETURNS text AS
$$
DECLARE
  output  VARCHAR;
BEGIN
  SELECT CONCAT('Hello ',whom,'!') INTO output;
  RETURN output;
END
$$ LANGUAGE plpgsql;
 
/* Create two parameter overloaded function. */
CREATE FUNCTION hello(id int, whom text)
RETURNS text AS
$$
DECLARE
  output  VARCHAR;
BEGIN
  SELECT CONCAT('[',id,'] Hello ',whom,'!') INTO output;
  RETURN output;
END
$$ LANGUAGE plpgsql;

/* Test cases. */
SELECT hello();
SELECT hello('Captain Marvel');
SELECT hello(1,'Captain America');

/* Query overloaded routines. */
SELECT   proc.specific_schema AS procedure_schema
,        proc.specific_name
,        proc.routine_name AS procedure_name
,        proc.external_language
,        args.parameter_name
,        args.parameter_mode
,        args.data_type
FROM     information_schema.routines proc left join information_schema.parameters args
ON       proc.specific_schema = args.specific_schema
AND      proc.specific_name = args.specific_name
WHERE    proc.routine_schema NOT IN ('pg_catalog', 'information_schema')
AND      proc.routine_type IN ('FUNCTION','PROCEDURE')
ORDER BY procedure_schema
,        specific_name
,        procedure_name
,        args.ordinal_position;

/* Anonymous block to drop routines and overloaded routines. */
DO $$
DECLARE
  /* Declare an indefinite length string for SQL statement. */
  sql  VARCHAR;

  /* Declare variables to manage cursor return values. */
  row  RECORD;
  arg  VARCHAR;

  /* Declare parameter list. */
  list VARCHAR;

  /* Declare a routine cursor. */
  routine_cursor CURSOR FOR
    SELECT routine_name
    ,      specific_name
    ,      routine_type
    FROM   information_schema.routines
    WHERE  specific_catalog = current_setting('videodb.catalog_name')
    AND    routine_schema = 'public';

  /* Declare a parameter cursor. */
  parameter_cursor CURSOR (cv_specific_name varchar) FOR
    SELECT args.data_type
    FROM   information_schema.parameters args
    WHERE  args.specific_schema = 'public'
    AND    args.specific_name = cv_specific_name;

BEGIN
  /* Open the cursor. */
  OPEN routine_cursor;
  <<row_loop>>
  LOOP
    /* Fetch table names. */
    FETCH routine_cursor INTO row;

    /* Exit when no more records are found. */
    EXIT row_loop WHEN NOT FOUND;

    /* Initialize parameter list. */
    list := '(';

    /* Open the parameter cursor. */
    OPEN parameter_cursor(row.specific_name::varchar);
    <<parameter_loop>>
    LOOP
      FETCH parameter_cursor INTO arg;

      /* Exit the parameter loop. */
      EXIT parameter_loop WHEN NOT FOUND;

      /* Add parameter and delimit more than one parameter with a comma. */
      IF LENGTH(list) > 1 THEN
        list := CONCAT(list,',',arg);
      ELSE
        list := CONCAT(list,arg);
      END IF;
    END LOOP;

    /* Close the parameter list. */
    list := CONCAT(list,')');

    /* Close the parameter cursor. */
    CLOSE parameter_cursor;

    /* Concatenate together a DDL to drop the table with prejudice. */
    sql := 'DROP '||row.routine_type||' IF EXISTS '||row.routine_name||list;

    /* Execute the DDL statement. */
    EXECUTE sql;
  END LOOP;

  /* Close the routine_cursor. */
  CLOSE routine_cursor;
END;
$$;

/* Query overloaded routines. */
SELECT   proc.specific_schema AS procedure_schema
,        proc.specific_name
,        proc.routine_name AS procedure_name
,        proc.external_language
,        args.parameter_name
,        args.parameter_mode
,        args.data_type
FROM     information_schema.routines proc left join information_schema.parameters args
ON       proc.specific_schema = args.specific_schema
AND      proc.specific_name = args.specific_name
WHERE    proc.routine_schema NOT IN ('pg_catalog', 'information_schema')
AND      proc.routine_type IN ('FUNCTION','PROCEDURE')
ORDER BY procedure_schema
,        specific_name
,        procedure_name
,        args.ordinal_position;
