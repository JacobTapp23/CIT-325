-- ------------------------------------------------------------------
--  Program Name:   preseed_store.sql
--  Lab Assignment: N/A
--  Program Author: Michael McLaughlin
--  Creation Date:  09-Oct-2019
-- ------------------------------------------------------------------
--  Change Log:
-- ------------------------------------------------------------------
--  Change Date    Change Reason
-- -------------  ---------------------------------------------------
--  21-Feb-2022    Modified to run from Windows OS.
-- ------------------------------------------------------------------
-- This creates tables, sequences, indexes, and constraints necessary
-- to begin lesson #3. Demonstrates proper process and syntax.
-- ------------------------------------------------------------------

-- --------------------------------------------------------
--  Step #1
--  -------
--  Disable foreign key constraints dependencies.
-- --------------------------------------------------------
ALTER TABLE system_user
  DROP CONSTRAINT fk_system_user_3;

ALTER TABLE system_user
  DROP CONSTRAINT fk_system_user_4;

-- --------------------------------------------------------
--  Step #2
--  -------
--  Alter the table to remove not null constraints.
-- --------------------------------------------------------
ALTER TABLE system_user
  ALTER COLUMN system_user_group_id DROP NOT NULL;

ALTER TABLE system_user
  ALTER COLUMN system_user_type DROP NOT NULL;

-- --------------------------------------------------------
--  Step #3
--  -------
--  Insert partial data set for preseeded system_user.
-- --------------------------------------------------------
INSERT INTO system_user
( system_user_id
, system_user_name
, system_user_group_id
, system_user_type
, created_by
, last_updated_by )
VALUES
( 1            -- system_user_id
,'SYSADMIN'    -- system_user_name
, null         -- system_user_group_id            
, null         -- system_user_type
, 1            -- created_by
, 1            -- last_updated_by
);

-- --------------------------------------------------------
--  Step #4
--  -------
--  Disable foreign key constraints dependencies.
-- --------------------------------------------------------
ALTER TABLE common_lookup
  DROP CONSTRAINT fk_clookup_1;

ALTER TABLE common_lookup
  DROP CONSTRAINT fk_clookup_2;

-- --------------------------------------------------------
--  Step #5
--  -------
--  Insert data set for preseeded common_lookup table.
-- --------------------------------------------------------
INSERT INTO common_lookup
( common_lookup_context
, common_lookup_type
, common_lookup_meaning
, created_by
, last_updated_by )
VALUES
('SYSTEM_USER'                -- common_lookup_context
,'SYSTEM_ADMIN'               -- common_lookup_type
,'System Administrator'       -- common_lookup_meaning
, 1                           -- created_by
, 1                           -- last_updated_by
);

INSERT INTO common_lookup
( common_lookup_context
, common_lookup_type
, common_lookup_meaning
, created_by
, last_updated_by )
VALUES
('SYSTEM_USER'                -- common_lookup_context
,'DBA'                        -- common_lookup_type
,'Database Administrator'     -- common_lookup_meaning
, 1                           -- created_by
, 1                           -- last_updated_by
);

INSERT INTO common_lookup
( common_lookup_context
, common_lookup_type
, common_lookup_meaning
, created_by
, last_updated_by )
 VALUES
('SYSTEM_USER'                -- common_lookup_context
,'SYSTEM_GROUP'               -- common_lookup_type
,'System Group'              -- common_lookup_meaning
, 1                           -- created_by
, 1                           -- last_updated_by
);

INSERT INTO common_lookup
( common_lookup_context
, common_lookup_type
, common_lookup_meaning
, created_by
, last_updated_by )
VALUES
('SYSTEM_USER'                -- common_lookup_context
,'COST_CENTER'                -- common_lookup_type
,'Cost Center'                -- common_lookup_meaning
, 1                           -- created_by
, 1                           -- last_updated_by
);

