CREATE DATABASE HOSPITAL;

USE HOSPITAL;
drop database hospital;

CREATE TABLE DOCTORS(DocID INT PRIMARY KEY auto_increment unique, DocName VARCHAR(30), DocDept VARCHAR(30), DocFee VARCHAR(30));
CREATE TABLE PATIENTS(PatID INT PRIMARY KEY auto_increment unique, PatName VARCHAR(30), PatAge INT, PatHistory VARCHAR(30));
CREATE TABLE Visits(DocID INT,PatID INT, FOREIGN KEY(DocID) REFERENCES DOCTORS(DocID), FOREIGN KEY(PatID) REFERENCES PATIENTS(PatID),NO_of_visits INT);

INSERT INTO DOCTORS(DocName,DocDept,DocFee) VALUES ('SOBAN WARAICH','NEUROLGY','800'),('MOHSIN','PSYCHO','400'),('AFTAB','GYNAGOLIGIST','900'),('FARAN','PHYSICIAN','300'),('ALI','HEART SPECIALIST','500'),('daniyal','neuro','800');
INSERT INTO PATIENTS(PatName,PatAge,PatHistory) VALUES ('SOBAN WARAICH','20','DIABETES'),('AFTAB','21','MENTAL'),('GHANI BHAI','5','MENTAL'),('FARAN','60','BLOOD PRESSURE'),('MAHNOOR','20','OLD'),('MAHNOOR','15','TB');
INSERT INTO Visits(DocID,PatID,NO_of_visits) VALUES ('1','1','25'),('2','2','5'),('2','3','2'),('4','4','6'),('5','5','7'),('6','6','0');
 
SELECT *FROM DOCTORS;
SELECT *FROM PATIENTS;
SELECT *FROM Visits;

#Step4: Apply projection over a table. 
SELECT DocName,DocFee FROM DOCTORS; 
SELECT PatName,PatHistory FROM PATIENTS;

#Step5: Use expressions while displaying the records.
SELECT DocName,DocFee*2 FROM DOCTORS;

#Step6: Assign alias to the expression to make the title of the column meaningful.
SELECT DocName,DocFee*2 SPECIAL_FEE FROM DOCTORS;

#Step7: Display the records in a sorted order.
SELECT *FROM DOCTORS order by DocName;
SELECT *FROM DOCTORS order by DocFee;


#Step8: Display records in descending order. 
SELECT   *   FROM   patients ORDER BY   PatID desc, PatAge  desc;

#Step9: Column position can also be used for sorting instead of column name.
SELECT  PatID, NO_of_visits  FROM Visits ORDER BY 2;

#Step10: If not easy with the position, use alias instead.
SELECT   DocName, DocFee * 2   Special_Fee  FROM doctors ORDER BY   Special_Fee;

#Step11: Do Conditional Selection from tables.
SELECT  PatID  FROM PATIENTS WHERE PatName = 'AFTAB';

SELECT    DocName   FROM  DOCTORS WHERE   DocFee > 100;

SELECT   PatName    FROM   PATIENTS
WHERE   PatAge > 10
AND     PatHistory = 'MENTAL';

#Step12: Don’t want to see duplicate values.

SELECT   DISTINCT   PatName   FROM   PATIENTS;

#Step13: Display all records with column values between a specified range

SELECT   PatID, DocID, NO_of_visits   FROM   Visits
WHERE     NO_of_visits   BETWEEN   5  AND  10;

#Step14: Display a record with column value matches a value in a given list.
SELECT   PatID, DocID, No_of_visits   FROM   Visits
WHERE     No_of_visits   IN (5, 7);

#Step15: Don’t know the exact value to be picked, just provide a pattern or at least a character as a hint.

SELECT   DocName, DocFee   FROM   DOCTORS
WHERE   DocName    LIKE   "%MOHSIN%";

SELECT   DocName, DocDept   FROM   DOCTORS
WHERE   DocDept    LIKE   "_H%";                  # Here, the 2nd character in the dept name was known

#Step16: Check for null entries.

SELECT   PatName   FROM   PATIENTS
WHERE   PatAge   IS   NULL;

