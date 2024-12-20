Create database Healthcare_Appointment_Analytics;
Use Healthcare_Appointment_Analytics;
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    City VARCHAR(100)
);
CREATE TABLE Clinicians (
    ClinicianID INT PRIMARY KEY,
    Name VARCHAR(100),
    Specialty VARCHAR(100),
    ExperienceYears INT
);
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    ClinicianID INT,
    AppointmentDate DATE,
    AppointmentType VARCHAR(50),
    Revenue DECIMAL(10, 2),
    NoShow BOOLEAN,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (ClinicianID) REFERENCES Clinicians(ClinicianID)
);
INSERT INTO Patients (PatientID, Name, Age, Gender, City) VALUES
(1, 'John Doe', 45, 'Male', 'Vancouver'),
(2, 'Jane Smith', 34, 'Female', 'Toronto'),
(3, 'Michael Brown', 29, 'Male', 'Calgary'),
(4, 'Emily Davis', 52, 'Female', 'Montreal'),
(5, 'Sarah Wilson', 38, 'Female', 'Edmonton');
INSERT INTO Clinicians (ClinicianID, Name, Specialty, ExperienceYears) VALUES
(1, 'Dr. Anna Taylor', 'Cardiology', 12),
(2, 'Dr. Robert King', 'Dermatology', 8),
(3, 'Dr. Susan Lee', 'Pediatrics', 10),
(4, 'Dr. David Harris', 'Orthopedics', 15);
INSERT INTO Appointments (AppointmentID, PatientID, ClinicianID, AppointmentDate, AppointmentType, Revenue, NoShow) VALUES
(1, 1, 1, '2024-01-01', 'Routine Checkup', 150.00, FALSE),
(2, 2, 2, '2024-01-02', 'Skin Consultation', 200.00, TRUE),
(3, 3, 3, '2024-01-03', 'Vaccination', 50.00, FALSE),
(4, 4, 4, '2024-01-04', 'Fracture Treatment', 300.00, FALSE),
(5, 5, 1, '2024-01-05', 'Heart Checkup', 250.00, TRUE),
(6, 1, 2, '2024-01-06', 'Skin Allergy Test', 180.00, FALSE);
SELECT 
    c.Name AS ClinicianName,
    COUNT(a.AppointmentID) AS TotalAppointments
FROM 
    Appointments a
JOIN 
    Clinicians c ON a.ClinicianID = c.ClinicianID
GROUP BY 
    c.Name;

SELECT 
    AppointmentType,
    COUNT(CASE WHEN NoShow = TRUE THEN 1 END) * 100.0 / COUNT(*) AS NoShowRate
FROM 
    Appointments
GROUP BY 
    AppointmentType;
SELECT 
    c.Name AS ClinicianName,
    SUM(a.Revenue) AS TotalRevenue
FROM 
    Appointments a
JOIN 
    Clinicians c ON a.ClinicianID = c.ClinicianID
GROUP BY 
    c.Name
ORDER BY 
    TotalRevenue DESC;
SELECT 
    YEAR(AppointmentDate) AS Year,
    WEEK(AppointmentDate) AS WeekNumber,
    COUNT(*) AS WeeklyAppointments
FROM 
    Appointments
GROUP BY 
    YEAR(AppointmentDate), WEEK(AppointmentDate)
ORDER BY 
    Year, WeekNumber;
SELECT 
    p.Gender,
    COUNT(a.AppointmentID) AS TotalAppointments,
    AVG(a.Revenue) AS AverageRevenue
FROM 
    Appointments a
JOIN 
    Patients p ON a.PatientID = p.PatientID
GROUP BY 
    p.Gender;
