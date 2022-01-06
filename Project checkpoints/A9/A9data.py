import datetime

student = [
    (605914500, 500946154,'U', 'BILL', 'FROG', '647-500-8765','yes','canadian', 'yes'),
    (605914501, 500946155,'G', 'BILL', 'FROG', '647-500-8765','yes','canadian', 'yes'),
    (605914502, 500946156,'U', 'BILL', 'ELLISH', '647-500-8765','yes','canadian', 'yes'),
    (605914700, 500949000,'G', 'BILLY', 'BOY', '647-555-8765','no','Russian', 'no'),
    (605914705, 500949006,'U', 'BILLY', 'BOY', '656-555-8765','no','Russian', 'no')
]

transactions = [
    (500946154, 1, -9000, 'Tutition', 'W2021', datetime.datetime(2022, 1, 5)),
    (500946155, 2, -5000, 'Residence', 'W2021', datetime.datetime(2022, 1, 5))
]

addresses = [
    (500946154, '50 king st','toronto','ontario','canada','L6N 5A9'),
    (500946155, '150 bayfield st','Barrie','Ontario','canada','L5A 6A7'),
    (500949000, '1000 russia dr','Moscow','twert','Russia','545453')
]

course = [
    (510,'CPS 510',0.5),
    (633,'CPS 633',0.5),
    (721,'CPS 721',1),
    (209,'CPS 209',1),
    (213,'CPS 213',1)
]

section = [
    (510, '01'),
    (510, '02'),
    (510, '03'),
    (510, '04'),
    (510, '05'),
    (633,' 05'),
    (633,' 06'),
    (633,' 07'),
    (633,' 08'),
    (213,' 05 '),
    (213,' 03'),
    (209, ' 01 '),
    (209,' 02 '),
    (209,' 02'),
    (721, ' 09')
]

sSection = [
    ('MAC MILLER', '01', '2021', 'F2021'),      #510
    ('MAC MILLER', '02', '2021', 'F2021'),
    ('MAC MILLER', '03', '2021', 'F2021'),
    ('MAC MILLER', '04', '2021', 'F2021'),
    ('MAC MILLER', '05', '2021', 'F2021'),
    ('MAC MILLER', ' 05', '2021', 'F2021'),     #633
    ('BOB RAY', ' 06', '2021', 'F2021'),
    ('BOB RAY', ' 07', '2021', 'F2021'),
    ('BOB RAY', ' 08', '2021', 'F2021'),
    ('Mehrdad', ' 05 ', '2022', 'W2022'),       #213
    ('THEODORE SMITH', ' 03', '2021', 'W2021'),
    ('Mehrdad', ' 01 ', '2022', 'W2022'),       #209
    ('Mehrdad', ' 02 ', '2022', 'W2022'),
    ('TOMMY WHITE', ' 02', '2021', 'F2021'),
    ('BOB RAY', ' 09','2021','F2021')           #721
]

department = [
    (510,'HUNTER', '647-888-8888', 'compsci@ryerson.ca','computer science', 'RM 301'),
    (633,'HUNTER', '647-888-8888', 'compsci@ryerson.ca','computer science', 'RM 301')
]

registered = [
    (500946154, 510),
    (500946155, 510),
    (500946154, 633),
    (500946155, 633)
]

undergrad = [
    (500946154,'U','COMPUTER SCIENCE'),
    (500949006,'U','COMPUTER SCIENCE'),
    (500946156,'U','Political Science')
]

documents = [
    (500946154, 'enrollment.txt', 'transcript.txt', 2)
]

graduate = [
    (500946155, 'G', 'COMPUTER SCIENCE', None, None),
    (500949000, 'G', 'Political Science', None, None)
]

sDegree = [
    (500946155, 'COMPUTER SCIENCE', 'Ryerson'),
    (500949000, 'Political Science', 'Ryerson')
]

tablesDict = {
        "Student": student, "Transactions": transactions, "Addresses": addresses, "Course": course, 
        "Section": section, "sSection": sSection, "Department": department, "Registered": registered, 
        "Undergrad": undergrad, "Documents": documents, "Graduate": graduate, "sDegree": sDegree
    }

tablesDrop = ["Documents", "Graduate", "Undergrad", "Registered", "Department", "Section",
          "sSection", "Course", "Addresses", "Transactions", "sDegree", "Student"]
