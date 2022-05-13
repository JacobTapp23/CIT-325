UPDATE item i
SET    i.rating_id =
WHERE  EXISTS
         (SELECT NULL
          FROM   rental r
	  WHERE  r.rating = i.item_rating
          OR     r.description = i.item_rating);
