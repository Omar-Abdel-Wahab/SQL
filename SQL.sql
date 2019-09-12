CREATE TABLE Hospital
(
  name varchar(255) PRIMARY KEY,
  city varchar(255),
  street varchar(255)
);

CREATE TABLE Pharmacy
(
  ID int PRIMARY KEY,
  floor varchar(255),
  Hosp_name varchar(255)
);

CREATE TABLE Medication
(
  name varchar(255) PRIMARY KEY,
  quantity int,
  price int
);

CREATE TABLE make
(
  ID_m int,
  name_m varchar(255), PRIMARY KEY(ID_m, name_m)
);

CREATE TABLE Reception
(
  Recpt_ID int PRIMARY KEY,
  Telephone_No int,
  Hos_name varchar(255)
);

CREATE TABLE Receives
(
  name_r varchar(255),
  Out_SSN_r int, PRIMARY KEY(name_r, Out_SSN_r)
);

CREATE TABLE Patient
(
  SSN int PRIMARY KEY,
  name varchar(255),
  disease varchar(255),
  phone_no int,
  national_id varchar(255) UNIQUE NOT NULL,
  age int
);

CREATE TABLE Out_patient
(
  out_SSN int PRIMARY KEY,
  last_visit date
);

CREATE TABLE In_patient
(
  in_SSN int PRIMARY KEY,
  room_No int,
  Exit_date date
);

CREATE TABLE visit
(
  H_name varchar(255),
  P_SSN int PRIMARY KEY(H_name, P_SSN)
);

CREATE TABLE Clinic
(
  Clinic_no int PRIMARY KEY,
  open_time time,
  specialization varchar(255),
  duration int,
  Rec_ID int
);

CREATE TABLE Visits
(
  out_SSN_v int,
  CNum int, PRIMARY KEY(out_SSN_v, CNum),
  visit_time time
);

CREATE TABLE Department
(
  Dep_no int PRIMARY KEY,
  Dep_name varchar(255),
  Employees_Num int,
  MSSN int
);

CREATE TABLE contains
(
  Hosp_name varchar(255),
  DNUM int, PRIMARY KEY(Hosp_name, DNUM)
);

CREATE TABLE Operation
(
  Operation_ID int PRIMARY KEY,
  Cost int
);

CREATE TABLE gets
(
  GSSN int,
  op_id int, PRIMARY KEY(GSSN, op_id)
);

CREATE TABLE Performs
(
  id_op int,
  s_SSN int, PRIMARY KEY(id_op, s_SSN),
  Date date
);

CREATE TABLE Employee
(
  SSN int PRIMARY KEY,
  Fname varchar(255),
  Lname varchar(255),
  salary int,
  gender varchar(255),
  age int,
  H_name varchar(255)
);

CREATE TABLE Doctor
(
  DSSN int PRIMARY KEY,
  License_No int,
  specialization varchar(255)
);

CREATE TABLE Treating_Doctor
(
  TSSN int PRIMARY KEY,
  degree varchar(255)
);

CREATE TABLE Surgeon
(
  Sur_SSN int PRIMARY KEY,
  No_of_successful_operation int
);

CREATE TABLE Nurse
(
  NSSN int PRIMARY KEY,
  Duty varchar(255),
  DSSN int,
  Clinic_no int
);

CREATE TABLE Nurse_shift
(
  NSSN int,
  Shift_time time, PRIMARY KEY(NSSN, Shift_time)
);

CREATE TABLE Receptionist
(
  RSSN int PRIMARY KEY,
  Recp_ID int
);

CREATE TABLE Recep_lang
(
  RSSN int,
  Language varchar(255), PRIMARY KEY(RSSN, Language)
);

CREATE TABLE Pharmacist
(
  PSSN int PRIMARY KEY,
  Pharm_ID int
);

CREATE TABLE Pharmacist_shift
(
  PSSN int,
  Shift_time time, PRIMARY KEY(PSSN, Shift_time)
);

CREATE TABLE Treats
(
  OSSN int,
  Tre_SSN int, PRIMARY KEY(OSSN, Tre_SSN)
);

CREATE TABLE Works_in
(
  Tre_SSN int,
  Cl_Num int, PRIMARY KEY(Tre_SSN, Cl_Num)
);

