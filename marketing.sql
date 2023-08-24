1)-- which product is drove the most revenue which product was the most succesful (run perfectly)

SELECT
    CASE
        WHEN SUM(MntWines) > SUM(MntFruits) AND SUM(MntWines) > SUM(MntMeatProducts) THEN 'Wines'
        WHEN SUM(MntFruits) > SUM(MntWines) AND SUM(MntFruits) > SUM(MntMeatProducts) THEN 'Fruits'
        ELSE 'MeatProducts'
    END AS Most_Successful_Product,
    CASE
        WHEN SUM(MntWines) > SUM(MntFruits) AND SUM(MntWines) > SUM(MntMeatProducts) THEN SUM(MntWines)
        WHEN SUM(MntFruits) > SUM(MntWines) AND SUM(MntFruits) > SUM(MntMeatProducts) THEN SUM(MntFruits)
        ELSE SUM(MntMeatProducts)
    END AS Total_Revenue
FROM `niyo-394518.niyo.Marketing`;


2)-- second product who drove most revenue
SELECT
    CASE
        WHEN SUM(MntFishProducts) > SUM(MntSweetProducts) THEN 'FishProducts'
        ELSE 'SweetProducts'
    END AS Most_Successful_Product,
    CASE
        WHEN SUM(MntFishProducts) > SUM(MntSweetProducts) THEN SUM(MntFishProducts)
        ELSE SUM(MntSweetProducts)
    END AS best_product,
FROM `niyo-394518.niyo.Marketing`;


3)-- what demographic purchased wine
SELECT
    Education,
    Marital_Status,Income,extract(Year from current_date()) - Year_Birth as age,
    AVG(Year_Birth) AS Average_Age,
    SUM(MntWines) AS Total_Wine_Purchases
FROM `niyo-394518.niyo.Marketing`
GROUP BY Education, Marital_Status,Income,age
ORDER BY Total_Wine_Purchases DESC;


-- age 
select Year_Birth,extract(Year from current_date()),
extract(Year from current_date()) - Year_Birth
from `niyo-394518.niyo.Marketing`;

4)--people who bought meat and wine (want to see if the people who bought meat also bought wine)

select Education, Marital_Status,Income,
case 
when MntMeatProducts is not null and MntWines is not null Then 'group meat'
when MntFishProducts is not null and MntWines is not null Then 'group fish'
else 'group other'
end as other
from `niyo-394518.niyo.Marketing`;


--sum of store purchases (can i join bith colums without using case when)
SELECT 
sum(NumStorePurchases) AS sum_Store_Purchases
from `niyo-394518.niyo.Marketing`;

--sum of web purchases 
select
sum(NumWebPurchases) AS sum_Web_Purchases
FROM `niyo-394518.niyo.Marketing`;
--  Average number of store purchases vs websites

SELECT 
AVG(NumStorePurchases) AS Avg_Store_Purchases,
AVG(NumWebPurchases) AS Avg_Web_Purchases
FROM `niyo-394518.niyo.Marketing`;




--deal purchases

select 
sum(NumDealsPurchases) as sum_deals_purchases
from `niyo-394518.niyo.Marketing`;


SELECT 
count(NumDealsPurchases) AS count_Deals_Purchases,

FROM `niyo-394518.niyo.Marketing`;
--do they use deal purchases in stores or on websites (count the number of people who used dis)
5)-- how many discount was bought in store and on websites 

select 
sum(NumDealsPurchases) as count_NumDealsPurchases 
where NumDealsPurchases > 0 
from `niyo-394518.niyo.Marketing` ;


SELECT NumDealsPurchases,NumStorePurchases 
where NumStorePurchases is not null and 

count(NumDealsPurchases) AS count_Deals_Purchases 
from `niyo-394518.niyo.Marketing` ;

FROM `niyo-394518.niyo.Marketing`;


SELECT
COUNT(NumDealsPurchases) AS Deals_In_Stores_Count
FROM `niyo-394518.niyo.Marketing`
WHERE NumStorePurchases > 0;

SELECT
sum(NumDealsPurchases) AS Deals_In_Stores_sum
FROM `niyo-394518.niyo.Marketing`
WHERE NumStorePurchases > 0;




SELECT
COUNT(*) AS Deals_In_Websites_Count
FROM `niyo-394518.niyo.Marketing`
WHERE NumWebPurchases > 0;
