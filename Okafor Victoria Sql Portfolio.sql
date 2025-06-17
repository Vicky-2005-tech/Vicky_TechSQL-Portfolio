/* Project Name: E-Commerce Sales Analysis(Nigerian Based Store)
Project Description: This project uses an imaginary dataset representing an e-commerce store based in Nigeria with customers from various cities across the country. 
The Database consist of four(4) tables: 500 rows and 5 columns from the customers,Payment and product table,50 rows and 4 columns on the sales table.
 The aim of this analysis is to draw valuable business insights and answer key analytical questions using sql,
 with primary focus on understanding customers didtribution, product performance, overall sales trend and recommendations.
The key analytical questions includes but not limited to :
  1. Retrive all datasets from the database using a dbms tool
  2. Find out what city has the highest volume of customers.
  3. Total revenue generated per city.
  4. Customers most preferred payment method.
  5. Most In-demand products.
  Tools;Database Management System(DBMS)--Microsoft SQL Server
  --
  Data retrival,cleaning and analysis done via SQL queries.
  --All datasets have been retrieved from the database using the SELECT statement,The SQL querries written below and to explore, analyze and visualize data relationships across the four tables*/

--Question 1, The query below was used to find out how many rows is contained in each table
select count(*) as total_rows from dbo.payments
select count(*) as total_rows from dbo.[products (1)];
select count(*) as total_rows from dbo.customers
select count(*) as total_rows from dbo.sales
-- Query below was use for exploration of all tables
select * from dbo.customers
select * from dbo.payments
select * from dbo.[products (1)]
select * from dbo.sales;

                --The Customers Table
select distinct first_name + (' ')+last_name from dbo.customers as Customers
update dbo.customers 
set first_name =first_name+' '+ last_name--This was used to update the column from two different columns with the names to one
alter table dbo.customers
drop column last_name
exec sp_rename'dbo.customers.first_name','Full_Name','column'-- This was used to rename the first name column after the concat.

 --Analysis by gender
 select city,gender,Count(customer_id) as COC
from dbo.customers
group by city,gender
order by COC desc-- COC in this context means count of city. 

 --Question 2 and 3
 select city, count(distinct customer_id) as customer_count, sum(price) as Price
from dbo.customers
full join dbo.[products (1)] on product_id = customer_id
group by city
order by Price desc
--The analysis of the customers table shows that in city(Abuja,PH and Kano) we have more male customers then females.
-- We have the most customers in ibandan with 106 customers and 102 in Abj and PH,101 in lagos and kano the lowest 89 
-- Abuja has the highest sales with 388522 and this was achieved by joining the price from product table to the customers table.

---- Product Table
select * from dbo.[products (1)]
select category, sum(price) as TSBC-- TBSC means Total Sales By Category and the store has only 5 product categories with fashion as the most in_demand category.
from dbo.[products (1)]
group by  category
order by TSBC desc


--Had to drop the sale_id column as it appeared also on the sales table hence causing an issue in joining the table with another.
alter table dbo.payments
drop column sale_id

select * from dbo.payments
  ---Payment Table
 --Question 4
select payment_method, sum(amount) as COA
from dbo.payments
group by payment_method order by payment_method desc
--From the query above the preferred payment method is POS with 750980 in sum and followed by transfer.

select category, sum(price) as SBC from dbo.[products (1)]
-- SBC in this context means SALES BY CATEGORY which is the new column name for the sum of products by category.
GROUP BY category ORDER BY SBC DESC

alter table dbo.sales
drop column product_id-- The table here was altered and a column dropped  to scrap product_id as it appeared  in two different columns 
select * from sales
select* from dbo.payments
     
  -- Payment and Sales Table joined
select customer_id,sum(amount) as TA
from dbo.sales
join dbo.payments on sale_id = payment_id
group by customer_id  order by TA desc---Customer 459 paid the highest amount for goods(35583)

select sale_date, count (customer_id) as COC, sum(quantity) as QBD,
datename(month,sale_date) as MOS,-- Month of Sales
datename(day,sale_date) as DOS--Day of Sales
from dbo.sales
group by sale_date order by MOS desc

select customer_id as customerid, count (*) as NOS, sum(quantity) as TQ 
--The NOS and TQ stands for Number of Sales and Total Quantity sold,
--it was used to show the number of times a customer patronized the store and the total goods he or she bought
from dbo.sales
group by customer_id order by customer_id desc
--- Customer 497 is our best customer as he got a total of 9products in three occasions.
select* from customers where customer_id in(497,459)
--Finding the exact customers on our loyalty list

                           /* Key Findings
1.The analysis of the customers table shows that in city(Abuja,PH and Kano) we have more male customers then females.
2.We have the most customers in ibandan with 106 customers and 102 in Abj and PH,101 in lagos and kano the lowest 89 
3.Abuja has the highest sales with 388522 and this was achieved by joining the price from product table to the customers table.
4.The store has only 5 product categories with fashion as the most in_demand
5.The preferred payment method is POS with 750980 in sum and followed by transfer.
6.Customer 459(Jane Davis) from Kano paid the highest amount for goods(35583)
7.Customer 497(David Williams) from Abuja bought from our store the most a total of 9products in three occasions.
    
	                     ----Recommendations
	  --The team shoould add a female related product cateogory and little incentives(gift or discounts) to balance the sales by gender.
	  -- The company should visit Kano to truly understand their market and give them irrestible offers to boast sales in their city.
	  -- The two customers that gave the company the most patronage should be given loyalty gifts and celebrated on the company's Social media to encourage other customers.
