-- ------------------------------------------------------------------
--  Program Name:   hello_world.sql
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

DROP FUNCTION IF EXISTS hello_world();

CREATE FUNCTION hello_world()
RETURNS text AS
$$
DECLARE
  output  VARCHAR(20);
BEGIN
  /* Query the string into a local variable. */
  SELECT 'Hello World!' INTO output;

  /* Return the output text variable. */
  RETURN output;
END
$$ LANGUAGE plpgsql;

SELECT hello_world();
