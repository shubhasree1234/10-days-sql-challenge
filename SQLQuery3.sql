use IVY_practise

SELECT * FROM House

--Use the given House Dataset to find the Top 3 Postal Codes for each year with Average Price of that Postal Code as the Ranking criteria.
--Top 3
SELECT * FROM(
SELECT Year,Postcode,AVG(Price) AS avp,
    RANK() OVER (PARTITION BY Year Order by AVG(Price) DESC) AS rnk
FROM House
GROUP BY Postcode,Year) AS tab_1
WHERE rnk<=3

