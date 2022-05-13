-- ------------------------------------------------------------------
--  Program Name:   calc_function.sql
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
-- This demonstrates how to remove foreign key constraints.
-- ------------------------------------------------------------------

DROP FUNCTION IF EXISTS calc_function();

CREATE FUNCTION calc_function(a integer = 0, b integer = 0)
RETURNS integer AS
$$
BEGIN
  RETURN a + b;
END
$$ LANGUAGE plpgsql;

-- Query the function without values.
SELECT calc_function();

-- Query the function without values.
SELECT calc_function(2,2);
