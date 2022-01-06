#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "hshiells/05046154@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF
/* Student table normalized in BCNF*/
CREATE TABLE Student (
    SIN numeric NOT NULL UNIQUE,
    Student_number numeric NOT NULL PRIMARY KEY,
    UoG CHAR(1) NOT NULL CHECK (UoG in ('U','G')),
    first_name varchar(25) NOT NULL,
    last_name varchar(25) NOT NULL,
    phone_number varchar(20),
    Indig varchar(20),
    Citizenship varchar(20) NOT NULL, 
    Disability varchar(5)
);
/* Transactions table normalized in 3NF*/
CREATE TABLE Transactions (
    Student_number numeric NOT NULL PRIMARY KEY
        REFERENCES Student(Student_number)
        ON DELETE CASCADE,
    TID numeric NOT NULL UNIQUE, 
    TAmount numeric NOT NULL,
    Tdesc long,
    Tterm varchar(7), 
    tdate date NOT NULL
);
/* Addresses table normalized in 3NF*/
CREATE TABLE Addresses(
    Student_number numeric NOT NULL PRIMARY KEY
        REFERENCES Student(Student_number)
        ON DELETE CASCADE,
    address long NOT NULL,
    City varchar(25) NOT NULL,
    Prov varchar(25) NOT NULL,
    Country varchar(25) NOT NULL,
    Postal varchar(25) NOT NULL 
);
/* Course table normalized in 3NF*/
CREATE TABLE Course ( 
    Course_number NUMBER CHECK (Course_number BETWEEN 100 and 1000) NOT NULL PRIMARY KEY, 
    Course_name varchar(15), 
    Credits float NOT NULL 
);
/* Section table normalized in 3NF*/
CREATE TABLE Section (
    Course_number NUMBER NOT NULL
        REFERENCES Course(Course_number)
        ON DELETE CASCADE,
    Section_number varchar(15) NOT NULL PRIMARY KEY
);
CREATE TABLE sSection (
    Instructor varchar(30) NOT NULL, 
    Section_number varchar(15) NOT NULL PRIMARY KEY
        REFERENCES Section(Section_number)
        ON DELETE CASCADE,
    SYear varchar(40), 
    Sterm varchar(30)
);
/* Department table normalized in 3NF*/
CREATE TABLE Department(
    Course_number NUMBER NOT NULL PRIMARY KEY
        REFERENCES Course(Course_number)
        ON DELETE CASCADE,
    Dhead varchar(50),
    DPhone varchar(25),
    DEmail varchar(35), 
    DName varchar(35) NOT NULL, 
    DOffice varchar(35)
);
/* Registered table normalized in 3NF*/
CREATE TABLE registered (
    Student_number numeric NOT NULL
        REFERENCES Student(Student_number)
        ON DELETE CASCADE,
    Course_number NUMBER NOT NULL
        REFERENCES Course(Course_number)
        ON DELETE CASCADE
);
/* UnderGrad table normalized in 3NF*/
CREATE TABLE UnderGrad(
    Student_number numeric NOT NULL
        REFERENCES Student(Student_number)
        ON DELETE CASCADE,
    UoG char(1) NOT NULL CHECK (UoG in ('U')),
    Udegree varchar(25) NOT NULL,
    UNIQUE(Student_number)
);
/* Graduate table normalized in 3NF*/
CREATE TABLE Graduate(
    Student_number numeric NOT NULL
        REFERENCES Student(Student_number)
        ON DELETE CASCADE,
    UoG char(1) NOT NULL CHECK (UoG in ('G')),
    GDegree varchar(25) NOT NULL, 
    Gphone varchar(25), 
    GOffice varchar(25),
    UNIQUE (Student_number)
);
/* Sdegree table normalized in 3NF*/
CREATE TABLE SDegree( 
    Student_number numeric NOT NULL PRIMARY KEY
        REFERENCES Student(Student_number),
    UDegree varchar(25) NOT NULL,
    School varchar(25) NOT NULL
);
/* Documents table normalized in 3NF*/
CREATE TABLE Documents(
    Student_number numeric NOT NULL
        REFERENCES Student(Student_number)
        ON DELETE CASCADE,
    Enrollment varchar(25) NOT NULL, 
    Transcript varchar(25) NOT NULL,
    TransferCredits numeric,
    UNIQUE(Student_number)
);

exit;
EOF