create database Blinkitdb;

CREATE TABLE Blinkit_data (
    Item_Fat_Content VARCHAR(10),
    Item_Identifier VARCHAR(10),
    Item_Type VARCHAR(25),
    Outlet_Establishment_Year YEAR,
    Outlet_Identifier VARCHAR(10),
    Outlet_Location_Type VARCHAR(10),
    Outlet_Size VARCHAR(10),
    outlet_Type VARCHAR(20),
    Item_Visibility FLOAT,
    Item_Weight FLOAT,
    Total_Sales FLOAT,
    Rating FLOAT
);
select* from blinkit_data ;

select count(*) from blinkit_data;

UPDATE blinkit_data 
SET 
    item_fat_content = CASE
        WHEN item_fat_content IN ('LF' , 'Low fat') THEN 'Low Fat'
        WHEN item_fat_content = 'reg' THEN 'Regular'
        ELSE item_fat_content
    END;
    
    SELECT DISTINCT (item_fat_Content)
FROM
    blinkit_data;
    
SELECT 
    ROUND(SUM(Total_Sales)) AS Total_Sales
FROM
    blinkit_data; 
    
SELECT 
    ROUND(AVG(total_sales)) AS Avg_sales
FROM
    blinkit_data; 

SELECT 
    COUNT(*) AS No_of_items
FROM
    blinkit_data
WHERE
    Outlet_Establishment_Year = 2022;
    
    
SELECT 
    ROUND(AVG(rating),2) AS Avg_rating
FROM
    blinkit_data; 
    
    
SELECT 
    item_fat_content,
    ROUND(SUM(Total_sales), 2) AS Total_Sales,
    ROUND(AVG(total_sales)) AS Avg_sales,
    COUNT(*) AS No_of_items,
    ROUND(AVG(rating), 2) AS Avg_rating
FROM
    blinkit_data
GROUP BY 1;    


SELECT 
    item_type,
    outlet_size,
    ROUND(SUM(total_sales)) AS Total_sales
FROM
    blinkit_data
GROUP BY 1 , 2
ORDER BY 1;


SELECT 
    outlet_location_Type,
    outlet_establishment_year,
    ROUND(SUM(total_sales), 2) AS total_sales
FROM
    blinkit_data
GROUP BY 1 , 2
ORDER BY 1;  
    

SELECT 
    outlet_size,  COUNT(item_type) as Total_items
FROM
    blinkit_data
GROUP BY 1
ORDER BY 1;