ALTER TABLE doctors ADD (experience INT NOT NULL);

ALTER TABLE DOCTORS DROP COLUMN experience;

select *from DOCTORS;

ALTER TABLE DOCTORS ADD (experience INT DEFAULT '5' NOT NULL);

ALTER TABLE DOCTORS DROP COLUMN experience;

ALTER TABLE PATIENTS ADD CONSTRAINT patients_name_un UNIQUE (PatName);

ALTER TABLE PATIENTS DROP INDEX patients_name_un;

ALTER TABLE DOCTORS MODIFY COLUMN DocFee VARCHAR(20);

UPDATE DOCTORS SET DocFee = 5000 WHERE DocID = '1';

select *from DOCTORS;

UPDATE DOCTORS SET DocFee = 5000, DocName = '`' WHERE DocID = '1';

SELECT PATIENTS.PatID, DOCTORS.DocID FROM PATIENTS,DOCTORS;

SELECT P.PatID, D.DocID FROM PATIENTS P, DOCTORS D;

SELECT PatID, DocID FROM PATIENTS, DOCTORS;

SELECT * FROM PATIENTS, DOCTORS;

SELECT P.PatID, D.DocID, P.PatNAME, D.DocName FROM PATIENTS P, DOCTORS D WHERE P.PatName = D.DocName;

SELECT P.PatID,P.PatName,P.PatAge, V.DocID, V.NO_of_visits FROM PATIENTS P,Visits V WHERE V.NO_of_visits BETWEEN 5 AND 10;


ALTER TABLE PATIENTS ADD (TOWN VARCHAR(10), CITY VARCHAR(10));
SELECT * FROM PATIENTS;
UPDATE PATIENTS SET TOWN = 'LIYARI', CITY = 'KARACHI'WHERE PatID = '1';
UPDATE PATIENTS SET TOWN = 'SADDAR', CITY = 'KARACHI'WHERE PatID = '2';
UPDATE PATIENTS SET TOWN = 'GHULSAN', CITY = 'KARACHI'WHERE PatID = '3';
UPDATE PATIENTS SET TOWN = 'MALIR', CITY = 'KARACHI'WHERE PatID = '4';
UPDATE PATIENTS SET TOWN = 'BALDIA', CITY = 'KARACHI'WHERE PatID = '5';
UPDATE PATIENTS SET TOWN = 'LANDI', CITY = 'KARACHI'WHERE PatID = '6';
UPDATE PATIENTS SET TOWN = 'KORANGI', CITY = 'KARACHI'WHERE PatID = '7';
UPDATE PATIENTS SET TOWN = 'ORANDI', CITY = 'KARACHI'WHERE PatID = '8';
UPDATE PATIENTS SET TOWN = 'NORTH', CITY = 'KARACHI'WHERE PatID = '9';
UPDATE PATIENTS SET TOWN = 'BIN QASIM', CITY = 'KARACHI'WHERE PatID = '10';
UPDATE PATIENTS SET TOWN = 'JAMSEED', CITY = 'KARACHI'WHERE PatID = '11';
UPDATE PATIENTS SET TOWN = 'SHAHFAISAL', CITY = 'KARACHI'WHERE PatID = '12';
UPDATE PATIENTS SET TOWN = 'SITE', CITY = 'KARACHI'WHERE PatID = '13';
UPDATE PATIENTS SET TOWN = 'NEWKARACHI', CITY = 'KARACHI'WHERE PatID = '14';
UPDATE PATIENTS SET TOWN = 'GADAP', CITY = 'KARACHI'WHERE PatID = '15';

SELECT * FROM PATIENTS;

ALTER TABLE VISITS DROP COLUMN NO_of_visits;

ALTER TABLE VISITS ADD (date_of_visit VARCHAR(20));

