alter session set "_ORACLE_SCRIPT"  = true;

alter user hr identified by hr;

create user c##scott IDENTIFIED by tiger
default TABLESPACE users
TEMPORARY TABLESPACE temp;

grant connect, resource, dba to c##scott;