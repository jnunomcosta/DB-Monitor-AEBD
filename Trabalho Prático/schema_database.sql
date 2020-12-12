
  CREATE TABLE "MONITOR"."CPU" 
   (	"USERNAME" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"USAGE" NUMBER NOT NULL ENABLE, 
	"TIMESTAMP" DATE NOT NULL ENABLE, 
	 CONSTRAINT "CPU_PK" PRIMARY KEY ("USERNAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;


    CREATE TABLE "MONITOR"."CPU_HISTORIC" 
   (	"USERNAME" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"USAGE" NUMBER, 
	"TIMESTAMP" DATE, 
	 CONSTRAINT "CPU_HISTORIC_PK" PRIMARY KEY ("USERNAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;

    CREATE TABLE "MONITOR"."PROGRAM_GLOBAL_AREA" 
   (	"NAME" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"USED" NUMBER NOT NULL ENABLE, 
	"TIMESTAMP" DATE NOT NULL ENABLE, 
	 CONSTRAINT "PROGRAM_GLOBAL_AREA_PK" PRIMARY KEY ("NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "SYSTEM"  ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;

    CREATE TABLE "MONITOR"."PROGRAM_GLOBAL_AREA_HISTORIC" 
   (	"NAME" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"VALUE" NUMBER NOT NULL ENABLE, 
	"TIMESTAMP" DATE NOT NULL ENABLE, 
	 CONSTRAINT "PROGRAM_GLOBAL_AREA_HISTOR_PK" PRIMARY KEY ("NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "SYSTEM"  ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;


  CREATE TABLE "MONITOR"."SYSTEM_GLOBAL_AREA" 
   (	"NAME" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"VALUE" NUMBER NOT NULL ENABLE, 
	"TIMESTAMP" DATE NOT NULL ENABLE, 
	 CONSTRAINT "SYSTEM_GLOBAL_AREA_PK" PRIMARY KEY ("NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "SYSTEM"  ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;

  CREATE TABLE "MONITOR"."SYSTEM_GLOBAL_AREA_HISTORIC" 
   (	"NAME" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"VALUE" NUMBER NOT NULL ENABLE, 
	"TIMESTAMP" DATE NOT NULL ENABLE, 
	 CONSTRAINT "SYSTEM_GLOBAL_AREA_HISTORI_PK" PRIMARY KEY ("NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "SYSTEM"  ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;

  CREATE TABLE "MONITOR"."TABLESPACES" 
   (	"TABLESPACE_NAME" VARCHAR2(250 BYTE) NOT NULL ENABLE, 
	"ALLOCATED" NUMBER NOT NULL ENABLE, 
	"FREE" NUMBER NOT NULL ENABLE, 
	"USED" NUMBER NOT NULL ENABLE, 
	"PERC_FREE" NUMBER NOT NULL ENABLE, 
	"PERC_USED" NUMBER NOT NULL ENABLE, 
	"MAX_EXTEND" NUMBER NOT NULL ENABLE, 
	"STATUS" NUMBER NOT NULL ENABLE, 
	"ALLOCATION_TYPE" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"CONTENTS" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"SEGMENT_SPACE_MANAGEMENT" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"TIMESTAMP" DATE NOT NULL ENABLE, 
	 CONSTRAINT "TABLESPACES_PK" PRIMARY KEY ("TABLESPACE_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;

  CREATE TABLE "MONITOR"."DATAFILES" 
   (	"FILENAME" VARCHAR2(500 BYTE) NOT NULL ENABLE, 
	"FILE_ID" NUMBER NOT NULL ENABLE, 
	"TABLESPACE_NAME" VARCHAR2(250 BYTE) NOT NULL ENABLE, 
	"BYTES" NUMBER NOT NULL ENABLE, 
	"BLOCKS" NUMBER NOT NULL ENABLE, 
	"STATUS" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"AUTOEXTENSIBLE" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"MAXBYTES" NUMBER NOT NULL ENABLE, 
	"MAXBLOCKS" NUMBER NOT NULL ENABLE, 
	"ONLINE_STATUS" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"TIMESTAMP" DATE NOT NULL ENABLE, 
	 CONSTRAINT "DATAFILES_PRIMARYKEY" PRIMARY KEY ("FILENAME")
  USING INDEX (CREATE UNIQUE INDEX "MONITOR"."DATAFILES_PK1" ON "MONITOR"."DATAFILES" ("FILENAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM" )  ENABLE, 
	 CONSTRAINT "DATAFILES_FK1" FOREIGN KEY ("TABLESPACE_NAME")
	  REFERENCES "MONITOR"."TABLESPACES" ("TABLESPACE_NAME") ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;

  CREATE TABLE "MONITOR"."USERS" 
   (	"USERNAME" VARCHAR2(250 BYTE) NOT NULL ENABLE, 
	"ACCOUNT_STATUS" VARCHAR2(150 BYTE) NOT NULL ENABLE, 
	"EXPIRATION_DATE" DATE NOT NULL ENABLE, 
	"DEFAULT_TABLESPACE" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"TEMPORARY_TABLESPACE" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"PROFILE" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"CREATED" DATE NOT NULL ENABLE, 
	"COMMON" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"TIMESTAMP" DATE NOT NULL ENABLE, 
	 CONSTRAINT "USERS_PK" PRIMARY KEY ("USERNAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE, 
	 CONSTRAINT "USERS_FK1" FOREIGN KEY ("DEFAULT_TABLESPACE")
	  REFERENCES "MONITOR"."TABLESPACES" ("TABLESPACE_NAME") ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;

  CREATE TABLE "MONITOR"."SESSIONS" 
   (	"SID" NUMBER NOT NULL ENABLE, 
	"USERNAME" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"STATUS" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"SERVER" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"SCHEMANAME" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"OSUSER" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"MACHINE" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"PORT" NUMBER NOT NULL ENABLE, 
	"TYPE" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"WAIT_TIME_MICRO" NUMBER NOT NULL ENABLE, 
	"LOGON_TIME" DATE NOT NULL ENABLE, 
	"USER_USERNAME" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"TIMESTAMP" DATE NOT NULL ENABLE, 
	 CONSTRAINT "SESSIONS_PK" PRIMARY KEY ("SID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE, 
	 CONSTRAINT "SESSIONS_FK1" FOREIGN KEY ("USER_USERNAME")
	  REFERENCES "MONITOR"."USERS" ("USERNAME") ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;


CREATE TABLE "MONITOR"."ROLES" 
   (	"ROLE_ID" NUMBER NOT NULL ENABLE, 
	"ROLE" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"AUTHENTICATION_TYPE" VARCHAR2(20 BYTE), 
	"ADMIN_OPTION" VARCHAR2(100 BYTE), 
	 CONSTRAINT "ROLES_PK" PRIMARY KEY ("ROLE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;


CREATE TABLE "MONITOR"."USERS_ROLES" 
   (	"ROLE_NAME" VARCHAR2(500 BYTE) NOT NULL ENABLE, 
	"USERNAME" VARCHAR2(500 BYTE) NOT NULL ENABLE, 
	"TIMESTAMP" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "USERS_ROLES_PK" PRIMARY KEY ("ROLE_NAME", "USERNAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "SYSTEM"  ENABLE, 
	 CONSTRAINT "USERS_ROLES_FK1" FOREIGN KEY ("USERNAME")
	  REFERENCES "MONITOR"."USERS" ("USERNAME") ENABLE, 
	 CONSTRAINT "USERS_ROLES_FK2" FOREIGN KEY ("ROLE_NAME")
	  REFERENCES "MONITOR"."ROLES" ("ROLE") ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "SYSTEM" ;
