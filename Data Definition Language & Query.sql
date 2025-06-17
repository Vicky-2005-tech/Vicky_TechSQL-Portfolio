

--This Project demostrates my use of DDL( Data Definition Laguage) in SQL to design and manage a hospital billing system.
--It includes table creation, data updates and relationship creation through joins.
Create Table Hosp_Departments(
Department_id int,
Departmentname varchar (50),
Depart_Location varchar (30),
Department_Head varchar (30)
)

Insert into Hosp_Departments(Department_id,Departmentname,Depart_Location,Department_Head)values
(001,'Cardiology','First Flour', 'Dr.Orji Ugo'),
(002,'Neaurology','Second Flour',' Dr. George Thomas'),
(003,'Pediatrics','Third Flour', 'Dr.Victoria Okafor'),
(004,'Surgery','Fourth Flour','Dr.Hilary Obasi'),
(005,'Orthopedics', 'Ground Flour','DR. Anyanwu Smart');

Create Table Hosp_Patients(
Patient_id int,
Patient_name varchar(50),
patient_address varchar (50),
DOB date ,
Gender varchar (20),
Contact varchar(20),
Emergency_Contact varchar(20))

Insert Into Hosp_Patients(Patient_id,Patient_name,Patient_address,DOB,Gender, Contact,Emergency_Contact)values
(001, 'James Henry','Lagos','1990-02-09','Male',08022345678,08022345679),
(002, 'Franca James','Abuja','1996-08-06', 'Female',09033456789,09033456787),
(003, 'Josh Thomas','Lagos','1995-02-04','Male',08100104675,081001046751),
(004, 'Emily Willams', 'Abuja','1998-12-12', 'Female', 07098761234,07098761233),
(005, 'Jame Smith', 'Lagos', '1985-09-01','Female', 08123456789,08123456781)

update Hosp_Patients 
set Patient_name  ='Jane Smith'
Where Patient_id = 005

Create Table Hosp_Bills(
Bill_id int,
Patient_id int,
Service_id int,
Bill_date date,
Amount int,
Payment_Status varchar (20),
Payment_method varchar (20),
Due_Date date)

Insert into Hosp_Bills(
Bill_id,Patient_id,Service_id,Bill_date,Amount,Payment_Status,Payment_method,Due_Date)values
(001,002,010,'2025-11-02',150000,'Paid','Transfer','2024-12-05'),
(002,001,011,'2024-12-03',300000,'Paid','Cash','2024-12-06'),
(003,003,012,'2024-10-04',500000,'Not Paid','Debt','2024-12-07'),
(004,002,013,'2024-09-05',700000,'Paid','Transfer','2024-12-08'),
(005,004,014,'2024-08-06',900000,'Paid','Transfer','2024-12-09')

alter Table Hosp_Bills  Add Patient_Depart varchar (20)

update Hosp_Bills
set Patient_Depart ='Cardiology'
Where Patient_id =001

update Hosp_Bills
Set Patient_Depart ='Neurology'
where Patient_id =002

update Hosp_Bills 
Set Patient_Depart ='Cardiology'
where Patient_id = 003

update Hosp_Bills 
set Patient_Depart ='Cardiology'
where Patient_id =004

Update Hosp_Bills 
Set Patient_Depart = 'Neurology'
where Patient_id = 005


select * from dbo.Hosp_Departments
select * from dbo.Hosp_Patients
select * from dbo.Hosp_Bills

--Finding Total amount according to states 
select Patient_name p,patient_address a ,sum(b.Amount) as total
from dbo.Hosp_Patients p
join dbo.Hosp_Bills b on p.Patient_id = b.Patient_id 
group by Patient_name , patient_address
rank over(order by Patient_Name)
having  patient_address = 'Abuja'


--Finding the Total amount realized from each Hospital Department and filtering by transferred funds so we can check our bank transactions.
select Patient_id,Patient_Depart,Payment_method, sum(amount) as Total 
from dbo.Hosp_Bills 
group by patient_id, Payment_method,Patient_Depart
having payment_method = 'Transfer'