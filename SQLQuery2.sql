
USE IVY_practise

SELECT * FROM Restaurants

--Use the given Restaurants Datasets to find the cities with at least 2 Restaurants with 5 star Ratings.
--Your Output table should contain the city name along with number of 5 star restaurants in that city.
--Order the records in Descending order of No. of Restaurants and in case of tie , sort them in alphabetical order.

-- restaurents with city name having maximum star rating from each city
SELECT name,City, MAX(stars) as max_star
FROM Restaurants
WHERE stars = 5
GROUP BY name,City
ORDER by max_star desc

--cities with minimum 2 restaurants having max star as 5
SELECT City,COUNT(name) AS No_Of_Restaurants
FROM Restaurants
WHERE stars = 5
GROUP BY City
HAVING COUNT(name)>1
ORDER BY COUNT(name) desc,City

