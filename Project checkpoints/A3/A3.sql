CREATE TABLE Student (
    SIN numeric NOT NULL UNIQUE,
    Student_number numeric NOT NULL PRIMARY KEY,
    UoG CHAR(1) NOT NULL CHECK (UoG in ('U','G')),
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    phone_number varchar(255),
    Indig varchar(255),
    Citizenship varchar(255) NOT NULL, 
    Disability varchar(255)
);

CREATE TABLE Transactions (
    Student_number numeric NOT NULL PRIMARY KEY
        REFERENCES Student(Student_number)
        ON DELETE CASCADE,
    TID numeric NOT NULL UNIQUE, 
    TAmount numeric NOT NULL,
    Tdesc long,
    Tterm varchar(255), 
    tdate date NOT NULL
);

CREATE TABLE Addresses(
    Student_number numeric NOT NULL PRIMARY KEY
        REFERENCES Student(Student_number)
        ON DELETE CASCADE,
    address long NOT NULL,
    City varchar(255) NOT NULL,
    Prov varchar(255) NOT NULL,
    Country varchar(255) NOT NULL,
    Postal varchar(255) NOT NULL 
);


CREATE TABLE Course ( 
    Course_number NUMBER CHECK (Course_number BETWEEN 100 and 1000) NOT NULL PRIMARY KEY, 
    Course_name varchar(255), 
    Credits float NOT NULL 
);

CREATE TABLE Section (
    Course_number NUMBER NOT NULL UNIQUE
        REFERENCES Course(Course_number)
        ON DELETE CASCADE,
    Instructor varchar(255) NOT NULL, 
    Section_number varchar(255) NOT NULL PRIMARY KEY, 
    SYear varchar(255), 
    Sterm varchar(255)
);

CREATE TABLE Department(
    Course_number NUMBER NOT NULL PRIMARY KEY
        REFERENCES Course(Course_number)
        ON DELETE CASCADE,
    Dhead varchar(255),
    DPhone varchar(255),
    DEmail varchar(255), 
    DName varchar(255) NOT NULL, 
    DOffice varchar(255)
);

CREATE TABLE registered (
    Student_number numeric NOT NULL PRIMARY KEY
        REFERENCES Student(Student_number)
        ON DELETE CASCADE,
    Course_number NUMBER NOT NULL
        REFERENCES Course(Course_number)
        ON DELETE CASCADE,
    Section_number varchar(255) NOT NULL
        REFERENCES Section(Section_number)
);

CREATE TABLE UnderGrad(
    Student_number numeric NOT NULL
        REFERENCES Student(Student_number)
        ON DELETE CASCADE,
    UoG char(1) NOT NULL CHECK (UoG in ('U')),
    Udegree varchar(255) NOT NULL,
    UNIQUE(Student_number)
);

CREATE TABLE Graduate(
    Student_number numeric NOT NULL
        REFERENCES Student(Student_number)
        ON DELETE CASCADE,
    UoG char(1) NOT NULL CHECK (UoG in ('G')),
    GDegree varchar(255) NOT NULL, 
    Gphone varchar(255), 
    GOffice varchar(255),
    UNIQUE (Student_number)
);

CREATE TABLE SDegree( 
    Student_number numeric NOT NULL PRIMARY KEY
        REFERENCES Student(Student_number),
    UDegree varchar(255) NOT NULL,
    School varchar(255) NOT NULL
);

CREATE TABLE Documents(
    Student_number numeric NOT NULL
        REFERENCES Student(Student_number)
        ON DELETE CASCADE,
    Enrollment varchar(255) NOT NULL, 
    Transcript varchar(255) NOT NULL,
    TransferCredits numeric,
    UNIQUE(Student_number)
);


drop table GRADUATE cascade constraints;
drop table UNDERGRAD cascade constraints;

DROP TABLE DOCUMENTS;
DROP TABLE GRADUATE;
DROP TABLE UNDERGRAD;
DROP TABLE REGISTERED;
DROP TABLE DEPARTMENT;
DROP TABLE SECTION;
DROP TABLE COURSE;
DROP TABLE ADDRESSES;
DROP TABLE TRANSACTIONS;
DROP TABLE SDEGREE;
DROP TABLE STUDENT;