UPDATE VISITS SET date_of_visit = '2017,10,20' WHERE PatID = '1';
UPDATE VISITS SET date_of_visit = '2017,11,02' WHERE PatID = '2';
UPDATE VISITS SET date_of_visit = '2017,09,23' WHERE PatID = '3';
UPDATE VISITS SET date_of_visit = '2017,08,30' WHERE PatID = '4';
UPDATE VISITS SET date_of_visit = '2017,10,08' WHERE PatID = '5';
UPDATE VISITS SET date_of_visit = '2017,1,12' WHERE PatID = '6';
UPDATE VISITS SET date_of_visit = '2017,02,13' WHERE PatID = '7';
UPDATE VISITS SET date_of_visit = '2017,01,20' WHERE PatID = '8';
UPDATE VISITS SET date_of_visit = '2017,10,25' WHERE PatID = '9';
UPDATE VISITS SET date_of_visit = '2017,05,20' WHERE PatID = '10';
UPDATE VISITS SET date_of_visit = '2017,10,20' WHERE PatID = '11';
UPDATE VISITS SET date_of_visit = '2017,03,17' WHERE PatID = '12';
UPDATE VISITS SET date_of_visit = '2017,10,20' WHERE PatID = '13';
UPDATE VISITS SET date_of_visit = '2017,08,19' WHERE PatID = '14';
UPDATE VISITS SET date_of_visit = '2017,03,20' WHERE PatID = '15';

SELECT * FROM VISITS;

ALTER TABLE DOCTORS ADD (EXPERIENCES INT);

UPDATE DOCTORS SET EXPERIENCES = '5' WHERE DocID = '1';
UPDATE DOCTORS SET EXPERIENCES = '1' WHERE DocID = '2';
UPDATE DOCTORS SET EXPERIENCES = '3' WHERE DocID = '3';
UPDATE DOCTORS SET EXPERIENCES = '8' WHERE DocID = '4';
UPDATE DOCTORS SET EXPERIENCES = '2' WHERE DocID = '5';

SELECT * FROM DOCTORS;

ALTER TABLE VISITS MODIFY COLUMN date_of_visit DATE;

UPDATE VISITS SET date_of_visit = '2017,10,20' WHERE PatID = '1';
UPDATE VISITS SET date_of_visit = '2017,11,02' WHERE PatID = '2';
UPDATE VISITS SET date_of_visit = '2017,09,23' WHERE PatID = '3';
UPDATE VISITS SET date_of_visit = '2017,08,30' WHERE PatID = '4';
UPDATE VISITS SET date_of_visit = '1981,01,30' WHERE PatID = '5';
UPDATE VISITS SET date_of_visit = '1981,01,30' WHERE PatID = '6';
UPDATE VISITS SET date_of_visit = '2017,02,13' WHERE PatID = '7';
UPDATE VISITS SET date_of_visit = '2017,01,20' WHERE PatID = '8';
UPDATE VISITS SET date_of_visit = '2017,10,25' WHERE PatID = '9';
UPDATE VISITS SET date_of_visit = '2017,05,20' WHERE PatID = '10';
UPDATE VISITS SET date_of_visit = '2017,10,20' WHERE PatID = '11';
UPDATE VISITS SET date_of_visit = '2017,03,17' WHERE PatID = '12';
UPDATE VISITS SET date_of_visit = '2017,10,20' WHERE PatID = '13';
UPDATE VISITS SET date_of_visit = '2017,08,19' WHERE PatID = '14';
UPDATE VISITS SET date_of_visit = '2017,03,20' WHERE PatID = '15';
UPDATE VISITS SET date_of_visit = '2017,03,20' WHERE PatID = '15';

SELECT * FROM VISITS;


#lab 09 
#self join
# you may wish to compare the doctors on the basis of their fee
SELECT d1.DocName, d2.DocName, d1.DocFee, d2.DocFee 
FROM  DOCTORS  d1, DOCTORS  d2 WHERE d1.DocFee < d2.DocFee 
ORDER BY d1.DocFee; 

#Another query may request doctors with same fees. 

SELECT d1.DocName, d2.DocName, d1.DocFee, d2.DocFee FROM  
DOCTORS  d1, DOCTORS  d2 WHERE d1.DocFee = d2.DocFee AND
d1.DocName <> d2.DocName ORDER BY d1.DocFee;

#innerjoin 

SELECT  p.PatId, p.PatName, 


d.DocId, d.DocName FROM   PATIENTS p   
INNER  JOIN  DOCTORS d 
ON   p.PatName = d.DocName; 

