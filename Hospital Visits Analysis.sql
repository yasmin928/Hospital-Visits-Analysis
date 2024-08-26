/*a. Question 1: Hospital Visits Analysis
Description: Create a data warehouse schema to analyze hospital visits, 
with dimensions for time, patient, doctor, and department.
Measures should include visit count, total charge, and profit.*/
CREATE DATABASE HospitalVisitsAnalysis

CREATE TABLE DimTime
(
	Time_id INT PRIMARY KEY IDENTITY,
	Day_of_week VARCHAR(10),
	Month VARCHAR(10),
	Quarter INT,
	Year INT
)



CREATE TABLE DimPatient
(
	Patient_id INT PRIMARY KEY IDENTITY,
	Name VARCHAR(100),
	Phone VARCHAR(15),
	GENDER VARCHAR(10),

)

CREATE TABLE DimDepartment
(
Departmint_id INT PRIMARY KEY IDENTITY,
Departmint_name VARCHAR(100)
)
CREATE TABLE DimDoctor
(
	Doctor_id INT PRIMARY KEY IDENTITY,
	Name VARCHAR(100),
	Phone VARCHAR(15),
	GENDER VARCHAR(10),
	Departmint_id INT,
	FOREIGN KEY (Departmint_id) REFERENCES DimDepartment(Departmint_id)
)

CREATE TABLE FactHospitalVisit
(
	visit_id INT PRIMARY KEY IDENTITY,
	Time_id INT, 
	Patient_id INT,
	Doctor_id INT,

	Count INT,
	Charge MONEY,
	PROFIT MONEY,

	FOREIGN KEY (Time_id) REFERENCES DimTime(Time_id),
	FOREIGN KEY (Patient_id) REFERENCES DimPatient(Patient_id),
	FOREIGN KEY (Doctor_id) REFERENCES DimDoctor(Doctor_id)
)