INSERT INTO common_lookup
( common_lookup_context
, common_lookup_type
, common_lookup_meaning
, created_by
, last_updated_by )
VALUES
('SYSTEM_USER'                -- common_lookup_context
,'INDIVIDUAL'                 -- common_lookup_type
,'Individual'                 -- common_lookup_meaning
, 1                           -- created_by
, 1                           -- last_updated_by
);

INSERT INTO common_lookup
( common_lookup_context
, common_lookup_type
, common_lookup_meaning
, created_by
, last_updated_by )
VALUES
('CONTACT'                    -- common_lookup_context
,'EMPLOYEE'                   -- common_lookup_type
,'Employee'                   -- common_lookup_meaning
, 1                           -- created_by
, 1                           -- last_updated_by
);

INSERT INTO common_lookup
( common_lookup_context
, common_lookup_type
, common_lookup_meaning
, created_by
, last_updated_by )
VALUES
('CONTACT'                    -- common_lookup_context
,'CUSTOMER'                   -- common_lookup_type
,'Customer'                   -- common_lookup_meaning
, 1                           -- created_by
, 1                           -- last_updated_by
);

INSERT INTO common_lookup
( common_lookup_context
, common_lookup_type
, common_lookup_meaning
, created_by
, last_updated_by )
VALUES
('MEMBER'                     -- common_lookup_context
,'INDIVIDUAL'                 -- common_lookup_type
,'Individual Membership'      -- common_lookup_meaning
, 1                           -- created_by
, 1                           -- last_updated_by
);

INSERT INTO common_lookup
( common_lookup_context
, common_lookup_type
, common_lookup_meaning
, created_by
, last_updated_by )
VALUES
('MEMBER'                     -- common_lookup_context
,'GROUP'                      -- common_lookup_type
,'Group Membership'           -- common_lookup_meaning
, 1                           -- created_by
, 1                           -- last_updated_by
);

INSERT INTO common_lookup
( common_lookup_context
, common_lookup_type
, common_lookup_meaning
, created_by
, last_updated_by )
VALUES
('MEMBER'                     -- common_lookup_context
,'DISCOVER_CARD'              -- common_lookup_type
,'Discover Card'              -- common_lookup_meaning
, 1                           -- created_by
, 1                           -- last_updated_by
);

INSERT INTO common_lookup
( common_lookup_context
, common_lookup_type
, common_lookup_meaning
, created_by
, last_updated_by )
VALUES
('MEMBER'                     -- common_lookup_context
,'MASTER_CARD'                -- common_lookup_type
,'Master Card'                -- common_lookup_meaning
, 1                           -- created_by
, 1                           -- last_updated_by
);

INSERT INTO common_lookup
( common_lookup_context
, common_lookup_type
, common_lookup_meaning
, created_by
, last_updated_by )
VALUES
('MEMBER'                     -- common_lookup_context
,'VISA_CARD'                  -- common_lookup_type
,'Visa Card'                  -- common_lookup_meaning
, 1                           -- created_by
, 1                           -- last_updated_by
);

INSERT INTO common_lookup
( common_lookup_context
, common_lookup_type
, common_lookup_meaning
, created_by
, last_updated_by )
VALUES
('MULTIPLE'                   -- common_lookup_context
,'HOME'                       -- common_lookup_type
,'Home'                       -- common_lookup_meaning
, 1                           -- created_by
, 1                           -- last_updated_by
);

INSERT INTO common_lookup
( common_lookup_context
, common_lookup_type
, common_lookup_meaning
, created_by
, last_updated_by )
VALUES
('MULTIPLE'                   -- common_lookup_context
,'WORK'                       -- common_lookup_type
,'Work'                       -- common_lookup_meaning
, 1                           -- created_by
, 1                           -- last_updated_by
);

INSERT INTO common_lookup
( common_lookup_context
, common_lookup_type
, common_lookup_meaning
, created_by
, last_updated_by )
VALUES
('ITEM'                       -- common_lookup_context
,'DVD_FULL_SCREEN'            -- common_lookup_type
,'DVD: Full Screen'           -- common_lookup_meaning
, 1                           -- created_by
, 1                           -- last_updated_by
);

