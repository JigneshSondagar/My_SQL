show databases;

CREATE database SQL_Project_1;

use SQL_Project_1;

# Import data 

SELECT * from Big_mart bm ;

# 1. WRITE a sql query to show all Item_Identifier
SELECT bm.Item_Identifier from Big_mart bm ;


# 2. WRITE a sql query to show count of total Item_Identifier
SELECT COUNT(bm.Item_Identifier) as Total_Item_Identifier from Big_mart bm ;


# 3. WRITE a sql query to show maximum Item Weight
SELECT MAX(bm.Item_Weight) as Max_Item_Weight from Big_mart bm ;


# 4. WRITE a query to show minimun Item Weight
SELECT MIN(bm.Item_Weight) as MIN_Item_Weight from Big_mart bm ;


# 5. WRITE a query to show average Item_Weight
SELECT ROUND(AVG(bm.Item_Weight),2) as Avrage_Item_Weight from Big_mart bm ;


# 6. WRITE a query to show count OF Item_Fat_Content WHERE Item_Fat_Content IS Low Fat
SELECT count(bm.Item_Fat_Content) as No_of_Item_Fat_Content from Big_mart bm WHERE bm.Item_Fat_Content = 'Low Fat';


# 7. WRITE a query to show count OF Item_Fat_Content WHERE Item_Fat_Content IS Regular
SELECT count(bm.Item_Fat_Content) as No_of_Item_Fat_Content from Big_mart bm WHERE bm.Item_Fat_Content = 'Regular';


# 8. WRITE a query TO show maximum Item_MRP
SELECT ROUND(MAX(bm.Item_MRP),2) as Max_Item_MRP from Big_mart bm ;


# 9. WRITE a query TO show minimum Item_MRP
SELECT MIN(bm.Item_MRP) as MIN_Item_MRP from Big_mart bm ;


# 10. WRITE a query to show Item_Identifier , Item_Fat_Content ,Item_Type,Item_MRP and Item_MRP IS greater than 200
SELECT bm.Item_Identifier, bm.Item_Fat_Content, bm.Item_Type, bm.Item_MRP from Big_mart bm where bm.Item_MRP > 200;


# 11. WRITE a query to show maximum Item_MRP WHERE Item_Fat_Content IS Low Fat
SELECT ROUND(MAX(bm.Item_MRP),2) as Maximum_Item_MRP  from Big_mart bm WHERE bm.Item_Fat_Content = 'Low Fat';


# 12. WRITE a query to show minimum Item_MRP WHERE Item_Fat_Content IS Low Fat
SELECT ROUND(MIN(bm.Item_MRP),2) as Minimum_Item_MRP  from Big_mart bm WHERE bm.Item_Fat_Content = 'Low Fat';


# 13. WRITE a query to show ALL DATA WHERE item MRP IS BETWEEN 50 TO 100
SELECT * FROM Big_mart bm WHERE bm.Item_MRP BETWEEN 50 AND 100;


# 14. WRITE a query to show ALL UNIQUE value Item_Fat_Content
SELECT DISTINCT bm.Item_Fat_Content from Big_mart bm ;


# 15. WRITE a query to show ALL UNIQUE value Item_Type
SELECT DISTINCT bm.Item_Type FROM Big_mart bm ;


# 16. WRITE a query to show ALL DATA IN descending ORDER BY Item MRP 
SELECT * FROM Big_mart bm order by bm.Item_MRP DESC ;


# 17. WRITE a query to show ALL DATA IN ascending ORDER BY Item_Outlet_Sales
SELECT * FROM Big_mart bm order by bm.Item_Outlet_Sales ASC ;


# 18. WRITE a query to show ALL DATA IN ascending BY Item_Type
SELECT * FROM Big_mart bm order by bm.Item_Type ASC ;


# 19. WRITE a query to show DATA OF item_type dairy & Meat
SELECT * from Big_mart bm WHERE bm.Item_Type = 'Dairy' or bm.Item_Type = 'Meat';

SELECT * from Big_mart bm WHERE bm .Item_Type in ('Dairy','Meat');


# 20. WRITE a query to show ALL UNIQUE value OF Outlet_Size
SELECT DISTINCT bm.Outlet_Size from Big_mart bm ;


