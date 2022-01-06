#!/bin/sh
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "hshiells/05046154@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF
prompt ==================================================================;
prompt Selects Students that are registered in cps 510 and returns student;
prompt ==================================================================;
SELECT Student_number
FROM STUDENT 
WHERE EXISTS (SELECT course_number FROM REGISTERED WHERE STUDENT.student_number = REGISTERED.student_number AND REGISTERED.Course_number = 510);
prompt ==================================================================;
prompt Counts how many instructors are in each course, and sorts output by tterm;
prompt ==================================================================;
SELECT COUNT(DISTINCT instructor), Sterm
FROM sSECTION 
GROUP BY Sterm
ORDER BY Sterm DESC;
prompt ==================================================================;
prompt Counts each student with each citizenship and then only lists the;
prompt citizenships with more then 3 students;
prompt ==================================================================;
SELECT COUNT(Student_number), Citizenship
FROM STUDENT
GROUP BY Citizenship
HAVING COUNT(Student_number) > 2;
prompt ==================================================================;
prompt List of undergrads or grads in ryerson currently studying Computer Science;
prompt ==================================================================;
SELECT Student_number
FROM GRADUATE
WHERE GDEGREE = 'COMPUTER SCIENCE'
UNION 
SELECT Student_number
FROM UNDERGRAD
WHERE UDEGREE = 'COMPUTER SCIENCE';
exit;
EOF