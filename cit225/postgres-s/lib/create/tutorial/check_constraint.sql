DROP TABLE IF EXISTS demo;

CREATE TABLE demo
( demo_id    SERIAL
, demo_text  VARCHAR(20) CONSTRAINT nn_demo_1 NOT NULL );

SELECT substr(check_clause,1,strpos(check_clause,' ')-1) AS check_column
,      constraint_name
FROM   information_schema.check_constraints
WHERE  check_clause LIKE 'demo_text%';
