-- ------------------------------------------------------------------
--  Program Name:   apply_lab9_step4.sql
--  Lab Assignment: Lab #9
--  Program Author: Michael McLaughlin
--  Creation Date:  07-Nov-2019
-- ------------------------------------------------------------------
--  Change Log:
-- ------------------------------------------------------------------
--  Change Date    Change Reason
-- -------------  ---------------------------------------------------
--  
-- ------------------------------------------------------------------
--
-- ------------------------------------------------------------------
-- Instructions:
-- ------------------------------------------------------------------
-- You first connect to the Postgres database with this syntax:
--
--   psql -U student -d videodb -W
--
-- Then, you call this script with the following syntax:
--
--   psql> \i apply_lab9_step4.sql
--
-- ------------------------------------------------------------------

-- ------------------------------------------------------------------
--  Task #1: Insert 6 rows in the airport table.
-- -------------------------------------------------------------------

-- Insert row into the airport table.
INSERT INTO airport
( airport_code
, airport_city
, city
, state_province
, created_by
, last_updated_by )
VALUES
('LAX'
,'Los Angeles'
,'Los Angeles'
,'California'
, 1001
, 1001);

-- Insert row into the airport table.
INSERT INTO airport
( airport_code
, airport_city
, city
, state_province
, created_by
, last_updated_by )
VALUES
('SLC'
,'Salt Lake City'
,'Provo'
,'Utah'
, 1001
, 1001);

-- Insert row into the airport table.
INSERT INTO airport
( airport_code
, airport_city
, city
, state_province
, created_by
, last_updated_by )
VALUES
('SLC'
,'Salt Lake City'
,'Spanish Fork'
,'Utah'
, 1001
, 1001);

-- Insert row into the airport table.
INSERT INTO airport
( airport_code
, airport_city
, city
, state_province
, created_by
, last_updated_by )
VALUES
('SFO'
,'San Francisco'
,'San Francisco'
,'California'
, 1001
, 1001);

-- Insert row into the airport table.
INSERT INTO airport
( airport_code
, airport_city
, city
, state_province
, created_by
, last_updated_by )
VALUES
('SJC'
,'San Jose'
,'San Jose'
,'California'
, 1001
, 1001);

-- Insert row into the airport table.
INSERT INTO airport
( airport_code
, airport_city
, city
, state_province
, created_by
, last_updated_by )
VALUES
('SJC'
,'San Jose'
,'San Carlos'
,'California'
, 1001
, 1001);