INSERT INTO common_lookup
( common_lookup_context
, common_lookup_type
, common_lookup_meaning
, created_by
, last_updated_by )
VALUES
('ITEM'                       -- common_lookup_context
,'DVD_WIDE_SCREEN'            -- common_lookup_type
,'DVD: Wide Screen'           -- common_lookup_meaning
, 1                           -- created_by
, 1                           -- last_updated_by
);

INSERT INTO common_lookup
( common_lookup_context
, common_lookup_type
, common_lookup_meaning
, created_by
, last_updated_by )
VALUES
('ITEM'                       -- common_lookup_context
,'NINTENDO_GAMECUBE'          -- common_lookup_type
,'Nintendo Gamecube'          -- common_lookup_meaning
, 1                           -- created_by
, 1                           -- last_updated_by
);

INSERT INTO common_lookup
( common_lookup_context
, common_lookup_type
, common_lookup_meaning
, created_by
, last_updated_by )
VALUES
('ITEM'                       -- common_lookup_context
,'PLAYSTATION2'               -- common_lookup_type
,'Playstation2'               -- common_lookup_meaning
, 1                           -- created_by
, 1                           -- last_updated_by
);

INSERT INTO common_lookup
( common_lookup_context
, common_lookup_type
, common_lookup_meaning
, created_by
, last_updated_by )
VALUES
('ITEM'                       -- common_lookup_context
,'XBOX'                       -- common_lookup_type
,'XBOX'                       -- common_lookup_meaning
, 1                           -- created_by
, 1                           -- last_updated_by
);

INSERT INTO common_lookup
( common_lookup_context
, common_lookup_type
, common_lookup_meaning
, created_by
, last_updated_by )
VALUES
('ITEM'                       -- common_lookup_context
,'BLU-RAY'                    -- common_lookup_type
,'Blu-ray'                    -- common_lookup_meaning
, 1                           -- created_by
, 1                           -- last_updated_by
);

-- --------------------------------------------------------
--  Step #6
--  -------
--  Display the preseeded values in the common_lookup table.
-- --------------------------------------------------------
SELECT   common_lookup_id
,        common_lookup_context
,        common_lookup_type
FROM     common_lookup;

-- --------------------------------------------------------
--  Step #7
--  -------
--  Write two queries using the COMMON_LOOKUP table:
--  --------------------------------------------------
--   One finds the primary key values for the
--   SYSTEM_USER_GROUP_ID in the COMMON_LOOKUP table.
--   Another finds the primary key values for the 
--   SYSTEM_USER_TYPE in the COMMON_LOOKUP table.
--  --------------------------------------------------
--  Both queries use the COMMON_LOOKUP_CONTEXT and
--  COMMON_LOOKUP_TYPE columns.
-- --------------------------------------------------------
SELECT   common_lookup_id AS "system_user_type"
FROM     common_lookup
WHERE    common_lookup_context = 'SYSTEM_USER'
AND      common_lookup_type = 'SYSTEM_ADMIN';

SELECT   common_lookup_id AS "system_group_group_id"
FROM     common_lookup
WHERE    common_lookup_context = 'SYSTEM_USER'
AND      common_lookup_type = 'SYSTEM_GROUP';

-- --------------------------------------------------------
--  Step #8
--  -------
--  Update the SYSTEM_USER_GROUP_ID and SYSTEM_USER_TYPE
--  columns in the SYSTEM_USER table.
-- --------------------------------------------------------
UPDATE system_user
SET    system_user_group_id = 
         (SELECT   common_lookup_id
          FROM     common_lookup
          WHERE    common_lookup_context = 'SYSTEM_USER'
          AND      common_lookup_type = 'SYSTEM_ADMIN')
WHERE  system_user_id = 1;

-- Display results.
SELECT   system_user_id
,        system_user_name
,        system_user_group_id
,        system_user_type
FROM     system_user
WHERE    system_user_id = 1;