# 21. WRITE a query to show ALL UNIQUE value OF Outlet_Location_Type 
SELECT DISTINCT bm.Outlet_Location_Type FROM Big_mart bm ;


# 22. WRITE a query to show ALL UNIQUE value OF Outlet_Type
SELECT DISTINCT bm.Outlet_Type FROM Big_mart bm ;


# 23. WRITE a query to show count NO. OF item BY Item_Type AND ordered it IN descending
SELECT Item_Type ,COUNT(bm.Item_Type) as No_of_item FROM Big_mart bm 
group by Item_Type 
order by No_of_item DESC ;


# 24. WRITE a query to show count NO. OF item BY Outlet_Size AND ordered it IN ascending
SELECT bm.Outlet_Size ,COUNT(bm.Outlet_Size) as No_of_item FROM Big_mart bm 
group by bm.Outlet_Size 
order by No_of_item ASC ;

# 25. WRITE a query to show count NO. OF item BY Outlet_Location_Type and ORDER it in ascending
SELECT bm.Outlet_Location_Type ,COUNT(bm.Outlet_Location_Type) as No_of_item FROM Big_mart bm 
group by bm.Outlet_Location_Type  
order by No_of_item ASC ;

# 26. WRITE a query to show count NO. OF item BY Outlet_Type AND ordered it IN descending
SELECT bm.Outlet_Type ,COUNT(bm.Outlet_Type) as No_of_item FROM Big_mart bm 
group by bm.Outlet_Type  
order by No_of_item DESC ;

# 27. WRITE a query to show count of item BY Outlet_Location_Type AND ordered it IN descending
SELECT bm.Outlet_Location_Type ,COUNT(bm.Outlet_Location_Type) as No_of_item FROM Big_mart bm 
group by bm.Outlet_Location_Type  
order by No_of_item DESC ;

# 28. WRITE a query to show maximum MRP BY Item_Type
SELECT bm.Item_Type, MAX(bm.Item_MRP) as Max_MRP  
from Big_mart bm 
group by bm.Item_Type ;


# 29. WRITE a query to show minimum MRP BY Item_Type
SELECT bm.Item_Type, MIN(bm.Item_MRP) as Min_MRP  
from Big_mart bm 
group by bm.Item_Type ;


# 30. WRITE a query to show minimum MRP BY Outlet_Establishment_Year AND ordered it IN descending
SELECT bm.Outlet_Establishment_Year , MIN(bm.Item_MRP) as Min_MRP  
from Big_mart bm 
group by bm.Outlet_Establishment_Year 
ORDER by Min_MRP DESC ;

# 31. WRITE a query to show maximum MRP BY Outlet_Establishment_Year AND ordered IN descending
SELECT bm.Outlet_Establishment_Year , MAX(bm.Item_MRP) as Max_MRP  
from Big_mart bm 
group by bm.Outlet_Establishment_Year 
ORDER by Max_MRP DESC ;

# 32. WRITE a query to show average MRP BY Outlet_Size AND ordered IN descending
SELECT  Outlet_Size, ROUND( avg(Item_MRP),2)Average_MRP  
FROM Big_mart  
GROUP BY Outlet_Size order by Average_MRP desc;


# 33. WRITE a query to show average MRP BY Outlet_Size AND ordered IN descending
SELECT  Outlet_Size, ROUND( avg(Item_MRP),2)Average_MRP  
FROM Big_mart  
GROUP BY Outlet_Size order by Average_MRP desc;


# 34. WRITE a query to show Average MRP BY Outlet_Type AND ordered IN ascending
SELECT  Outlet_Type, ROUND( avg(Item_MRP))Average_MRP  
FROM Big_mart  
GROUP BY Outlet_Type order by Average_MRP asc;


# 35. WRITE a query to show maximum MRP BY Outlet_Type AND ordered IN ascending
SELECT  Outlet_Type, ROUND(max(Item_MRP),2) Max_MRP  
FROM Big_mart  
GROUP BY Outlet_Type order by Max_MRP asc;


# 36. WRITE a query to show maximum Item_Weight BY Item_Type AND ORDERED in DESCENDING
SELECT Item_Type , max(Item_Weight)max_weight 
FROM Big_mart  
GROUP BY Item_Type  
ORDER BY max_weight DESC;


