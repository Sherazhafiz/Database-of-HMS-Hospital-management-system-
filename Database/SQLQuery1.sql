CREATE DATABASE HMS;
DROP DATABASE HMS;
-----------------------ADMIN TABLE-----------------
CREATE TABLE Admin(
Admin_Name VARCHAR (30) NOT NULL,
Admin_Password VARCHAR (30) NOT NULL
);
------------INSERTION DATA IN ADMIN TABLE------
INSERT INTO Admin
VALUES
('Muhammad Usman','21-NTU-CS-1361'),
('Sheraz Yasir','21-NTU-CS-1371'),
('Muhammad Ahmad Imtiaz','21-NTU-CS-1347'),
('Muhammad Ali Yaseen','21-NTU-CS-1348');

------------------ HOSPITAL TABLE---------------
CREATE TABLE Hospital(
Hospital_ID VARCHAR(20),
Hospital_Name VARCHAR (40),
Hospital_Address VARCHAR(40),
Hospital_Code VARCHAR(40),
Hospital_BranchCode VARCHAR(40)
CONSTRAINT H_ID_PK1 PRIMARY KEY (Hospital_ID)
);
------------------STAFF TABLE---------------
CREATE TABLE Staff(
Staff_CNIC VARCHAR(15) CHECK (Staff_CNIC LIKE '_____-_______-_'),
Hospital_ID VARCHAR (20) NOT NULL,
Staff_Name VARCHAR(30),
Staff_Role VARCHAR (30),
Staff_ContactDetails bigint NOT NULL,
CONSTRAINT Staff_CNIC_PK1 PRIMARY KEY (Staff_CNIC),
CONSTRAINT H_ID_FK1 FOREIGN KEY (Hospital_ID) REFERENCES Hospital(Hospital_ID)
);
--drop TABLE Staff;

------------------DOCTORINFO TABLE---------------
CREATE TABLE DoctorInfo(
Doctor_Name VARCHAR(30),
Doctor_CNIC VARCHAR(15) CHECK (Doctor_CNIC LIKE '_____-_______-_'),
Doctor_Age INT,
Doctor_ContactDetails BIGINT NOT NULL,
Doctor_Email VARCHAR(30) CHECK(Doctor_Email LIKE '%@%.%'),
Doctor_Schedule VARCHAR (30) NOT NULL,
Doctor_Speciality VARCHAR(30) NOT NULL,
CONSTRAINT Doctor_CNIC_PK1 PRIMARY KEY (Doctor_CNIC)
);
SELECT * FROM DoctorInfo;

------------------DOCTOR TABLE---------------
CREATE TABLE Doctor(
Doctor_ID INT IDENTITY(1,1),
Hospital_ID VARCHAR (20) NOT NULL,
Doctor_CNIC VARCHAR(15) CHECK (Doctor_CNIC LIKE '_____-_______-_')
CONSTRAINT Doctor_ID_PK1 PRIMARY KEY (Doctor_ID),
CONSTRAINT H_ID2_FK FOREIGN KEY (Hospital_ID) REFERENCES Hospital(Hospital_ID),
CONSTRAINT Doctor_CNIC_FK1 FOREIGN KEY (Doctor_CNIC) REFERENCES DoctorInfo(Doctor_CNIC)
);
------------------PatientInfo TABLE---------------
CREATE TABLE PatientInfo(
Patient_Name VARCHAR(20),
Patient_CNIC VARCHAR(15) CHECK (Patient_CNIC LIKE '_____-_______-_'),
Patient_Age INT,
Patient_ContactDetails BIGINT NOT NULL,
Patient_Condition VARCHAR (20),
Patient_Medical_History VARCHAR (100)
CONSTRAINT Patient_CNIC_PK1 PRIMARY KEY (Patient_CNIC)
); 

------------------Patient TABLE---------------
CREATE TABLE Patient(
Patient_ID INT IDENTITY(1,1),
Hospital_ID VARCHAR (20) NOT NULL,
Patient_CNIC VARCHAR(15) CHECK (Patient_CNIC LIKE '_____-_______-_'),
Patient_TDetails VARCHAR (40),
Patient_CDetails VARCHAR (40)
CONSTRAINT Patient_ID_PK1 PRIMARY KEY (Patient_ID),
CONSTRAINT H_ID3_FK FOREIGN KEY (Hospital_ID) REFERENCES Hospital(Hospital_ID),
CONSTRAINT Patient_CNIC_FK1 FOREIGN KEY (Patient_CNIC) REFERENCES PatientInfo(Patient_CNIC)
);
--DROP TABLE Patient;
------------------Perscription TABLE---------------
CREATE TABLE Perscription(
Patient_ID INT,
Doctor_ID INT,
Dozage_Details VARCHAR (40)
CONSTRAINT Perscription_PK1 PRIMARY KEY (Patient_ID,Doctor_ID),
CONSTRAINT Patient_ID_FK1 FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
CONSTRAINT Doctor_ID_FK1 FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID)
);
CREATE TABLE Room(
Room_Number INT,
Hospital_ID VARCHAR(20) NOT NULL,
NumOfBeds INT,
Room_Status Varchar(10),
Room_Price INT
CONSTRAINT Room_Number_PK1 PRIMARY KEY (Room_Number),
CONSTRAINT H_ID4_FK FOREIGN KEY (Hospital_ID) REFERENCES Hospital(Hospital_ID),
);
CREATE TABLE Bill(
Bill_ID VARCHAR(10),
Patient_ID INT,
Room_Number INT,
Amount_Due INT,
Amount_Paid INT
CONSTRAINT Bill_ID_PK1 PRIMARY KEY (Bill_ID),
CONSTRAINT Patient_ID3_FK1 FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
CONSTRAINT Room_Number_FK1 FOREIGN KEY (Room_Number) REFERENCES Room(Room_Number)
);
CREATE TABLE Out_Patient(
OutPatient_ID INT IDENTITY(1,1),
Checkup_date DATE ,
CONSTRAINT OutPatient_ID_PK1 PRIMARY KEY (OutPatient_ID)
);
CREATE TABLE Admitted_Patient(
Admitted_ID INT IDENTITY(1,1),
Admission_date DATE ,
CONSTRAINT Admitted_ID_PK1 PRIMARY KEY (Admitted_ID)
);








