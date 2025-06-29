Use  RetailSDatabase ;
SELECT 
  sale_date AS OriginalDate,
  TRY_CONVERT(DATE, sale_date, 103) AS ConvertedDate
FROM DataRetailSales;
 ALTER TABLE DataRetailSales
ADD sale_date_converted DATE;
Select sale_date_converted 
From DataRetailSales
UPDATE DataRetailSales
SET sale_date_converted = TRY_CONVERT(DATE, sale_date, 103);
Select Count (*) as No_Rows
From DataRetailSales
 Select * 
 From DataRetailSales
 Where transactions_id Is Null 
 Select  *
 From DataRetailSales
  Where transactions_id Is Null 
  Or 
  sale_date_converted IS Null 
  Or 
  sale_time Is Null 
  Or 
  Customer_id Is Null 
  Or 
  gender Is Null 
  Or
  age Is Null 
  Or 
  category Is Null 
  Or 
  quantiy Is null 
  Or
  Price_Per_unit Is Null 
  Or 
  cogs Is Null 
  Or
  total_sale Is Null 
 -- Data Exploration 
 -- How many sales qwe have ?
 Select Count (*) total_sale 
 From DataRetailSales 
 -- Select how many unique  customers we have 
 Select Count (Distinct customer_id) as total_sale
 From DataRetailSales
 -- How many distinct category we have ?
 Select Count(Distinct category) as distinctcatgory
 From DataRetailSales
 Select  Distinct category as distinctcatgory
 From DataRetailSales
-- Data Analysis & Findings

--The following SQL queries were developed to answer specific business questions:

--**Write a SQL query to retrieve all columns for sales made on '2022-11-05**:
Select * 
From DataRetailSales
Where sale_date > '2022-11-05' ;
--**Write a SQL query to retrieve all transactions where the category is 'Clothing' 
---and the quantity sold is more than 4 in the month of Nov-2022
 SELECT *
FROM DataRetailSales
WHERE category = 'Clothing'
AND sale_date_converted BETWEEN '2022-11-01' AND '2022-11-30'
AND quantity >= 4 
--Write a SQL query to calculate the total sales (total_sale) for each category.**:
Select category, Sum(Cast(total_sale as Int)) as totalsale, Count(*) as totalorder
From DataRetailSales
Group by category  
--Write a SQL query to find the average age of customers 
--who purchased items from the 'Beauty' category.**:
Select avg(Cast(age as INT)) as avgAge, category
From DataRetailSales
Where category = 'Beauty'
Group by category
--**Write a SQL query to find all transactions 
--where the total_sale is greater than 1000.**:
Select *
from DataRetailSales
Where total_sale > 1000
--Write a SQL query to find the total number of transactions (transaction_id)
--made by each gender in each category.**:
Select category , gender, Count(*) as totaltransaction
From DataRetailSales
Group by category , gender
-- **Write a SQL query to calculate the average sale for each month. 
--Find out best selling month in each year**:
Select * 
From DataRetailSales;
 SELECT 
  YEAR(sale_date_converted) AS SaleYear,
  MONTH(sale_date_converted) AS SaleMonth,
  AVG(CAST(total_sale AS FLOAT)) AS AverageSale
FROM DataRetailSales
GROUP BY 
  YEAR(sale_date_converted),
  MONTH(sale_date_converted)
ORDER BY 
  SaleYear, SaleMonth;
-- write a SQL query to find the top 5 customers based on highest total sale. 
 Select Top 5 customer_id, 
 Sum(CAST(total_sale AS float)) as total_sale
 From DataRetailSales
 Group by customer_id ;
 -- Write a sql query to find the number of unique customers who purchased items from 
 --each category .
 Select Count(Distinct(customer_id)) as customerCount,
 category
 From DataRetailSales
 Group by category;
 --Write a query to create each shift and no of orders (Example morning <=12, 
 --Afternoon 12 to 17, evening >17)
 SELECT  
  CASE 
    WHEN CAST(LEFT(sale_time, 2) AS INT) < 12 THEN 'Morning'
    WHEN CAST(LEFT(sale_time, 2) AS INT) <= 17 THEN 'Afternoon'
    ELSE 'Evening'
  END AS Shift,    
  COUNT(*) AS NumberOfOrders
FROM DataRetailSales
GROUP BY 
  CASE 
    WHEN CAST(LEFT(sale_time, 2) AS INT) < 12 THEN 'Morning'
    WHEN CAST(LEFT(sale_time, 2) AS INT) <= 17 THEN 'Afternoon'
    ELSE 'Evening'
  END;

--- End oF Prroject -- JULY 25 

 

  


 




Select *
From DataRetailSales 


