## E-commerce Sales Analysis
  ### Project Overview
This project focuses on analyzing sales data from an E-commerce based in Nigeria business to uncover valuable insights that can support data-driven decision-making.

This imaginary dataset includes:
-Product details (name, category, price)
-Payment details
-sales records (Sales ID, date, quantity)
-Customer information (location, ID, Gender)

#### The analysis covers key performance areas such as:
-Best-selling products

-Loyal customers

-Regional performance

-Customer purchasing patterns by gender

## Business Questions
1. Which product category generated the highest revenue?

2. What are the peak sales months and days?

3. Which regions/customers contribute the most to sales?

4. Which States has the highest number of male and female patronages?

5. Who are our loyal customers?

## Tools & Skills Used
SQL Server for querying and analysis

###### SQL techniques:

SELECT to pull all datasets in a table

Aggregations (SUM, COUNT)

Filtering with WHERE clause

GROUP BY and ORDER BY

JOINS for combining multiple tables

Date-based analysis for month and day extraction

 ## Key Insights
Identified the top-selling products contributing the most to revenue.

Discovered our loyal customers
Highlighted key customer segments and regions driving sales growth.


[Ecommerce_Sales_ Analysis] (https://github.com/Vicky-2005-tech/Vicky_TechSQL-Portfolio/blob/main/Okafor%20Victoria%20Sql%20Portfolio.sql )– Contains all the SQL queries used in this project.

  ## Recommendations
 - The team shoould add a female related product cateogory and little incentives(gift or discounts) to balance the sales by gender.

 - The company should visit Kano to truly understand their market and give them irrestible offers to boast sales in their city.

 - The two customers that gave the company the most patronage should be given loyalty gifts and celebrated on the company's Social media to encourage other customers.

# DDL PROJECT

 ## Hospital Management SQL Project
 ### Project Overview
This project is a Hospital Management System built using SQL.
It demonstrates the use of Data Definition Language (DDL) and Data Manipulation Language (DML) to create, manage, and update hospital-related records including departments, patients, and billing systems.

* Technologies Used 
SQL Server
GitHub for version control


│
├── Create_Hosp_Departments.sql
├── Create_Hosp_Patients.sql
├── Create_Hosp_Bills.sql
├── Insert_Hosp_Departments.sql
├── README.md
└── Screenshots/
    ├── Departments_Table_Screenshot.jpeg
    ├── Patients_Table_Screenshot.jpeg
    ├── Bills_Table_Screenshot.jpeg
    └── Final_Query_Result.jpeg
# Database Tables and Scripts

1.  Hosp_Departments Table
Column	Data Type
Department_ID	INT
Department_Name	VARCHAR(50)
Department_Location	VARCHAR(50)
Department_Head	VARCHAR(50)

Sample Data:
sql
INSERT INTO Hosp_Departments VALUES
(001, 'Cardiology', 'First Floor', 'Dr. Orji Ugo'),
(002, 'Neurology', 'Second Floor', 'Dr. George Thomas'),
(003, 'Pediatrics', 'Third Floor', 'Dr. Victoria Okafor'),
(004, 'Surgery', 'Fourth Floor', 'Dr. Hilary Obasi'),
(005, 'Orthopedics', 'Ground Floor', 'Dr. Anyanwu Smart');

# 2. Hosp_Patients Table

Column	Data Type
Patient_ID	INT
Patient_Name	VARCHAR
Patient_Address	VARCHAR
DOB	DATE
Gender	VARCHAR
Contact	VARCHAR
Emergency_Contact	VARCHAR

# 3. Hosp_Bills Table
Column	Data Type
Bill_ID	INT
Patient_ID	INT
Service_ID	INT
Bill_Date	DATE
Amount	INT
Payment_Status	VARCHAR
Payment_Method	VARCHAR
Due_Date	DATE

### Key SQL Concepts Demonstrated
 * Table creation using CREATE TABLE

* Data insertion using INSERT INTO

* Database structuring for relational management

* Proper use of primary and foreign keys

* Data normalization principles

 Project Screenshots
 Departments Table

 Patients Table

 Bills Table

 Final Query Result

. Learning Points
- Database design for hospital management systems

- Understanding relational database principles

 -Working with DDL and DML in practical scenarios

- Enhancing SQL skills for real-world applications

 Conclusion
This project provides hands-on experience in designing hospital databases, handling patient records, billing systems, and department management using SQL.

 Contact Me
LinkedIn:[ www.linkedin.com/in/okafor-victoria-127a70228]
Email: okaforvictoria2000@gmail.com

