-- ------------------------------------------------------------------
--  Program Name:   cleanup_catalog.sql
--  Lab Assignment: N/A
--  Program Author: Michael McLaughlin
--  Creation Date:  26-Oct-2019
-- ------------------------------------------------------------------
--  Change Log:
-- ------------------------------------------------------------------
--  Change Date    Change Reason
-- -------------  ---------------------------------------------------
--  
-- ==================================================================
--  This drops all designated objects by calling modules.
-- ==================================================================

\o ./logs/drop_tables.txt    \i C:/Data/cit225/postgres-s/lib/utility/drop_tables.sql
\o ./logs/drop_sequences.txt \i C:/Data/cit225/postgres-s/lib/utility/drop_sequences.sql
\o ./logs/drop_routines.txt  \i C:/Data/cit225/postgres-s/lib/utility/drop_routines.sql
\o ./logs/drop_triggers.txt  \i C:/Data/cit225/postgres-s/lib/utility/drop_triggers.sql
