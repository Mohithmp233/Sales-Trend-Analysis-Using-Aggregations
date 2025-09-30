# Sales Trend Analysis Using MySQL

Objective
Analyze monthly revenue and order volume from the **Online Sales Data** dataset using SQL aggregation functions.

Steps Performed
1.  Dataset Review 
   - The dataset included columns: Transaction ID, Date, Product Category, Product Name, Units Sold, Unit Price, Total Revenue, Region, and Payment Method.  
   - Revenue was already calculated as `Units Sold * Unit Price`.

2.  SQL Table Creation 
   - Created a table `online_sales` with appropriate columns and data types.

3.  SQL Query for Trend Analysis
   - Extracted year and month using `YEAR(Date)` and `MONTH(Date)`.  
   - Calculated total monthly revenue with `SUM(Total_Revenue)`.  
   - Calculated monthly order volume with `COUNT(DISTINCT Transaction_ID)`.  
   - Sorted results using `ORDER BY year, month`.

4.  Results  
   - Generated a summary table showing monthly revenue and order volume for 2024.  
   - Example: January 2024 had the highest revenue (14,548.32) and 31 unique orders.