#left outter join

SELECT   p.PatId, p.PatName, d.DocId, d.DocName FROM    PATIENTS p   
LEFT OUTER  JOIN  DOCTORS  d 
ON    p.patname = d.docname; 

#right outter join

SELECT   p.patid, p.patname, d.docid, d.docname FROM    PATIENTS p
RIGHT OUTER  JOIN DOCTORS  d
ON    p.patname = d.docname;

#full outter join

#SELECT   p.patid, p.patname, d.docid, d.docname FROM   
#PATIENTS p   FULL OUTER  JOIN  DOCTORS  d 
#ON    p.patname = d.docname; 
 
#joing three tables

SELECT  * FROM  PATIENTS, DOCTORS, Visits; 

#EQUIJOIN 


 SELECT *  FROM  PATIENTS, DOCTORS, Visits
 WHERE  patients.patid = visits.patid
 AND  doctors.docid = visits.docid;
 

#lab actvity 09
#1- Show the names of the patients whose date of first visit to a doctor is same.
SELECT p.PatName FROM Patients p, Visits v1 INNER JOIN Visits v2
ON (v1.date_of_visit = v2.date_of_visit AND v1.PatID <> v2.PatID) 
AND (v1.DocID = v2.DocID) WHERE p.PatID = v1.PatID;
 
#2- Show the patient names and Ids who are teenagers and have visited some doctor twice or more.
SELECT p.PatName,p.PatID,v.NO_of_visits FROM PATIENTS p
INNER JOIN Visits v
ON (V.No_of_visits>1 and p.PatID=v.PatID)
where p.PatAge>20;

#3- Show the name of the doctors who take more than Rs. 500 as their fee and have patients with more than 3 visits
SELECT d.DocName,d.DocFee from DOCTORS d
inner join Visits v
on(d.DocFee>500 and d.DocID=v.PatID)
where v.No_of_visits>3;

#4- Show the patients, who are teenagers and have been diagnosed to have T.B and have never visited a doctor.
select p.PatName,p.PatAge,p.PatHistory,No_of_visits from PATIENTS p
inner join Visits v
on(v.DocID=p.PatID and p.PatAge<20)
where p.PatHistory='TB' and v.No_of_visits=0;

#6- Show complete information of the patients along with the information of their visits to doctors. 
#   The patient information must also be shown for the patient, who has never visited a doctor.
select p.PatID,p.PatName,p.Patage,p.PatHistory,v.No_of_visits
from PATIENTS p
inner join Visits v
on(p.PatID=v.PatID); 

#7 Show the doctors who have the same name as their patients.
SELECT PatName,p.PatID,DocName,d.DocID FROM PATIENTS p
INNER JOIN Visits v 
ON (p.PatID = v.PatID) 
INNER JOIN DOCTORS d 
ON (d.DocName = p.PatName);


#9-Show the patients who have same disease and have visited the same doctor for treatment.
select p.PatName,p.PatHistory,p.PatID,d.DocName,d.DocID from PATIENTS p 
inner join PATIENTS p1
on(p.PatHistory=p1.PatHistory and p.PatName<>p1.PatName)
inner join Visits v
on(p.PatID=v.PatID)
inner join DOCTORS d
on(d.DocID=v.DocID);


#lab 10
#The SQL COUNT function returns the number of rows in a table satisfying the criteria specified in the WHERE clause. 
#Display the count of rows in the doctors table.
SELECT COUNT(*)
FROM Doctors;

#// Display the count of rows for a specific column. The result may be different from the above query,
#  BECAUSE some column may have NULL value in some row

INSERT INTO doctors (docid, docname, docfee) VALUES ('d14', 'hameed', 1200); #insert data 
SELECT COUNT(*) FROM  Doctors;  
SELECT COUNT(docdept) FROM  doctors ; 
 
#// Display the count with an alias used as the column title
SELECT COUNT(docdept)  AS number_of_departments FROM  doctors; 

#// you would surely like to remove the duplicate values, so use DISTINCT
SELECT COUNT(DISTINCT  docdept)  AS number_of_departments FROM  doctors ;  