UPDATE system_user
SET    system_user_type = 
         (SELECT   common_lookup_id
          FROM     common_lookup
          WHERE    common_lookup_context = 'SYSTEM_USER'
          AND      common_lookup_type = 'SYSTEM_GROUP')
WHERE  system_user_id = 1;

-- Display results.
SELECT   system_user_id
,        system_user_name
,        system_user_group_id
,        system_user_type
FROM     system_user
WHERE    system_user_id = 1;

-- --------------------------------------------------------
--  Step #9
--  --------
--  Enable foreign key constraints dependencies.
-- --------------------------------------------------------
-- Enable fk_system_user_3 constraint.
ALTER TABLE system_user
  ADD CONSTRAINT fk_system_user_3 FOREIGN KEY (system_user_group_id)
      REFERENCES common_lookup (common_lookup_id);

-- Enable fk_system_user_4 constraint.
ALTER TABLE system_user
  ADD CONSTRAINT fk_system_user_4 FOREIGN KEY (system_user_type)
      REFERENCES common_lookup (common_lookup_id);

-- Enable fk_clookup_1 constraint.
ALTER TABLE common_lookup
  ADD CONSTRAINT fk_clookup_1 FOREIGN KEY (created_by) REFERENCES system_user (system_user_id);

ALTER TABLE common_lookup
  ADD CONSTRAINT fk_clookup_2 FOREIGN KEY (last_updated_by) REFERENCES system_user (system_user_id);

-- --------------------------------------------------------
--  Step #10
--  --------
--  Alter the table to add not null constraints.
-- --------------------------------------------------------
ALTER TABLE system_user
  ALTER COLUMN system_user_group_id SET NOT NULL;

ALTER TABLE system_user
  ALTER COLUMN system_user_type SET NOT NULL;

-- --------------------------------------------------------
--  Step #11
--  --------
--  Insert row in the system_user table with subqueries.
-- --------------------------------------------------------
INSERT INTO system_user
( system_user_name
, system_user_group_id
, system_user_type
, first_name
, middle_name
, last_name
, created_by
, last_updated_by )
VALUES
('DBA1'                                           -- system_user_name
,(SELECT   common_lookup_id
  FROM     common_lookup
  WHERE    common_lookup_context = 'SYSTEM_USER'
  AND      common_lookup_type = 'DBA')            -- system_user_group_id            
,(SELECT   common_lookup_id
  FROM     common_lookup
  WHERE    common_lookup_context = 'SYSTEM_USER'
  AND      common_lookup_type = 'SYSTEM_GROUP')   -- system_user_type
,'Phineas'
,'Taylor'
,'Barnum'
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- created_by
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- last_updated_by
);

INSERT INTO system_user
( system_user_name
, system_user_group_id
, system_user_type
, first_name
, last_name
, created_by
, last_updated_by )
VALUES
('DBA2'                                           -- system_user_name
,(SELECT   common_lookup_id
  FROM     common_lookup
  WHERE    common_lookup_context = 'SYSTEM_USER'
  AND      common_lookup_type = 'DBA')            -- system_user_group_id            
,(SELECT   common_lookup_id
  FROM     common_lookup
  WHERE    common_lookup_context = 'SYSTEM_USER'
  AND      common_lookup_type = 'SYSTEM_GROUP')   -- system_user_type
,'Phileas'
,'Fogg'
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- created_by
,(SELECT   system_user_id
  FROM     system_user
  WHERE    system_user_name = 'SYSADMIN')         -- last_updated_by
);

-- --------------------------------------------------------
--  Step #12
--  --------
--  Display inserted rows from the system_user table.
-- --------------------------------------------------------
SELECT   system_user_id
,        system_user_group_id
,        system_user_type
,        system_user_name
,        last_name || ', ' || first_name
||       CASE
           WHEN middle_name IS NOT NULL THEN middle_name
	   ELSE ''
         END AS full_user_name
FROM     system_user;
