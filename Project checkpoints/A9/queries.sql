/* Selects Students that are registered in cps 510 and returns student */
SELECT Student_number
FROM STUDENT 
WHERE EXISTS (SELECT course_number FROM REGISTERED WHERE STUDENT.student_number = REGISTERED.student_number AND REGISTERED.Course_number = 510);

/* Counts how many instructors are in each course, and sorts output by term */
SELECT COUNT(DISTINCT instructor), Sterm
FROM sSECTION 
GROUP BY Sterm
ORDER BY Sterm DESC;

/* Counts each student with each citizenship and then only lists the citizenships with more then 3 students */
SELECT COUNT(Student_number), Citizenship
FROM STUDENT
GROUP BY Citizenship
HAVING COUNT(Student_number) > 2;

/* List of undergrads or grads in Ryerson currently studying Computer Science */
SELECT Student_number
FROM GRADUATE
WHERE GDEGREE = 'COMPUTER SCIENCE'
UNION 
SELECT Student_number
FROM UNDERGRAD
WHERE UDEGREE = 'COMPUTER SCIENCE';