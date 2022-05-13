-- ------------------------------------------------------------------
--  Program Name:   set_session_var.sql
--  Lab Assignment: N/A
--  Program Author: Michael McLaughlin
--  Creation Date:  10-Sep-2019
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
--   psql> \i apply_lab2_step1.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Define the procedure.
-- ------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE set_session_var
( IN key    VARCHAR(30)
, IN value  TEXT) AS
$$
DECLARE
  err_num  TEXT;
  err_msg  INTEGER;
BEGIN
  EXECUTE 'SET SESSION '||'"'||key||'" = '''||value||'''';
EXCEPTION
  WHEN OTHERS THEN
    err_num := SQLSTATE;
    err_msg := SUBSTR(SQLERRM,1,100);
    RAISE NOTICE 'Trapped Error: %', err_msg;
END
$$ LANGUAGE plpgsql;
 
-- ------------------------------------------------------------------
--  Call the procedure.
-- ------------------------------------------------------------------

CALL set_session_var('Videodb.output','Sample');

-- ------------------------------------------------------------------
--  Query session variable.
-- ------------------------------------------------------------------

SELECT current_setting('Videodb.output');

