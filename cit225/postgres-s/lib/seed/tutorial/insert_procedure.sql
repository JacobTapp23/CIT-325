-- ------------------------------------------------------------------
--  Program Name:   insert_procedure.sql
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

-- Drop table if it exists.
DROP TABLE IF EXISTS big CASCADE;

-- Create big table.
CREATE TABLE big
( big_id     SERIAL
, big_text   VARCHAR(20) NOT NULL
, CONSTRAINT pk_little_1 PRIMARY KEY (big_id));

-- Describe the big table.
\d big

-- Drop the big table if it exists.
DROP TABLE IF EXISTS little;

-- Create big table.
CREATE TABLE little
( little_id     SERIAL
, big_id        INTEGER     NOT NULL
, little_text   VARCHAR(20) NOT NULL
, CONSTRAINT fk_little_1 FOREIGN KEY (big_id) REFERENCES big (big_id));

-- Describe the big table.
\d little

-- Insert into the big table.
INSERT INTO big
(big_text)
VALUES
('Cat in the Hat 1');

-- Insert into a row into the big table.
INSERT INTO little
(big_id
,little_text)
VALUES
((SELECT CURRVAL('big_big_id_seq'))
,'Thing 1');

-- Insert into a row into the big table.
INSERT INTO little
(big_id
,little_text)
VALUES
((SELECT CURRVAL('big_big_id_seq'))
,'Thing 2');

-- Query the join between the big and little tables.
SELECT *
FROM   big b JOIN little l ON b.big_id = l.big_id;

DROP PROCEDURE IF EXISTS insert_procedure
( IN pv_cat_name    varchar(20)
, IN pv_thing_Name  varchar(20));

CREATE PROCEDURE insert_procedure
( IN pv_cat_name    varchar(20)
, IN pv_thing_Name  varchar(20)) AS
$$
BEGIN
  /* Insert into the parent table. */
  INSERT INTO big
  ( big_text )
  VALUES
  ( pv_cat_name );

  /* Insert into the child table. */
  INSERT INTO little
  ( big_id
  , little_text )
  VALUES
  ( CURRVAL('big_big_id_seq')
  , pv_thing_name );

  /* Commit the transaction. */
  COMMIT;
END
$$ LANGUAGE plpgsql;

-- Call the insert_set function.
CALL insert_procedure('Cat in the Hat 2','Thing 3');

-- Query the join between the big and little tables.
SELECT *
FROM   big b JOIN little l ON b.big_id = l.big_id;
