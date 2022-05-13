-- Resource the model.
@/home/student/Data/cit325/lab1/apply_plsql_lab1.sql

-- Drop rating_agnecy_tab table collection.

-- Drop rating_agency_obj object type.

-- Create object type.
CREATE OR REPLACE
/

-- Create collection of rating_agency_obj object type.
CREATE OR REPLACE
/

-- Drop table rating_agency.

-- Create table rating agency.

/* Add the future foreign key column to the table. */

/* Add a foreign key constraint to the table's column. */

-- Drop rating_agency_s1 sequence.

-- Drop rating_agcency_s1.

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

    /* Add elements to the collection or list. */

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
      ( ... 
      );
    END IF;
  END LOOP;

  /* Update the foreign key value. */
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
