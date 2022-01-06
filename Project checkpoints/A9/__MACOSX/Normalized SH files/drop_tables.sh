#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "hshiells/05046154@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF
DROP TABLE DOCUMENTS cascade constraints;
DROP TABLE GRADUATE cascade constraints;
DROP TABLE UNDERGRAD cascade constraints;
DROP TABLE REGISTERED cascade constraints;
DROP TABLE DEPARTMENT cascade constraints;
DROP TABLE SECTION cascade constraints;
DROP TABLE sSECTION cascade constraints;
DROP TABLE COURSE cascade constraints;
DROP TABLE ADDRESSES cascade constraints;
DROP TABLE TRANSACTIONS cascade constraints;
DROP TABLE SDEGREE cascade constraints;
DROP TABLE STUDENT cascade constraints;
exit;
EOF