CREATE TABLE TDoctor_hour
(
  WSSN int,
  Working_hours int, PRIMARY KEY(WSSN, Working_hours)
);

ALTER TABLE make ADD FOREIGN KEY (ID_m) REFERENCES Pharmacy (ID);

ALTER TABLE Receives ADD FOREIGN KEY (name_r) REFERENCES Medication (name);

ALTER TABLE Receives ADD FOREIGN KEY (Out_SSN_r) REFERENCES Patient (SSN);

ALTER TABLE Out_patient ADD FOREIGN KEY (out_SSN) REFERENCES Patient (SSN);

ALTER TABLE In_patient ADD FOREIGN KEY (in_SSN) REFERENCES Patient (SSN);

ALTER TABLE visit ADD FOREIGN KEY (H_name) REFERENCES Hospital (name);

ALTER TABLE visit ADD FOREIGN KEY (P_SSN) REFERENCES Patient (SSN);

ALTER TABLE Clinic ADD FOREIGN KEY (Rec_ID) REFERENCES Reception (Recpt_ID);

ALTER TABLE Visits ADD FOREIGN KEY (out_SSN_v) REFERENCES Patient (SSN);

ALTER TABLE Visits ADD FOREIGN KEY (CNum) REFERENCES Clinic (Clinic_no);

ALTER TABLE Department ADD FOREIGN KEY (MSSN) REFERENCES Employee (SSN);

ALTER TABLE contains ADD FOREIGN KEY (Hosp_name) REFERENCES Hospital (name);

ALTER TABLE contains ADD FOREIGN KEY (DNUM) REFERENCES Department (Dep_no);

ALTER TABLE gets ADD FOREIGN KEY (GSSN) REFERENCES Patient (SSN);

ALTER TABLE gets ADD FOREIGN KEY (op_id) REFERENCES Operation (Operation_ID);

ALTER TABLE Performs ADD FOREIGN KEY (id_op) REFERENCES Operation (Operation_ID);

ALTER TABLE Performs ADD FOREIGN KEY (s_SSN) REFERENCES Employee (SSN);

ALTER TABLE Employee ADD FOREIGN KEY (H_name) REFERENCES Hospital (name);

ALTER TABLE Doctor ADD FOREIGN KEY (DSSN) REFERENCES Employee (SSN);

ALTER TABLE Treating_Doctor ADD FOREIGN KEY (TSSN) REFERENCES Employee (SSN);

ALTER TABLE Surgeon ADD FOREIGN KEY (Sur_SSN) REFERENCES Employee (SSN);

ALTER TABLE Nurse ADD FOREIGN KEY (NSSN) REFERENCES Employee (SSN);

ALTER TABLE Nurse ADD FOREIGN KEY (DSSN) REFERENCES Employee (SSN);

ALTER TABLE Nurse ADD FOREIGN KEY (Clinic_no) REFERENCES Clinic (Clinic_no);

ALTER TABLE Nurse_shift ADD FOREIGN KEY (NSSN) REFERENCES Employee (SSN);

ALTER TABLE Receptionist ADD FOREIGN KEY (RSSN) REFERENCES Employee (SSN);

ALTER TABLE Receptionist ADD FOREIGN KEY (Recp_ID) REFERENCES Reception (Recpt_ID);

ALTER TABLE Recep_lang ADD FOREIGN KEY (RSSN) REFERENCES Employee (SSN);

ALTER TABLE Pharmacist ADD FOREIGN KEY (PSSN) REFERENCES Employee (SSN);

ALTER TABLE Pharmacist ADD FOREIGN KEY (Pharm_ID) REFERENCES Pharmacy (ID);

ALTER TABLE Pharmacist_shift ADD FOREIGN KEY (PSSN) REFERENCES Employee (SSN);

ALTER TABLE Treats ADD FOREIGN KEY (OSSN) REFERENCES Patient (SSN);

ALTER TABLE Treats ADD FOREIGN KEY (Tre_SSN) REFERENCES Employee (SSN);

ALTER TABLE Works_in ADD FOREIGN KEY (Tre_SSN) REFERENCES Employee (SSN);

ALTER TABLE Works_in ADD FOREIGN KEY (Cl_Num) REFERENCES Clinic (Clinic_no);

ALTER TABLE TDoctor_hour ADD FOREIGN KEY (WSSN) REFERENCES Employee (SSN);

