/* ROLES -> ROLE_ID | ROLE | AUTHENTICATION_TYPE */
SELECT DISTINCT ROLE_ID , ROLE , AUTHENTICATION_TYPE FROM DBA_ROLES;

/* TABLESPACES -> TABLESPACE_NAME | TABLESPACE_SIZE | FREE | USED | PERC_FREE | PERC_USED | STATUS | ALLOCATION_TYPE | CONTENTS | SEGMENT_SPACE_MANAGEMENT | TIMESTAMP | DB */
SELECT DISTINCT T.TABLESPACE_NAME, ROUND((M.TABLESPACE_SIZE*8/1024),2) AS TABLESPACE_SIZE, ROUND((M.TABLESPACE_SIZE-M.USED_SPACE)*8/1024,2) AS FREE, ROUND(M.USED_SPACE*8/1024,2) AS USED, ROUND(100-M.USED_PERCENT,2) AS PERC_FREE, ROUND(M.USED_PERCENT,2) AS PERC_USED, T.STATUS, T.ALLOCATION_TYPE, T.CONTENTS, T.SEGMENT_SPACE_MANAGEMENT 
    FROM DBA_TABLESPACES T LEFT JOIN DBA_TABLESPACE_USAGE_METRICS M ON T.TABLESPACE_NAME = M.TABLESPACE_NAME ORDER BY TABLESPACE_NAME ;

/* DATAFILES -> FILENAME | FILE_ID | TABLESPACE_NAME | BYTES | BLOCKS | STATUS | AUTOEXTENSIBLE | MAXBYTES | MAXBLOCKS | ONLINE_STATUS */
SELECT FILE_NAME , FILE_ID , TABLESPACE_NAME , BYTES , BLOCKS , STATUS , AUTOEXTENSIBLE , MAXBYTES , MAXBLOCKS , ONLINE_STATUS FROM DBA_DATA_FILES;

/* USERS -> USERNAME | ACCOUNT_STATUS | EXPIRY_DATE | DEFAULT_TABLESPACE | TEMPORARY_TABLESPACE | PROFILE | CREATED | COMMON */
SELECT USERNAME , ACCOUNT_STATUS , EXPIRY_DATE , DEFAULT_TABLESPACE , TEMPORARY_TABLESPACE , PROFILE , CREATED , COMMON FROM DBA_USERS;

/* SESSIONS -> SID | USERNAME | STATUS | SERVER | SCHEMANAME | OSUSER | MACHINE | PORT | TYPE | WAIT_TIME_MICRO | LOGON_TIME */
SELECT SID , USERNAME , STATUS , SERVER , SCHEMANAME , OSUSER , MACHINE , PORT , TYPE , WAIT_TIME_MICRO , LOGON_TIME FROM V$SESSION WHERE USERNAME IS NOT NULL;

/* USERS_ROLES -> ROLE_NAME | USERNAME */
SELECT GRANTED_ROLE, GRANTEE FROM DBA_ROLE_PRIVS WHERE GRANTEE in (select USERNAME from DBA_USERS);

/* PROGRAM_GLOBAL_AREA -> NAME | USED <- é uma região da memória que contém dados e informações de controle para um processo do servidor*/
SELECT NAME, VALUE FROM V$PGASTAT WHERE NAME='total PGA inuse' OR NAME='total PGA allocated';

/* SYSTEM_GLOBAL_AREA -> NAME | VALUE  <-  forma a parte da memória (RAM) do sistema compartilhada por todos os processos pertencentes a uma única instância do banco de dados Oracle */
SELECT NAME, VALUE FROM V$SGA; 

/* CPU -> USERNAME | USAGE */
SELECT S.USERNAME, SUM(VALUE/100) as "CPU USAGE (SECONDS)" FROM V$SESSION S, V$SESSTAT t, V$STATNAME N 
    WHERE T.STATISTIC# = N.STATISTIC# AND NAME LIKE '%CPU used by this session%' AND T.SID = S.SID 
        AND S.STATUS='ACTIVE' AND S.USERNAME IS NOT NULL 
    GROUP BY USERNAME, T.SID, S.SERIAL#;
