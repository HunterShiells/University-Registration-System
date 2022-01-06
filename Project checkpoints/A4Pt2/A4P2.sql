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
    Course_number NUMBER NOT NULL
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
    Student_number numeric NOT NULL
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

DROP TABLE DOCUMENTS cascade constraints;
DROP TABLE GRADUATE cascade constraints;
DROP TABLE UNDERGRAD cascade constraints;
DROP TABLE REGISTERED cascade constraints;
DROP TABLE DEPARTMENT cascade constraints;
DROP TABLE SECTION cascade constraints;
DROP TABLE COURSE cascade constraints;
DROP TABLE ADDRESSES cascade constraints;
DROP TABLE TRANSACTIONS cascade constraints;
DROP TABLE SDEGREE cascade constraints;
DROP TABLE STUDENT cascade constraints;


INSERT INTO Student
VALUES (605914500, 500946154,'U', 'BILL', 'FROG', '647-500-8765','yes','canadian', 'yes');
INSERT INTO Student
VALUES (605914501, 500946155,'G', 'BILL', 'FROG', '647-500-8765','yes','canadian', 'yes');
INSERT INTO Student
VALUES (605914502, 500946156,'U', 'BILL', 'ELLISH', '647-500-8765','yes','canadian', 'yes');
INSERT INTO Student
VALUES (605914700, 500949000,'G', 'BILLY', 'BOY', '647-555-8765','no','Russian', 'no');
INSERT INTO Student
VALUES (605914705, 500949006,'U', 'BILLY', 'BOY', '656-555-8765','no','Russian', 'no');
INSERT INTO TRANSACTIONS
VALUES (500946154, 1, -9000, 'Tutition', 'W2021',TO_DATE('2022-01-05','YYYY-MM-DD'));
INSERT INTO TRANSACTIONS
VALUES (500946155, 2, -5000, 'Residence', 'W2021',TO_DATE('2022-01-05','YYYY-MM-DD'));
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
INSERT INTO COURSE 
VALUES (721,'CPS 721',1);
INSERT INTO COURSE 
VALUES (209,'CPS 209',1);
INSERT INTO COURSE 
VALUES (213,'CPS 213',1);
INSERT INTO SECTION
VALUES (510,'MAC MILLER', '01','2021','F2021');
INSERT INTO SECTION
VALUES (510,'MAC MILLER', '02','2021','F2021');
INSERT INTO SECTION
VALUES (510,'MAC MILLER', '03','2021','F2021');
INSERT INTO SECTION
VALUES (510,'MAC MILLER', '04','2021','F2021');
INSERT INTO SECTION
VALUES (510,'MAC MILLER', '05','2021','F2021');
INSERT INTO SECTION
VALUES (633,'MAC MILLER', ' 05','2021','F2021');
INSERT INTO SECTION
VALUES (213,'Mehrdad', ' 05 ','2022','W2022');
INSERT INTO SECTION
VALUES (209,'Mehrdad', ' 01 ','2022','W2022');
INSERT INTO SECTION
VALUES (209,'Mehrdad', ' 02 ','2022','W2022');
INSERT INTO SECTION
VALUES (633,'BOB RAY', ' 06','2021','F2021');
INSERT INTO SECTION
VALUES (633,'BOB RAY', ' 07','2021','F2021');
INSERT INTO SECTION
VALUES (633,'BOB RAY', ' 08','2021','F2021');
INSERT INTO SECTION
VALUES (721,'BOB RAY', ' 09','2021','F2021');
INSERT INTO SECTION
VALUES (209,'TOMMY WHITE', ' 02','2021','F2021');
INSERT INTO SECTION
VALUES (213,'THEODORE SMITH', ' 03','2021','W2022');
INSERT INTO DEPARTMENT
VALUES (510,'HUNTER', '647-888-8888', 'compsci@ryerson.ca','computer science', 'RM 301');
INSERT INTO DEPARTMENT
VALUES (633,'HUNTER', '647-888-8888', 'compsci@ryerson.ca','computer science', 'RM 301');
INSERT INTO REGISTERED 
VALUES (500946154, 510, '05');
INSERT INTO REGISTERED 
VALUES (500946155, 510, '05');
INSERT INTO REGISTERED 
VALUES (500946154, 633, ' 06');
INSERT INTO REGISTERED 
VALUES (500946155, 633, ' 07');
INSERT INTO UNDERGRAD
VALUES (500946154,'U','COMPUTER SCIENCE');
INSERT INTO UNDERGRAD
VALUES (500949006,'U','COMPUTER SCIENCE');
INSERT INTO UNDERGRAD
VALUES (500946156,'U','Political Science');
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
WHERE UoG = 'G';

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

SELECT DISTINCT 'name of professor:',instructor 
FROM SECTION;

SELECT 'there are this many instructors:', COUNT(DISTINCT instructor) 
FROM SECTION;

SELECT COUNT(DISTINCT instructor), course_number,'  number of different instructors per course'
FROM SECTION 
GROUP BY course_number;

SELECT COUNT(Student_number),' number of students with ', Citizenship, ' Citizenship' 
FROM STUDENT
GROUP BY Citizenship;

SELECT 'profs by course number', instructor ,  course_number
FROM SECTION
ORDER BY course_number;

SELECT 'courses listed by credit count(L->G)' , Course_name, Credits
FROM COURSE
ORDER BY Credits ASC;

/*Part 2 of assignment 4 */
CREATE VIEW Transaction_log AS 
SELECT STUDENT.student_number,STUDENT.phone_number, TRANSACTIONS.TAmount, TRANSACTIONS.tdate
FROM STUDENT
INNER JOIN TRANSACTIONS ON STUDENT.student_number = TRANSACTIONS.student_number;

CREATE VIEW Graduate_undergrad_taken AS 
SELECT GRADUATE.student_number, sdegree.udegree
FROM SDEGREE
FULL OUTER JOIN GRADUATE ON GRADUATE.student_number = sdegree.student_number;

CREATE VIEW student_addresses AS
SELECT STUDENT.student_number, ADDRESSES.address
FROM STUDENT
LEFT JOIN ADDRESSES ON STUDENT.student_number = ADDRESSES.student_number
ORDER BY STUDENT.student_number;

CREATE VIEW course_dept_heads AS
SELECT COURSE.course_number, DEPARTMENT.Dhead, department.doffice
FROM DEPARTMENT
RIGHT JOIN COURSE ON COURSE.course_number = DEPARTMENT.course_number
ORDER BY COURSE.course_number;  

DROP VIEW Transaction_log;
DROP VIEW Graduate_undergrad_taken;
DROP VIEW student_addresses;
DROP VIEW course_dept_heads;

/* Assignment 5 */
SELECT Student_number
FROM STUDENT 
WHERE EXISTS (SELECT course_number FROM REGISTERED WHERE STUDENT.student_number = REGISTERED.student_number AND REGISTERED.Course_number = 510);

(SELECT Course_number FROM SECTION) 
MINUS
(SELECT Course_number FROM SECTION WHERE Sterm = 'F2021');

SELECT COUNT(DISTINCT instructor), course_number
FROM SECTION 
GROUP BY course_number;

SELECT COUNT(Student_number), Citizenship
FROM STUDENT
GROUP BY Citizenship
HAVING COUNT(Student_number) > 2;
/* list of undergrads and graduates in computer science */
SELECT Student_number
FROM GRADUATE
WHERE GDEGREE = 'COMPUTER SCIENCE'
UNION 
SELECT Student_number
FROM UNDERGRAD
WHERE UDEGREE = 'COMPUTER SCIENCE';














