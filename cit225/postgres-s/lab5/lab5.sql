-- Create the function.
CREATE FUNCTION hello_world(whom VARCHAR)
RETURNS TEXT AS
$$
DECLARE
  output  VARCHAR(20);
BEGIN
  /* Query the string into a local variable. */
  IF whom IS NULL OR LENGTH(whom) = 0 THEN
    SELECT 'Hello World!' INTO output;
  ELSE
    SELECT CONCAT('Hello ', whom, '!') INTO output;
  END IF;
 
 
  /* Return the output text variable. */
  RETURN output;
END
$$ LANGUAGE plpgsql;
 
-- Call the function.
SELECT hello_world();
SELECT hello_world(NULL) AS output;
SELECT hello_world('') AS output;
SELECT hello_world('Harry') AS output;


