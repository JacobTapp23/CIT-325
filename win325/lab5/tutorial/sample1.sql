-- Resource the model.
@/home/student/Data/cit325/lab1/apply_plsql_lab1.sql

-- Drop rating_agnecy_tab table collection.
DROP TYPE rating_agency_tab;

-- Drop rating_agency_obj object type.
DROP TYPE rating_agency_obj;

-- Create object type.
CREATE OR REPLACE
  TYPE rating_agency_obj IS OBJECT
  ( rating_agency_id  NUMBER
  , rating            VARCHAR2(8)
  , rating_agency     VARCHAR2(4));
/

-- Create collection of rating_agency_obj object type.
CREATE OR REPLACE
  TYPE rating_agency_tab IS TABLE OF rating_agency_obj;
/

-- Drop table rating_agency.
DROP TABLE rating_agency;

-- Create table rating agency.
CREATE TABLE rating_agency
( RATING_AGENCY_ID  NUMBER CONSTRAINT pk_rating_agency PRIMARY KEY
, RATING            VARCHAR2(8)
, RATING_AGENCY     VARCHAR2(4) NOT NULL
, created_by        NUMBER
, creation_date     DATE 
, last_updated_by   NUMBER
, last_update_date  DATE );

/* Add the future foreign key column to the table. */
ALTER TABLE item
  ADD ( rating_agency_id  NUMBER );

/* Add a foreign key constraint to the table's column. */
ALTER TABLE item
  ADD CONSTRAINT fk_item_4 FOREIGN KEY (rating_agency_id) 
      REFERENCES rating_agency (rating_agency_id);

-- Drop rating_agency_s1 sequence.
DROP SEQUENCE rating_agency_s1;

-- Drop rating_agcency_s1.
CREATE SEQUENCE rating_agency_s1 START WITH 1001;

-- Declare anonymous block to write to and use a collection.
DECLARE
  /* Declare input values. */
  lv_created_by        NUMBER := 1001;
  lv_creation_date     DATE := SYSDATE;
  lv_last_updated_by   NUMBER := 1001;
  lv_last_update_date  DATE := SYSDATE;

  /* Declare empty collection. */
  lv_rating_agency_tab  RATING_AGENCY_TAB := rating_agency_tab();

  /* Declare a cursor. */
  CURSOR c IS
    SELECT   DISTINCT
             i.item_rating AS rating
    ,        i.item_rating_agency AS rating_agency
    FROM     item i
    ORDER BY i.item_rating_agency DESC
    ,        i.item_rating;
BEGIN
  FOR i IN c LOOP
    /* Allocate memory for one elements in a list. */
    lv_rating_agency_tab.EXTEND;

    /* Add elements to the collection or list. */
    lv_rating_agency_tab(lv_rating_agency_tab.COUNT) :=
      rating_agency_obj( rating_agency_s1.NEXTVAL
                       , i.rating
                       , i.rating_agency );
  END LOOP;

  /* Range FOR loop:
  || ===============
  ||  1. All values should be densely populated, or 
  ||     sequential values.
  ||  2. All lists may have gaps, so we always use
  ||     the LAST function rather than the COUNT
  ||     function to guarantee our code processes
  ||     through the complete set of values.
  ||  3. We always check for gaps and skip them.
  */
  FOR i IN 1..lv_rating_agency_tab.LAST LOOP
    IF lv_rating_agency_tab.EXISTS(i) THEN
      /*
      || We always use named notation when it is 
      || available because somebody can change the
      || definition of the table's structure by 
      || re-ordering the columns. An override list
      || or signature after the table name and before
      || the VALUES clause is how you implement named
      || notation in an INSERT statement. This guarantees
      || your code works when a table's column list is
      || re-ordered.
      */
      INSERT INTO rating_agency
      ( rating_agency_id
      , rating
      , rating_agency
      , created_by
      , creation_date
      , last_updated_by
      , last_update_date )
      VALUES
      /* You refer to elements in the list and then to 
      || members in the structure.
      */
      ( lv_rating_agency_tab(i).rating_agency_id
      , lv_rating_agency_tab(i).rating
      , lv_rating_agency_tab(i).rating_agency
      , lv_created_by
      , lv_creation_date
      , lv_last_updated_by
      , lv_last_update_date );
    END IF;
  END LOOP;

  /* Update the foreign key value. */
  UPDATE item i
  SET    i.rating_agency_id =
          ( SELECT ra.rating_agency_id
            FROM   rating_agency ra
            WHERE  ra.rating = i.item_rating );
END;
/

LIST
SHOW ERRORS

SELECT   i.rating_agency_id
,        i.item_rating
,        COUNT(i.item_rating)
,        ra.rating
FROM     item i JOIN rating_agency ra
ON       i.rating_agency_id = ra.rating_agency_id
GROUP BY i.rating_agency_id
,        i.item_rating
,        ra.rating
ORDER BY 1;
