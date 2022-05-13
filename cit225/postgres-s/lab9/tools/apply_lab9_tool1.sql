-- ------------------------------------------------------------------
--  Program Name:   apply_lab9_tool1.sql
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
--   psql> \i apply_lab9_tool1.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Task #1: Create seed_account_list() procedure.
-- -------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE seed_account_list() AS
$$
DECLARE
  /* Declare local variables. */
  lv_table_name   VARCHAR(30);
  lv_column_name  VARCHAR(30);
  lv_airport_code  VARCHAR(3);

  /* Declare error handling variables. */
  err_num      TEXT;
  err_msg      INTEGER;

  /* Declare an airport code cursor. */
  airport_cursor CURSOR FOR
    SELECT DISTINCT airport_code
    FROM   airport;

BEGIN
  /* Open airport cursor. */
  OPEN airport_cursor;
  << airport_code >>
  LOOP
    /* FETCH airport code into local variable. */
    FETCH airport_cursor INTO lv_airport_code;

    /* Exit when there are no more airport codes. */
    EXIT airport_code WHEN NOT FOUND;

    /* Insert 50 rows for each airport city. */
    FOR j IN 1..50 LOOP
      INSERT INTO account_list
      ( account_number
      , consumed_date
      , consumed_by
      , created_by
      , last_updated_by )
      VALUES
      ( lv_airport_code||'-'||LPAD(j::text,6,'0')
      , NULL
      , NULL
      , 1002
      , 1002 );
    END LOOP;
  END LOOP;

  /* Close airport code cursor. */
  CLOSE airport_cursor;

EXCEPTION
  WHEN OTHERS THEN
    err_num := SQLSTATE;
    err_msg := SUBSTR(SQLERRM,1,100);
    RAISE NOTICE 'Trapped Error: %', err_msg;
END
$$ LANGUAGE plpgsql;
