/*
||  Name:          demo_lab7.sql
||  Date:          11 Nov 2016
||  Purpose:       Complete 325 Chapter 8 lab.
*/

/* Conditionally drop grandma table and grandma_s sequence. */
BEGIN
  FOR i IN (SELECT object_name
            ,      object_type
            FROM   user_objects
            WHERE  object_name IN ('GRANDMA','GRANDMA_SEQ')) LOOP
    IF i.object_type = 'TABLE' THEN
      /* Use the cascade constraints to drop the dependent constraint. */
      EXECUTE IMMEDIATE 'DROP TABLE '||i.object_name||' CASCADE CONSTRAINTS';
    ELSE
      EXECUTE IMMEDIATE 'DROP SEQUENCE '||i.object_name;
    END IF;
  END LOOP;
END;
/
 
/* Create the table. */
CREATE TABLE GRANDMA
( grandma_id     NUMBER       CONSTRAINT grandma_nn1 NOT NULL
, grandma_house  VARCHAR2(30) CONSTRAINT grandma_nn2 NOT NULL
, CONSTRAINT grandma_pk       PRIMARY KEY (grandma_id)
);
 
/* Create the sequence. */
CREATE SEQUENCE grandma_seq;
 
/* Conditionally drop a table and sequence. */
BEGIN
  FOR i IN (SELECT object_name
            ,      object_type
            FROM   user_objects
            WHERE  object_name IN ('TWEETIE_BIRD','TWEETIE_BIRD_SEQ')) LOOP
    IF i.object_type = 'TABLE' THEN
      EXECUTE IMMEDIATE 'DROP TABLE '||i.object_name||' CASCADE CONSTRAINTS';
    ELSE
      EXECUTE IMMEDIATE 'DROP SEQUENCE '||i.object_name;
    END IF;
  END LOOP;
END;
/
 
/* Create the table with primary and foreign key out-of-line constraints. */
CREATE TABLE TWEETIE_BIRD
( tweetie_bird_id     NUMBER        CONSTRAINT tweetie_bird_nn1 NOT NULL
, tweetie_bird_house  VARCHAR2(30)  CONSTRAINT tweetie_bird_nn2 NOT NULL
, grandma_id          NUMBER        CONSTRAINT tweetie_bird_nn3 NOT NULL
, CONSTRAINT tweetie_bird_pk        PRIMARY KEY (tweetie_bird_id)
, CONSTRAINT tweetie_bird_fk        FOREIGN KEY (grandma_id)
  REFERENCES GRANDMA (GRANDMA_ID)
);
 
/* Create sequence. */
CREATE SEQUENCE tweetie_bird_seq;

/* Create or replace procedure warner_brother. */
CREATE OR REPLACE PROCEDURE warner_brother
  ( pv_grandma_house       VARCHAR2
  , pv_tweetie_bird_house  VARCHAR2 ) IS
 
  /* Declare a local variable for an existing grandma_id. */
  lv_grandma_id   NUMBER;
 
  FUNCTION get_grandma_id
  ( pv_grandma_house  VARCHAR2 ) RETURN NUMBER IS
 
    /* Local return variable. */
    lv_retval  NUMBER := 0;  -- Default value is 0.
 
    /* Use a cursor, which will not raise an exception at runtime. */
    CURSOR find_grandma_id
    ( cv_grandma_house  VARCHAR2 ) IS
      SELECT grandma_id
      FROM   grandma
      WHERE  grandma_house = cv_grandma_house;
 
  BEGIN  
 
    /* Assign a value when a row exists. */
    FOR i IN find_grandma_id(pv_grandma_house) LOOP
      lv_retval := i.grandma_id;
    END LOOP;
 
    /* Return 0 when no row found and the ID # when row found. */
    RETURN lv_retval;
  END get_grandma_id;
 
BEGIN
 
  /* Set the savepoint. */
  SAVEPOINT starting;
 
  /* Check for existing grandma row. */
  lv_grandma_id := get_grandma_id(pv_grandma_house);
  IF lv_grandma_id = 0 THEN
 
    /* Insert grandma. */
    INSERT INTO grandma
    ( grandma_id
    , grandma_house )
    VALUES
    ( grandma_seq.NEXTVAL
    , pv_grandma_house );
    /* Assign grandma_seq.currval to local variable. */
    lv_grandma_id := grandma_seq.CURRVAL;
 
  END IF;
 
  /* Insert tweetie bird. */
  INSERT INTO tweetie_bird
  ( tweetie_bird_id
  , tweetie_bird_house 
  , grandma_id )
  VALUES
  ( tweetie_bird_seq.NEXTVAL
  , pv_tweetie_bird_house
  , lv_grandma_id );
 
  /* If the program gets here, both insert statements work. Commit it. */
  COMMIT;
 
EXCEPTION
  /* When anything is broken do this. */
  WHEN OTHERS THEN
    /* Until any partial results. */
    ROLLBACK TO starting;
END;
/

/* Test the warner_brother procedure. */
BEGIN
  warner_brother( pv_grandma_house      => 'Yellow House'
                , pv_tweetie_bird_house => 'Cage');
  warner_brother( pv_grandma_house      => 'Yellow House'
                , pv_tweetie_bird_house => 'Tree House');
END;
/

/* Query results from warner_brother procedure. */
COL grandma_id          FORMAT 9999999  HEADING "Grandma|ID #"
COL grandma_house       FORMAT A20      HEADING "Grandma House"
COL tweetie_bird_id     FORMAT 9999999  HEADING "Tweetie|Bird ID"
COL tweetie_bird_house  FORMAT A20      HEADING "Tweetie Bird House"
SELECT *
FROM   grandma NATURAL JOIN tweetie_bird;

CREATE OR REPLACE
  TYPE string_tab IS TABLE OF VARCHAR2(30);
/

CREATE OR REPLACE 
  PROCEDURE wrapper
  ( pv_grandma_house  VARCHAR2
  , pv_tweetie_bird   STRING_TAB ) IS
  
  BEGIN
    FOR i IN 1..pv_tweetie_bird.LAST LOOP
      warner_brother( pv_grandma_house      => pv_grandma_house
                    , pv_tweetie_bird_house => pv_tweetie_bird(i));
    END LOOP;
  END;
/

LIST
SHOW ERRORS

DECLARE
  lv_grandma_house  VARCHAR2(30) := 'Stone Mansion';
  lv_tweetie_bird   STRING_TAB := string_tab('Front Yard','Back Yard','Boat House');
BEGIN
  wrapper( pv_grandma_house => lv_grandma_house
         , pv_tweetie_bird =>  lv_tweetie_bird );
END;
/

LIST
SHOW ERRORS

SELECT *
FROM   grandma NATURAL JOIN tweetie_bird;
