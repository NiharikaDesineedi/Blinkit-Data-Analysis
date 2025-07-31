SELECT
CONCAT(CAST(SUM(Sales)/1000000 AS DECIMAL(10,2)),'M') AS Total_Sales_in_Millions,
CAST(AVG(Sales) AS DECIMAL(10,1)) AS Average_Sales,
COUNT(*) AS Num_Of_Orders,
CAST(AVG(Rating) AS DECIMAL(10,2)) AS Average_Ratings
FROM Blinkit_data
SELECT
Item_Fat_Content,
CONCAT(CAST(SUM(Sales)/1000000 AS DECIMAL(10,2)),'M') AS Total_Sales_per_FatContent,
CAST(AVG(Sales) AS DECIMAL(10,1)) AS Average_Sales,
COUNT(*) AS Num_Of_Orders,
CAST(AVG(Rating) AS DECIMAL(10,2)) AS Average_Ratings
FROM Blinkit_data
GROUP BY Item_Fat_Content
ORDER BY Total_Sales_per_FatContent DESC
SELECT 
Item_Type,
CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales_per_Fat_Content,
CAST(AVG(Sales) AS DECIMAL(10,1)) AS Average_Sales,
COUNT(*) AS Num_Of_Orders,
CAST(AVG(Rating) AS DECIMAL(10,2)) AS Average_Ratings
FROM Blinkit_data
GROUP BY Item_Type
ORDER BY Total_Sales_per_Fat_Content DESC
SELECT
Item_Fat_Content,
Outlet_Location_Type,
CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
CAST(AVG(Sales) AS DECIMAL(10,1)) AS Average_Sales,
COUNT(*) AS Num_Of_Orders,
CAST(AVG(Rating) AS DECIMAL(10,2)) AS Average_Ratings
FROM Blinkit_data
GROUP BY Item_Fat_Content,Outlet_Location_Type
ORDER BY Total_Sales ASC
---QUERY---
SELECT 
    Outlet_Location_Type,
    ISNULL([Low Fat], 0) AS Low_Fat,
    ISNULL([Regular], 0) AS Regular
FROM (
    SELECT 
        Outlet_Location_Type, 
        Item_Fat_Content, 
        CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales
    FROM blinkit_data
    GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS SourceTable
PIVOT (
    SUM(Total_Sales)
    FOR Item_Fat_Content IN ([Low Fat], [Regular])
) AS PivotTable
ORDER BY Outlet_Location_Type;

SELECT
Outlet_Establishment_Year,
CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales,
CAST(AVG(Sales) AS DECIMAL(10,1)) AS Average_Sales,
COUNT(*) AS Num_Of_Orders,
CAST(AVG(Rating) AS DECIMAL(10,2)) AS Average_Ratings
FROM Blinkit_data
GROUP BY Outlet_Establishment_Year
ORDER BY Total_Sales DESC

SELECT
Outlet_Size,
SUM(Sales) AS Total_Sales,
CONCAT(CAST(SUM(Sales) * 100.0 / SUM(SUM(Sales)) OVER () AS DECIMAL(10,2)), '%') AS Sales_Percentage
FROM Blinkit_data
GROUP BY Outlet_Size
ORDER BY Total_Sales DESC