#//you may like to see the entries for a specific department, so use WHERE Clause 
SELECT COUNT(docdept) AS cardio_entries FROM  doctors
where docdept="psycho";

#you may wish to see the entries for each department separately, so use GROUP BY clause 
SELECT  docdept, COUNT(docdept)   AS number_of_doctors FROM   doctors  GROUP BY  docdept;

#you may wish see the entries for those departments, who have more than 2 entries in the table
SELECT  docdept, COUNT(docid)   AS number_of_doctors FROM   doctors  GROUP BY  docdept HAVING COUNT(docid) > 2; 

#The SQL SUM function is used to return the sum of the values in a column or sum of an expression in a SELECT statement. [The column must contain numbers ] 

SELECT SUM(docfee) FROM  doctors; 

#an expression can also be used in the sum function
SELECT SUM(docfee*2) FROM  doctors; 

#DISTICNT can be used to add only unique value
SELECT SUM(DISTINCT  docfee) FROM  doctors;

#The SQL AVERAGE function returns the average of the column values
SELECT AVG(docfee) FROM  doctors;

#you may wish to see the rounded value 
SELECT ROUND(AVG (docfee)) AS Rounded_Average FROM  doctors;

#The SQL MAX function returns the maximum of the column values.
SELECT MAX(docfee) 
FROM  doctors; 

#The SQL MIN function returns the minimum of the column values
SELECT MIN(docfee) FROM  doctors;


INSERT INTO DOCTORS(DocName,DocDept,DocFee)VALUES ('farhan', 'TB', 1225);

#This SQL ABS() returns the absolute value of a number passed as argument.  
SELECT ABS( AVG (docfee)) FROM  doctors;

#This SQL CEIL() will rounded up any positive or negative decimal value within the function upwards
SELECT CEIL( AVG (docfee)) FROM  doctors;

#The SQL FLOOR() rounded up any positive or negative decimal value down to the next least integer value. 
# SQL DISTINCT along with the SQL FLOOR() function is used to retrieve only unique value after rounded down to the next least integer value depending on the column specified.
SELECT FLOOR( AVG (docfee)) FROM  doctors;

#This SQL MOD() function returns the remainder from a division.
SELECT d1.docid, d2.docid, d1.docfee, d2.docfee, MOD(d1.docfee, d2.docfee) FROM     
doctors    d1,  doctors   d2 WHERE   d1.docid <> d2.docid; 

#lab activity 10

#1- Write a query to find the number of patients who have visited any doctor on 30-JAN-1981.
SELECT COUNT(PatID) as No_of_Patients
FROM visits where date_of_visit='1981,01,30';

#2- Write a query to find the number of patients who have been diagnosed by doctor ‘d01’.
select count(v.PatID) as No_of_patients_by_d1
from Visits v where (v.DocID='1');
 

#3- Write a query to find the most elder patient.
SELECT MAX(PatAge) as Most_Elder_patient
FROM  PATIENTS;

#4 Write a query to find the number of patients affected by each diseas
Select PatHistory,count(PatHistory) as affected_by_each_diseas
From PATIENTS group by PatHistory;

#home task lab 10

#1Write a query to find the number of patients according to age group. Only display the age groups
# under 40.
SELECT count(patAge) as Age_group_UNDER_40
FROM  PATIENTS where PatAge<40;


#2- Write a query to find the number of visits made by each patient. Display the data in sorted order
# of patients.
Select v.PatID,v.No_of_visits  
from visits v order by v.No_of_visits;

#3-Write a query to find the average age of mental patients.
select PatHistory,avg(PatAge) as Average_MENTAL_PAT_AGE from PATIENTS
where PatHistory='MENTAL';

#4 Write a query to find the average age of patients affected by each disease. Display the rounded
#  value of the average.
select PatHistory,ROUND(avg(PatAge)) as Average_Disease_age From Patients
group by PatHistory;

#5- Write a query to find the sum of doctors’ fee for doctors in each department.
select DocDept,sum(DocFee) AS sum_of_docfee_dept from doctors
group by DocDept;

#6- Write a query to find the most recent date on which a visit has been made by some patient.
Select max(v.date_of_visit) as MOSTE_recent_DATE  from visits v;