# 37. WRITE a query to show maximum Item_Weight BY Outlet_Establishment_Year AND ordered IN ascending
SELECT Outlet_Establishment_Year , max(Item_Weight) Max_weight  
FROM Big_mart  
GROUP BY Outlet_Establishment_Year  
ORDER BY Max_weight ASC; 


# 38. WRITE a query to show minimum Item_Weight BY Outlet_Type AND ORDERED in DESCENDING
SELECT Outlet_Type , min(Item_Weight) Min_weight  
FROM Big_mart  
GROUP BY Outlet_Type  
ORDER BY min_weight desc; 


# 39.WRITE a query to show average Item_Weight BY Outlet_Location_Type ORDER BY descending
SELECT Outlet_Location_Type , ROUND( avg(Item_Weight),2) Average_weight  
FROM Big_mart  
GROUP BY Outlet_Location_Type  
ORDER BY Average_weight desc;


# 40. WRITE a query to show maximum Item_Outlet_Sales BY Item_Type 
SELECT  Item_Type, ROUND( Max(Item_Outlet_Sales),2) Max_sales  
FROM Big_mart  
GROUP BY Item_Type; 



# 41.WRITE a query to show minimum Item_Outlet_Sales BY Item_Type 
SELECT  Item_Type, min(Item_Outlet_Sales) Min_sales  
FROM Big_mart  
GROUP BY Item_Type;

# 42.WRITE a query to show minimum Item_Outlet_Sales BY Outlet_Establishment_Year
SELECT  Outlet_Establishment_Year, min(Item_Outlet_Sales) Min_sales  
FROM Big_mart  
GROUP BY Outlet_Establishment_Year order by Min_sales desc;


# 43.WRITE a query to show maximum Item_Outlet_Sales BY Outlet_Establishment_Year ordered BY descending
SELECT  Outlet_Establishment_Year,  Max(Item_Outlet_Sales)Max_sales FROM Big_mart
GROUP BY Outlet_Establishment_Year order by Max_sales desc;

# 44.WRITE a query to show average Item_Outlet_Sales BY Outlet_Size AND ORDER it itn descending
SELECT  Outlet_Size, avg(Item_Outlet_Sales) Average_sales  
FROM Big_mart  
GROUP BY Outlet_Size order by Average_sales desc;

# 45.WRITE a query to show average Item_Outlet_Sales BY Outlet_Size 
SELECT  Outlet_Size, avg(Item_Outlet_Sales)Average_sales  
FROM Big_mart  
GROUP BY Outlet_Size order by Average_sales desc;

# 46.WRITE a query to show average Item_Outlet_Sales BY Outlet_Type 
SELECT  Outlet_Type, avg(Item_Outlet_Sales)Average_sales  
FROM Big_mart  
GROUP BY Outlet_Type order by Average_sales asc; 

# 47.WRITE a query to show maximum Item_Outlet_Sales BY Outlet_Type 
SELECT  Outlet_Type, Max(Item_Outlet_Sales) Maximum_sales  
FROM Big_mart  
GROUP BY Outlet_Type order by Average_sales asc; 


# 48.WRITE a query to show total Item_Outlet_Sales BY Outlet_Type
SELECT  Outlet_Type, SUM(Item_Outlet_Sales) Total_sales  
FROM Big_mart  
GROUP BY Outlet_Type order by Average_sales asc;


# 49.WRITE a query to show total Item_Outlet_Sales BY Item_Type 
SELECT  Item_Type, SUM(Item_Outlet_Sales) Item_Type  
FROM Big_mart  
GROUP BY Item_Type order by Item_Type asc;

# 50.WRITE a query to show total Item_Outlet_Sales BY


# 51.WRITE a query to show total Item_Outlet_Sales BY Item_Fat_Content 


# 52.WRITE a query to show maximum Item_Visibility BY Item_Type 


# 53.WRITE a query to show Minimum Item_Visibility BY Item_Type 


# 54.WRITE a query to show total Item_Outlet_Sales BY Item_Type but ONLY WHERE Outlet_Location_Type IS Tier 1


# 55.WRITE a query to show total Item_Outlet_Sales BY Item_Type WHERE Item_Fat_Content IS ONLY Low Fat & LF


SELECT * from Big_mart bm ;

select distinct bm.Item_Outlet_Sales from Big_mart bm order by bm.Item_Outlet_Sales desc limit 1,1;






