-- Drop table collection.
DROP TYPE rating_agency_tab;

-- Drop object type.
DROP TYPE rating_agency_obj;

-- Create object type.
CREATE OR REPLACE
  TYPE rating_agency_obj IS OBJECT
  ( rating_agency_id  NUMBER
  , rating            VARCHAR2(8)
  , rating_agency     VARCHAR2(4));
/

DROP TABLE rating_agency;

CREATE TABLE rating_agency
( RATING_AGENCY_ID  NUMBER
, RATING            VARCHAR2(8)
, RATING_AGENCY     VARCHAR2(4) NOT NULL
, created_by        NUMBER
, creation_date     DATE 
, last_updated_by   NUMBER
, last_update_date  DATE );

DROP SEQUENCE rating_agency_s1;

CREATE SEQUENCE rating_agency_s1 START WITH 1001;

-- Create collection of object type.
CREATE OR REPLACE
  TYPE rating_agency_tab IS TABLE OF rating_agency_obj;
/

CREATE OR REPLACE
  PROCEDURE rating_agency_insert
  ( record_set  RATING_AGENCY_TAB ) IS
  BEGIN
    FOR i IN 1..record_set.LAST LOOP
      INSERT INTO rating_agency
      ( rating_agency_id
      , rating
      , rating_agency
      , created_by
      , creation_date
      , last_updated_by
      , last_update_date )
      VALUES
      ( record_set(i).rating_agency_id
      , record_set(i).rating
      , record_set(i).rating_agency
      , lv_created_by
      , lv_creation_date
      , lv_last_updated_by
      , lv_last_update_date );
    END LOOP;
  END;
/

LIST
SHOW ERRORS

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
    SELECT DISTINCT
           i.item_rating
    ,      i.item_rating_agency
    FROM   item i
    ORDER BY i.item_rating_agency DESC
    ,        i.item_rating;
BEGIN
  FOR i IN c LOOP
    /* Allocate memory for one elements in a list. */
    lv_rating_agency_tab.EXTEND;

    /* Add elements to the collection or list. */
    lv_rating_agency_tab(lv_rating_agency_tab.COUNT) :=
      rating_agency_obj( rating_agency_s1.NEXTVAL
                       , i.item_rating
                       , i.item_rating_agency );
  END LOOP;

  rating_agency_insert(lv_rating_agency_tab);

END;
/

LIST
SHOW ERRORS

SELECT * FROM rating_agency;
