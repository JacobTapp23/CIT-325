-- Create my subtype under the base_t type.
CREATE OR REPLACE
  TYPE BODY item_t IS

    /* Default constructor, implicitly available, but you should
       include it for those who forget that fact. */
    CONSTRUCTOR FUNCTION item_t
    ( oname               VARCHAR2
    , name                VARCHAR2
    , ITEM_ID             NUMBER
    , ITEM_BARCODE        VARCHAR2
    , ITEM_TYPE           NUMBER
    , ITEM_TITLE          VARCHAR2
    , ITEM_SUBTITLE       VARCHAR2
    , ITEM_RATING         VARCHAR2
    , ITEM_RATING_AGENCY  VARCHAR2
    , ITEM_RELEASE_DATE   DATE
    , CREATED_BY          NUMBER
    , CREATION_DATE       DATE
    , LAST_UPDATED_BY     NUMBER
    , LAST_UPDATE_DATE    DATE ) RETURN SELF AS RESULT IS
    BEGIN
      /* Assign inputs to instance variables. */    
      self.oname := oname;
      self.name  := name;

      /* Assign a designated value or assign a null value. */
      IF name IS NOT NULL AND name IN ('NEW','OLD') THEN
        self.name := name;
      END IF;

      /* Assign inputs to instance variables. */  
      self.item_id := item_id;
      self.item_barcode := item_barcode;
      self.item_type := item_type;
      self.item_title := item_title;
      self.item_subtitle := item_subtitle;
      self.item_rating := item_rating;
      self.item_rating_agency := item_rating_agency;
      self.item_release_date := item_release_date;
      self.created_by := created_by;
      self.creation_date := creation_date;
      self.last_updated_by := last_updated_by;
      self.last_update_date := last_update_date;

      /* Return an instance of self. */
      RETURN;
    END;

    /* An overriding function for the generalized class. */
    OVERRIDING MEMBER FUNCTION get_name RETURN VARCHAR2 IS
    BEGIN
      RETURN (self AS base_t).get_name();
    END get_name;

    /* An overriding function for the generalized class. */
    OVERRIDING MEMBER FUNCTION to_string RETURN VARCHAR2 IS
    BEGIN
      RETURN (self AS base_t).to_string()||'.['||self.name||']';
    END to_string;
  END;
/
