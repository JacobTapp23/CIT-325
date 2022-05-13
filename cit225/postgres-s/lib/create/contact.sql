-- ------------------------------------------------------------------
--  Program Name:   contact.sql
--  Lab Assignment: N/A
--  Program Author: Michael McLaughlin
--  Creation Date:  11-Oct-2019
-- ------------------------------------------------------------------
--  Change Log:
-- ------------------------------------------------------------------
--  Change Date    Change Reason
-- -------------  ---------------------------------------------------
--  
-- ==================================================================
--  This creates the system_user table and system_user_s1 sequences.
-- ------------------------------------------------------------------
--    Create and assign bind variable for table name.
-- ==================================================================
SET SESSION "videodb.table_name" = 'contact';
SET CLIENT_MIN_MESSAGES TO ERROR;

--  Verify table name.
SELECT current_setting('videodb.table_name');

-- ------------------------------------------------------------------
--  Conditionally drop table.
-- ------------------------------------------------------------------
DROP TABLE IF EXISTS contact CASCADE;

-- ------------------------------------------------------------------
--  Create table.
-- -------------------------------------------------------------------
CREATE TABLE contact
( contact_id                  SERIAL
, member_id                   INTEGER      NOT NULL
, contact_type                INTEGER      NOT NULL
, first_name                  VARCHAR(20)  NOT NULL
, middle_name                 VARCHAR(20)
, last_name                   VARCHAR(20)  NOT NULL
, created_by                  INTEGER      NOT NULL
, creation_date               TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
, last_updated_by             INTEGER      NOT NULL
, last_update_date            TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
, PRIMARY KEY (contact_id)
, CONSTRAINT fk_contact_1     FOREIGN KEY (member_id) REFERENCES member (member_id)
, CONSTRAINT fk_contact_2     FOREIGN KEY (contact_type) REFERENCES common_lookup (common_lookup_id)
, CONSTRAINT fk_contact_3     FOREIGN KEY (created_by) REFERENCES system_user (system_user_id)
, CONSTRAINT fk_contact_4     FOREIGN KEY (last_updated_by) REFERENCES system_user (system_user_id));

-- Alter the sequence by restarting it at 1001.
ALTER SEQUENCE contact_contact_id_seq RESTART WITH 1001;

-- Display the table organization.
SELECT   tc.table_catalog || '.' || tc.constraint_name AS constraint_name
,        tc.table_catalog || '.' || tc.table_name AS table_name
,        kcu.column_name
,        ccu.table_catalog || '.' || ccu.table_name AS foreign_table_name
,        ccu.column_name AS foreign_column_name
FROM     information_schema.table_constraints AS tc JOIN information_schema.key_column_usage AS kcu
ON       tc.constraint_name = kcu.constraint_name
AND      tc.table_schema = kcu.table_schema JOIN information_schema.constraint_column_usage AS ccu
ON       ccu.constraint_name = tc.constraint_name
AND      ccu.table_schema = tc.table_schema
WHERE    tc.constraint_type = 'FOREIGN KEY'
AND      tc.table_name = current_setting('videodb.table_name')
ORDER BY 1;

SELECT c1.table_name
,      c1.ordinal_position
,      c1.column_name
,      CASE
         WHEN c1.is_nullable = 'NO' AND c2.column_name IS NOT NULL THEN 'PRIMARY KEY'
         WHEN c1.is_nullable = 'NO' AND c2.column_name IS NULL THEN 'NOT NULL'
       END AS is_nullable
,      CASE
         WHEN data_type = 'character varying' THEN
	   data_type||'('||character_maximum_length||')'
         WHEN data_type = 'numeric' THEN
	   CASE
	     WHEN numeric_scale != 0 AND numeric_scale IS NOT NULL THEN
               data_type||'('||numeric_precision||','||numeric_scale||')'
	     ELSE
               data_type||'('||numeric_precision||')'
	     END
         ELSE
           data_type
        END AS data_type
FROM    information_schema.columns c1 LEFT JOIN
          (SELECT trim(regexp_matches(column_default,current_setting('videodb.table_name'))::text,'{}')||'_id' column_name
           FROM   information_schema.columns) c2
ON       c1.column_name = c2.column_name
WHERE    c1.table_name = current_setting('videodb.table_name')
ORDER BY c1.ordinal_position;

-- Display primary key and unique constraints.
SELECT constraint_name
,      lower(constraint_type) AS constraint_type
FROM   information_schema.table_constraints
WHERE  table_name = current_setting('videodb.table_name')
AND    constraint_type IN ('PRIMARY KEY','UNIQUE');

-- Drop index on the context name.
DROP INDEX IF EXISTS nq_contact_n1;

-- Create index on the system user name.
CREATE INDEX nq_contact_n1
  ON contact (member_id);

-- Drop index on the context name.
DROP INDEX IF EXISTS nq_contact_n2;

-- Create index on the system user name.
CREATE INDEX nq_contact_n2
  ON contact (member_id);

-- Display table indexes.
SELECT tablename
,      indexname
FROM   pg_indexes
WHERE  tablename = current_setting('videodb.table_name');

-- Display primary key and unique constraints.
SELECT constraint_name
,      lower(constraint_type) AS constraint_type
FROM   information_schema.table_constraints
WHERE  table_name = current_setting('videodb.table_name')
AND    constraint_type IN ('PRIMARY KEY','UNIQUE');

-- Display table, column, and sequence names.
SELECT table_name
,      column_name
,      trim(regexp_matches(column_default,'''.*''')::text,'{''}') AS sequence_name
FROM   information_schema.columns c1
WHERE  table_name = current_setting('videodb.table_name')
AND    column_name =
 (SELECT trim(regexp_matches(column_default,current_setting('videodb.table_name'))::text,'{}')||'_id'
  FROM   information_schema.columns c2
  WHERE  c1.table_name = c2.table_name);