ALTER TABLE make ADD FOREIGN KEY (name_m) REFERENCES Medication (name);

INSERT INTO Reception VALUES(1, 267912532, "AMS");

INSERT INTO Reception VALUES(2, 249452034, "BMS");

INSERT INTO Reception VALUES(3, 236856403, "CMS");

INSERT INTO Reception VALUES(4, 271293475, "DMS");

INSERT INTO Reception VALUES(5, 291375478, "EMS");

SELECT Telephone_No, Hos_name
FROM Reception
WHERE Recpt_ID IN (1,3,5)

UPDATE Reception
SET Hos_name = "FMS", Telephone_No = 286534120
WHERE Recpt_ID = 4

INSERT INTO Clinic VALUES(1, "12:00:00", "A", 6, 1);

INSERT INTO Clinic VALUES(2, "10:00:00", "B", 7, 2);

INSERT INTO Clinic VALUES(3, "15:00:00", "C", 5, 3);

INSERT INTO Clinic VALUES(4, "10:00:00", "D", 9, 4);

INSERT INTO Clinic VALUES(5, "14:00:00", "E", 8, 5);

UPDATE Clinic
SET Rec_ID = 2, specialization = "X"
WHERE Clinic_no = 3

UPDATE Clinic
SET Rec_ID = 4, specialization = "G"
WHERE Clinic_no = 5

/*UPDATE Reception
SET Hos_name = "BMS"
WHERE Recpt_ID = 5*/

SELECT Hos_name, open_time, COUNT(*) ,specialization
FROM Reception, Clinic
WHERE Rec_ID = Recpt_ID
GROUP BY REC_ID

INSERT INTO Hospital VALUES("Mokattam Hospital", "Cairo", "9th Street");
INSERT INTO Hospital VALUES("Ain Shams University Hospital", "Cairo", 
"El-Khalifa El-Maamoun Street");
INSERT INTO Hospital VALUES("El Manial Specialized University Hospital", "Cairo", 
"Abdel Aziz Al Saoud Street");

SELECT *
FROM Hospital
HAVING name LIKE "%University%"

UPDATE Hospital 
SET street = "7th street"
WHERE name = "Mokattam Hospital"

DELETE FROM Hospital
WHERE street = "Abdel Aziz Al Saoud Street"

INSERT INTO Operation VALUES(1, 5000);
INSERT INTO Operation VALUES(2, 25000);
INSERT INTO Operation VALUES(3, 100000);

UPDATE Operation
SET Cost = 9000 
WHERE Operation_ID = 1

DELETE FROM Operation
WHERE Operation_ID = 3

SELECT MAX(Cost)
FROM Operation


INSERT INTO Medication VALUES("Amlodipine", 50, 5000);
INSERT INTO Medication VALUES("Azithromycin", 250, 500);
INSERT INTO Medication VALUES("Vicodin ", 1000, 65);
INSERT INTO Medication VALUES("Simvastatin", 70, 5000);
INSERT INTO Medication VALUES("Lisinopril", 250, 700);
INSERT INTO Medication VALUES("Metformin", 1000, 65);

SELECT *
FROM Medication
WHERE quantity < 300
ORDER BY price

UPDATE Medication
SET quantity = 400, price = 400 
WHERE name = "Azithromycin"

SELECT SUM(quantity)
FROM Medication


SELECT MAX(price), AVG(price), MIN(quantity)
FROM Medication


INSERT INTO Employee VALUES(1, "Mostafa", "ElRosasy", 7000, "M", 21, "Mokattam Hospital");
INSERT INTO Employee VALUES(2, "Seif", "Mohamed", 8000, "M", 21, "Ain Shams University Hospital");
INSERT INTO Employee VALUES(3, "Omar", "Magdy", 5000, "M", 20, "Ain Shams University Hospital");


INSERT INTO Pharmacy VALUES(1564483, "1", 
"Ain Shams University Hospital");
INSERT INTO Pharmacy VALUES(1578983, "4", 
"Ain Shams University Hospital");
INSERT INTO Pharmacy VALUES(1526545, "2", 
"Mokattam Hospital");

SELECT Fname, Lname, salary, age, name, city, street
FROM Employee, Hospital
WHERE H_name = name
Having salary > 6000
ORDER BY age