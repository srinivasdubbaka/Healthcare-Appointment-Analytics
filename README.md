# Healthcare Appointment Analytics

## 📌 Overview
This project demonstrates a database for analyzing healthcare appointments, including patient demographics, clinician performance, revenue, and appointment trends.

## 🌟 Objectives
- To organize healthcare appointment data into a structured database.
- To analyze key metrics like revenue, no-show rates, and appointment trends using SQL.

## 🛠️ Features
- **Database Creation:** `Healthcare_Appointment_Analytics` schema with normalized tables for patients, clinicians, and appointments.
- **Data Analysis Queries:**
  - Total appointments by clinician.
  - No-show rates by appointment type.
  - Revenue analysis by clinician.
  - Weekly appointment trends.
  - Appointment statistics by gender.

## 📊 Dataset
- **Patients Table:** Information about patients, including their age, gender, and city.
- **Clinicians Table:** Details of healthcare providers, including specialties and years of experience.
- **Appointments Table:** Records of appointments, including types, revenues, and no-show statuses.

## 🗃️ Schema Design
- **`Patients` Table:**
  - `PatientID`: Unique identifier for patients.
  - `Name`, `Age`, `Gender`, `City`: Basic patient details.
- **`Clinicians` Table:**
  - `ClinicianID`: Unique identifier for clinicians.
  - `Name`, `Specialty`, `ExperienceYears`: Clinician details.
- **`Appointments` Table:**
  - `AppointmentID`: Unique identifier for appointments.
  - `PatientID`, `ClinicianID`: Foreign keys referencing `Patients` and `Clinicians`.
  - `AppointmentDate`, `AppointmentType`, `Revenue`, `NoShow`: Appointment-specific details.

## 🔍 Key Insights
1. **Top Performing Clinicians:** 
   ```sql
   SELECT c.Name AS ClinicianName, COUNT(a.AppointmentID) AS TotalAppointments
   FROM Appointments a
   JOIN Clinicians c ON a.ClinicianID = c.ClinicianID
   GROUP BY c.Name;

2. **No-Show Rates:**
   ```sql
   SELECT AppointmentType, COUNT(CASE WHEN NoShow = TRUE THEN 1 END) * 100.0 / COUNT(*) AS NoShowRate
   FROM Appointments
   GROUP BY AppointmentType;

3. **Revenue by Clinician:**
   ```sql
   SELECT c.Name AS ClinicianName, SUM(a.Revenue) AS TotalRevenue
   FROM Appointments a
   JOIN Clinicians c ON a.ClinicianID = c.ClinicianID
   GROUP BY c.Name
   ORDER BY TotalRevenue DESC;

4. **Weekly Trends:**
   ```sql
   SELECT YEAR(AppointmentDate) AS Year, WEEK(AppointmentDate) AS WeekNumber, COUNT(*) AS WeeklyAppointments
   FROM Appointments
   GROUP BY YEAR(AppointmentDate), WEEK(AppointmentDate)
   ORDER BY Year, WeekNumber;

5. **Appointments by Gender:**
   ```sql
   SELECT p.Gender, COUNT(a.AppointmentID) AS TotalAppointments, AVG(a.Revenue) AS AverageRevenue
   FROM Appointments a
   JOIN Patients p ON a.PatientID = p.PatientID
   GROUP BY p.Gender;


## 🏗️ How to Use
- **Set up the database:**
  - Execute the CREATE DATABASE and CREATE TABLE scripts.
  - Populate the tables using the provided INSERT statements.

- **Run SQL queries:**
  - Copy and paste the provided queries into your SQL Workbench.
  - Analyze the output to uncover insights.
 
## 🌐 Link
- **GitHub Repository:**
  - https://github.com/srinivasdubbaka/Healthcare-Appointment-Analytics/blob/main/healthcare_appointment_analytics.sql
