-- ------------------------------------------------------------------
--  Program Name:   test_case.sql
--  Lab Assignment: N/A
--  Program Author: Michael McLaughlin
--  Creation Date:  12-Oct-2019
-- ------------------------------------------------------------------
--  Change Log:
-- ------------------------------------------------------------------
--  Change Date    Change Reason
-- -------------  ---------------------------------------------------
--  
-- ------------------------------------------------------------------
--  This automates creating accounts.
-- ------------------------------------------------------------------
-- ------------------------------------------------------------------
--  Automates inserts of member accounts for individual accounts. 
-- ------------------------------------------------------------------

-- Drop msg table.
DROP TABLE msg;

-- Create the message table.
CREATE TABLE msg
( comment  VARCHAR(400));

-- Transaction Management Example.
DROP PROCEDURE IF EXISTS testing
( IN pv_one                 VARCHAR(30)
, IN pv_two                 VARCHAR(10));

-- Transaction Management Example.
CREATE OR REPLACE PROCEDURE testing
( IN pv_one                 VARCHAR(30)
, IN pv_two                 VARCHAR(10)) AS
$$
DECLARE
  /* Declare error handling variables. */
  err_num      TEXT;
  err_msg      INTEGER;
BEGIN
  /* Log actdual parameter values. */
  INSERT INTO msg VALUES (pv_one||'.'||pv_two);

EXCEPTION
  WHEN OTHERS THEN
    err_num := SQLSTATE;
    err_msg := SUBSTR(SQLERRM,1,100);
    RAISE NOTICE 'Trapped Error: %', err_msg;
END
$$ LANGUAGE plpgsql;

do $$
DECLARE
  lv_one VARCHAR(30) := 'INDIVIDUAL';
  lv_two VARCHAR(19) := 'R11-514-34';
BEGIN
  RAISE NOTICE '[%]', lv_one;
  RAISE NOTICE '[%]', lv_two;
  CALL testing( pv_one := lv_one, pv_two := lv_two );
END
$$;

-- Query any logged results.
SELECT * FROM msg;


