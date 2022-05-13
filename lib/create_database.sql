DECLARE
 /* Control variable. */
 container  BOOLEAN := FALSE;
 
 /* Weakly structured system reference cursor. */
 container_sql  SYS_REFCURSOR;
 
 /* Constant required for pre-container databases to avoid a
    a compile time error. */
 sql_statement  CONSTANT VARCHAR2(50) :=
                  'SELECT cdb FROM v$database WHERE cdb = ''YES''';
BEGIN
 /* Check if the current user is the superuser. */
 FOR i IN (SELECT USER FROM dual) LOOP
 
   /* Perform tasks as superuser. */
   IF i.USER = 'SYSTEM' THEN
     /* Check for a container-enabled column, which enables this to
        work in both pre-container Oracle databases, like 10g and 11g. */
     FOR j IN (SELECT DISTINCT column_name
               FROM   dba_tab_columns
               WHERE  column_name = 'CDB') LOOP
 
       /* Check for a container database, set control variable
          and exit when found. */
       OPEN container_sql FOR sql_statement;
       LOOP
         container := TRUE;
         EXIT WHEN container_sql%FOUND;
       END LOOP;
     END LOOP;
 
      /* Conditionally drop existing user and role. */   
      IF container THEN
        /* Conditionally drop a container user. */
        FOR j IN (SELECT username
                  FROM   dba_users
                  WHERE  username = 'C##STUDENT') LOOP
          EXECUTE IMMEDIATE 'DROP USER c##student CASCADE';
        END LOOP;
 
        /* Conditionally rop the container c##studentrole role. */
        FOR j IN (SELECT ROLE
                  FROM   dba_roles
                  WHERE  ROLE = 'C##STUDENTROLE') LOOP
          EXECUTE IMMEDIATE 'DROP ROLE c##studentrole';
        END LOOP;
 
        /* Create a container user with 200 MB of space. */
        EXECUTE IMMEDIATE 'CREATE USER c##student'||CHR(10)
        ||                'IDENTIFIED BY student'||CHR(10)
        ||                'DEFAULT TABLESPACE users'||CHR(10)
        ||                'QUOTA 200M ON users'||CHR(10)
        ||                'TEMPORARY TABLESPACE temp';
 
        /* Create a container role. */
        EXECUTE IMMEDIATE 'CREATE ROLE c##studentrole CONTAINER = ALL';
 
        /* Grant privileges to a container user. */
        EXECUTE IMMEDIATE 'GRANT CREATE CLUSTER, CREATE INDEXTYPE,'||CHR(10)
        ||                'CREATE PROCEDURE, CREATE SEQUENCE,'||CHR(10)
        ||                'CREATE SESSION, CREATE TABLE,'||CHR(10)
        ||                'CREATE TRIGGER, CREATE TYPE,'||CHR(10)
        ||                'CREATE VIEW TO c##studentrole';
 
        /* Grant role to user. */
        EXECUTE IMMEDIATE 'GRANT c##studentrole TO c##student';
      ELSE
        /* Conditonally drop the non-container database user. */
        FOR j IN (SELECT username
                  FROM   dba_users
                  WHERE  username = 'STUDENT') LOOP
          EXECUTE IMMEDIATE 'DROP USER student CASCADE';
        END LOOP;
 
        /* Create the student database. */
        EXECUTE IMMEDIATE 'CREATE USER student'||CHR(10)
        ||                'IDENTIFIED BY student'||CHR(10)
        ||                'DEFAULT TABLESPACE users'||CHR(10)
        ||                'QUOTA 200M ON users'||CHR(10)
        ||                'TEMPORARY TABLESPACE temp';
 
        /* Grant necessary privileges to the student database. */
        EXECUTE IMMEDIATE 'GRANT CREATE CLUSTER, CREATE INDEXTYPE,'||CHR(10)
        ||                'CREATE PROCEDURE, CREATE SEQUENCE,'||CHR(10)
        ||                'CREATE SESSION, CREATE TABLE,'||CHR(10)
        ||                'CREATE TRIGGER, CREATE TYPE,'||CHR(10)
        ||                'CREATE VIEW TO student';
       END IF;
    ELSE
      /* Print an message that the user lacks privilegs. */
      dbms_output.put_line('You must be the SYSTEM user to drop and create a user.');
    END IF;
  END LOOP;
END;
/