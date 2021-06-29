select * from work.host_details;
#You’re given a table of rental property searches by users.
#The table consists of search results and outputs host information for searchers. 
 #Find the minimum, average, maximum rental prices for each host’s popularity rating.
SELECT
CASE 
    WHEN no_of_reviews = 0 THEN "New"
    WHEN no_of_reviews BETWEEN 1 AND 5 THEN "Rising"
    WHEN no_of_reviews BETWEEN 6 AND 15 THEN "Trending Up"
    WHEN no_of_reviews BETWEEN 16 AND 40 THEN "Popular"
    ELSE "Hot"
END  AS Review_type,
COUNT(no_of_reviews) AS cnt
FROM work.host_details
GROUP BY Review_type;
    
SELECT
CASE 
    WHEN no_of_reviews = 0 THEN "New"
    WHEN no_of_reviews BETWEEN 1 AND 5 THEN "Rising"
    WHEN no_of_reviews BETWEEN 6 AND 15 THEN "Trending Up"
    WHEN no_of_reviews BETWEEN 16 AND 40 THEN "Popular"
    ELSE "Hot"
END  AS Review_type,
MIN(price) AS Minimum_rental_price,
AVG(price) AS Average_rental_price,
MAX(price) AS Maximum_rental_price
FROM work.host_details
GROUP BY Review_type;
