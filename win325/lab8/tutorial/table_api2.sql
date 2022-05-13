CREATE OR REPLACE PACKAGE table_api IS
  /* Insert row, copy primary key for subordinate foreign key value. */
  FUNCTION grandma 
  ( pv_grandma_id     NUMBER
  , pv_grandma_house  VARCHAR2 ) RETURN NUMBER;

  /* Insert row in tweetie_bird table at bottom of chain. */
  FUNCTION tweetie_bird 
  ( pv_tweetie_bird_house  VARCHAR2
  , pv_grandma_id          NUMBER ) RETURN NUMBER;
END;
/

LIST
SHOW ERRORS

CREATE OR REPLACE PACKAGE BODY table_api IS

  /* Insert row, copy primary key for subordinate foreign key value. */
  FUNCTION grandma 
  ( pv_grandma_id     NUMBER
  , pv_grandma_house  VARCHAR2 ) RETURN NUMBER IS

  BEGIN
    /* Insert row into grandma table. */
    INSERT INTO grandma
    ( grandma_id
    , grandma_house )
    VALUES
    ( grandma_seq.NEXTVAL
    , pv_grandma_house );

    /* Return the copy of the primary key. */
    RETURN grandma_seq.CURRVAL;
  END;

  /* Insert row in tweetie_bird table at bottom of chain. */
  FUNCTION tweetie_bird 
  ( pv_tweetie_bird_house  VARCHAR2
  , pv_grandma_id          NUMBER ) RETURN NUMBER IS

  BEGIN
    /* Insert row into tweetie_bird table. */
    INSERT INTO tweetie_bird
    ( tweetie_bird_id
    , tweetie_bird_house
    , grandma_id )
    VALUES
    ( tweetie_bird_seq.NEXTVAL
    , pv_tweetie_bird_house
    , pv_grandma_id );

    /* Return the copy of the primary key. */
    RETURN tweetie_bird_seq.CURRVAL;
  END;
END;
/

LIST
SHOW ERRORS
