-- ------------------------------------------------------------------
--  Program Name:   apply_lab9_tool2.sql
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
--   psql> \i apply_lab9_tool2.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Task #1: Create seed_account_list() procedure.
-- -------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE update_member_account() AS
$$
DECLARE
  /* Declare local variables. */
  lv_account_number  VARCHAR(10);
  lv_member_record   RECORD;

  /* Declare error handling variables. */
  err_num      TEXT;
  err_msg      INTEGER;

  /* Declare an airport code cursor. */
  member_cursor CURSOR FOR
    SELECT   DISTINCT
             m.member_id
    ,        a.city
    ,        a.state_province
    FROM     member m INNER JOIN contact c
    ON       m.member_id = c.member_id INNER JOIN address a
    ON       c.contact_id = a.contact_id
    ORDER BY m.member_id;

BEGIN
  /* Open airport cursor. */
  OPEN member_cursor;
  << member_loop >>
  LOOP
    /* FETCH airport code into local variable. */
    FETCH member_cursor INTO lv_member_record;

    /* Exit when there are no more members. */
    EXIT member_loop WHEN NOT FOUND;

    /* Secure a unique account number as they're consumed
       from the list. */
    SELECT   al.account_number
    INTO     lv_account_number
    FROM     account_list al INNER JOIN airport ap
    ON       SUBSTRING(al.account_number,1,3) = ap.airport_code
    WHERE    ap.city = lv_member_record.city
    AND      ap.state_province = lv_member_record.state_province
    AND      al.consumed_by IS NULL
    AND      al.consumed_date IS NULL
    LIMIT    1;

    /* Update a member record with a unique account number. */
    UPDATE member
    SET    account_number = lv_account_number
    WHERE  member_id = lv_member_record.member_id;

    /* Mark account_list record consumed. */
    UPDATE account_list
    SET    consumed_by = 1002
    ,      consumed_date = current_date
    WHERE  account_number = lv_account_number;

  END LOOP;

  /* Close airport code cursor. */
  CLOSE member_cursor;

EXCEPTION
  WHEN OTHERS THEN
    err_num := SQLSTATE;
    err_msg := SUBSTR(SQLERRM,1,100);
    RAISE NOTICE 'Trapped Error: %', err_msg;
END
$$ LANGUAGE plpgsql;
