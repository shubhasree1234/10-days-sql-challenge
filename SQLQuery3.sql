use IVY_practise

SELECT * FROM House

--Use the given House Dataset to find the Top 3 Postal Codes for each year with Average Price of that Postal Code as the Ranking criteria.
--Top 3
SELECT * FROM(
SELECT Postcode,Year,Price,
    AVG(Price) OVER (PARTITION BY Postcode ORDER BY Postcode) AS average_,
    RANK() OVER (PARTITION BY Year Order by AVG(Price) DESC) AS rank_wise	
FROM House
GROUP BY Postcode,Year,Price ) AS tab_1
WHERE rank_wise <=3 




SELECT * FROM(
SELECT Postcode,Year,AVG(Price) AS avp,
    RANK() OVER (PARTITION BY Year Order by AVG(Price) DESC) AS rnk
FROM House
GROUP BY Postcode,Year) AS tab_1
WHERE rnk<=3

SELECT * FROM(
SELECT Postcode,Year,Price,
    ROW_NUMBER() OVER (PARTITION BY Year Order by AVG(Price) DESC) AS rank_1,
	AVG(Price) OVER (PARTITION BY Postcode ORDER BY Postcode) AS average_
FROM House
GROUP BY Postcode,Year,Price ) AS tab_1
WHERE rank_1 <=3 

SELECT TOP 3 Postcode
FROM House
GROUP BY Year,Postcode

SELECT Postcode, AVG(Price) AS average_price,Year,
RANK () OVER (
        PARTITION BY AVG(Price)
		ORDER BY AVG(Price)) AS RANK_
FROM House
GROUP BY Postcode,Year
--ORDER BY Year ASC
SELECT AVG(Price) AS avp,Year
FROM House
GROUP BY Year
ORDER BY Year,avp

SELECT TOP 3 Postcode,Year
FROM House
GROUP BY Year,Postcode
ORDER BY Year