INSERT INTO Student
VALUES (605914500, 500946154,'U', 'BILL', 'FROG', '647-500-8765','yes','canadian', 'yes');
INSERT INTO Student
VALUES (605914501, 500946155,'G', 'BILL', 'FROG', '647-500-8765','yes','canadian', 'yes');
INSERT INTO Student
VALUES (605914700, 500949000,'G', 'BILLY', 'BOY', '647-555-8765','no','Russian', 'no');
INSERT INTO TRANSACTIONS
VALUES (500946154, 1, -9000, 'Tutition', 'W2021','2022-01-05');
INSERT INTO TRANSACTIONS
VALUES (500946155, 2, -5000, 'Residence', 'W2021','2022-01-05');
INSERT INTO ADDRESSES 
VALUES (500946154, '50 king st','toronto','ontario','canada','L6N 5A9');
INSERT INTO ADDRESSES 
VALUES (500946155, '150 bayfield st','Barrie','Ontario','canada','L5A 6A7');
INSERT INTO ADDRESSES 
VALUES (500949000, '1000 russia dr','Moscow','twert','Russia','545453');
INSERT INTO COURSE 
VALUES (510,'CPS 510',0.5);
INSERT INTO COURSE 
VALUES (633,'CPS 633',0.5);
INSERT INTO SECTION
VALUES (510,'MAC MILLER', '05','2021','F2021');
INSERT INTO SECTION
VALUES (633,'MAC MILLER', ' 05','2021','F2021');
INSERT INTO DEPARTMENT
VALUES (510,'HUNTER', '647-888-8888', 'compsci@ryerson.ca','computer science', 'RM 301');
INSERT INTO DEPARTMENT
VALUES (633,'HUNTER', '647-888-8888', 'compsci@ryerson.ca','computer science', 'RM 301');
INSERT INTO REGISTERED 
VALUES (500946154, 510, '05');
INSERT INTO UNDERGRAD
VALUES (500946154,'U','COMPUTER SCIENCE');
INSERT INTO DOCUMENTS
VALUES (500946154, 'enrollment.txt', 'transcript.txt', 2);
INSERT INTO GRADUATE(student_number,UoG,GDegree)
VALUES (500946155,'G', 'COMPUTER SCIENCE');
INSERT INTO SDEGREE
VALUES (500946155, 'COMPUTER SCIENCE',  'Ryerson');
INSERT INTO GRADUATE(student_number,UoG,GDegree)
VALUES (500949000,'G', 'Political Science');
INSERT INTO SDEGREE
VALUES (500949000, 'Political Science',  'Ryerson');

SELECT *
FROM Student;

SELECT Student_number
FROM REGISTERED
WHERE course_number = 510;

SELECT Student_number, TransferCredits
FROM DOCUMENTS
WHERE TransferCredits > 1;

SELECT Student_number,'is a Undergrad(U) or Grad(G)', UoG
FROM STUDENT;

SELECT Student_number,'is a Undergrad'
FROM STUDENT
WHERE UoG = 'U';

SELECT Student_number,'is a Graduate'
FROM STUDENT
WHERE UoG = 'U';

SELECT 'Graduate student', Student_number, 'has a degree in', GDegree
FROM GRADUATE;

SELECT 'UnderGrad student', Student_number, 'is majoring in', UDegree
FROM UNDERGRAD;

SELECT 'The graduate students whom got there degree from ryerson include',student_number
FROM SDEGREE 
WHERE school = 'Ryerson';

SELECT 'this student is from canada', student_number, address, City, Prov
FROM ADDRESSES 
WHERE country = 'canada';

SELECT 'course worth 0.5 credits', Course_name
FROM COURSE
WHERE credits = 0.5;

SELECT 'The computer science department teaches', Course_number
FROM DEPARTMENT
WHERE Dname = 'computer science';

SELECT 'The Prof Mac Miller teaches', Course_number, 'Section', Section_number
FROM SECTION
WHERE instructor = 'MAC MILLER';

SELECT 'Student', student_number, 'has an outstanding balance of',TAmount , 'due', tdate
FROM TRANSACTIONS
WHERE TAmount < 0;



