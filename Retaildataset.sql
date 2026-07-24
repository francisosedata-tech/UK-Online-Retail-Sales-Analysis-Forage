CREATE DATABASE IF NOT EXISTS online_retail_db;
USE online_retail_db;

CREATE TABLE RetailTable (
    InvoiceNo      VARCHAR(20),
    StockCode      VARCHAR(20),
    Description    TEXT,
    Quantity       INT,
    InvoiceDate    DATETIME,
    UnitPrice      DECIMAL(10,2),
    CustomerID     VARCHAR(20),
    Country        VARCHAR(100),
    Year           INT,
    Sales          DECIMAL(12,2),
    PRIMARY KEY (InvoiceNo)   -- Composite key is better
) ENGINE=InnoDB;

DROP TABLE IF EXISTS RetailTable;

SHOW variables LIKE 'Secure_file_priv';



DROP TABLE IF EXISTS UKRetailTable;

CREATE TABLE UKRetailTable (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Descriptions TEXT,
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10,2),
    Country VARCHAR(100),
    Year INT,
    Sales DECIMAL(10,2),
    CustomerID VARCHAR(20),
    CustomerType VARCHAR(50),
    Latitude DECIMAL(15,8),
    Longitude DECIMAL(15,8)
);

Select *
From UKretailtable
limit 10;


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/UKRetailDatasetcleaned.csv'
INTO TABLE UKretailtable
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Invoiceno, StockCode, Descriptions, Quantity, @InvoiceDate, UnitPrice, Country, Year, @Sales, CustomerID, CustomerType, @Latitude, @Longitude)
SET 
    InvoiceDate = STR_TO_DATE(@InvoiceDate, '%m/%d/%Y %H:%i:%s'),
    Sales = NULLIF(@Sales, ''),
    Latitude = NULLIF(@Latitude, ''),
    Longitude = NULLIF(@Longitude, '');

    
    -- Check total rows
SELECT
 COUNT(*) 
 FROM UKretailtable;

-- Check first 10 rows
SELECT *
 FROM RetailTable_New
 LIMIT 10;

-- Check for any bad dates or prices
SELECT * FROM UKretailtable 
WHERE InvoiceDate IS NULL 
   OR UnitPrice IS NULL 
LIMIT 20;


-- Basic Summary
SELECT
	count(*) AS Total_Rows,
    Round(sum(sales), 2) AS Total_Sales,
    count(distinct Invoiceno) AS Total_Invoices,
    count(distinct Description) AS Total_Items,
    sum(quantity) AS Total_Orders,
    count(distinct customerID) AS Total_customers,
    count(distinct country) AS Total_countries,
    Min(Invoicedate) AS First_date,
    Max(Invoicedate) AS Last_date
From UKretailtable;

-- Total Registered & Anonymous Customers
Select 
	case when customertype = 'Registeredcustomer' Then 'Registered' Else 'Anonymous'
    End as Customer_Category,
    count(distinct customerid) AS Total
From UKretailtable
group by customertype;

-- Revenue generated and Orders from each region
Select
	Country,
    sum(quantity) AS Total_quantity,
    round(sum(sales), 2) AS Revenue_Generated,
    round(avg(sales), 2) AS Avg_order_value,
    count(distinct customerID) AS Total_customers
FROM UKretailtable
Group by country
Order by revenue_generated desc;

-- Top 10 Countries by Revenue excluding the UK
Select Country,
	round(sum(sales), 2) AS Total_Revenue,
    sum(quantity) AS Total_items_sold,
    count(distinct customerID) AS Customer
From UKretailtable
where country != 'United Kingdom'
Group by Country
Order by Total_Revenue desc
Limit 10;


-- Least 10 countries by revenue
Select Country,
	round(sum(sales), 2) AS Total_Revenue,
    sum(quantity) AS Total_items_sold,
    count(distinct customerID) AS Total_Customers
From UKretailtable
where country != 'United Kingdom'
Group by Country
Order by Total_Revenue asc
Limit 10;

-- Top 10 customers by Revenue
Select CustomerID, country, customertype,
	Round(sum(sales), 2) AS Total_Revenue,
    sum(quantity) AS Total_items_purchased,
    round(avg(sales), 2) AS Avg_order_value
From UKretailtable
Group by CustomerID
Order by Total_revenue desc
Limit 10;

-- Top 10 Best Selling Products
Select stockcode,
	left(descriptions, 60) AS Short_description,
	round(sum(sales), 2) AS Total_Revenue,
    count(distinct invoiceno) AS Total_order,
    sum(quantity) AS Total_quantity_sold
From UKretailtable
Group by descriptions, stockcode 
Order by Total_revenue desc
Limit 10;
    
    
-- Monthly trend for 2011
Select 
	 Year(invoicedate) AS 'Year',
     monthname(invoicedate) AS Month_name,
	round(sum(sales), 2) AS Total_Revenue
From UKretailtable
where year(invoicedate) = '2011'
Group by year(invoicedate), month(invoicedate)
Order by Total_revenue desc;

-- Product Demand Analysis by Country (Top Products)
SELECT 
    Country,
    Descriptions,
    StockCode,
    COUNT(DISTINCT InvoiceNo) AS Times_Purchased,
    SUM(Quantity) AS Total_Quantity_Sold,
    ROUND(SUM(Sales), 2) AS Total_Revenue_Generated
FROM UKretailtable
WHERE Country != 'United Kingdom'
GROUP BY Country, Descriptions, StockCode
HAVING SUM(sales) > 4000
ORDER BY Total_Revenue_Generated DESC;

-- Top 5 Products per Country
WITH RankedProducts AS (
    SELECT 
        Country,
        Descriptions,
        StockCode,
        SUM(Quantity) AS Total_Quantity_Sold,
        ROUND(SUM(Sales), 2) AS Total_Revenue,
        ROW_NUMBER() OVER (PARTITION BY Country ORDER BY SUM(Quantity) DESC) AS 'Rank'
    FROM UKretailtable
    GROUP BY Country, Descriptions, StockCode
)
SELECT * FROM RankedProducts 
WHERE 'Rank' <= 5
ORDER BY Country, 'Rank';



-- Quantity vs Revenue Correlation
Select 
	Round(avg(unitprice), 2) AS Avg_unit_price,
    sum(quantity) AS Total_quantity,
    Round(sum(sales), 2) AS Total_revenue,
    Round(sum(sales)/sum(quantity), 2) AS Avg_price_per_unit
From UKretailtable
Group by Year(InvoiceDate);



