UPDATE item i
SET    rating_id = r.rating_id
FROM   rating r
WHERE  r.rating = i.item_rating
OR     r.description = i.item_rating;
