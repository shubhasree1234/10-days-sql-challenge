USE IVY_practise;

SELECT * FROM dbo.account_details;
SELECT * FROM dbo.user_details;
SELECT * FROM dbo.Download_details;

--Use the given data to find the total number of downloads for paying and non-paying users by date. 
--Include only records where non-paying customers have more downloads than 
--paying customers. The output should be sorted by earliest date first and contain 3 columns 
---date, non-paying downloads, paying downloads.

CREATE view New_table_3_ AS 
SELECT  CAST(d.date AS DATE) AS Date,
(IIF(a.Paying_customers = 'yes',SUM(CAST(d.downloads AS INT)),0)) AS Paying_downloads,
(IIF(a.Paying_customers = 'no' ,SUM(CAST(d.downloads AS INT)),0)) AS Non_Paying_downloads
FROM dbo.Download_details d
INNER JOIN dbo.user_details u ON u.user_id = d.user_id
INNER JOIN dbo.account_details a ON a.acc_id = u.acc_id
GROUP BY Date,a.Paying_customers

SELECT Date, MAX(Paying_downloads) AS Paying_downloads, MAX(Non_Paying_downloads) AS Non_Paying_downloads
FROM New_table_3_
GROUP BY Date
HAVING  MAX(Non_Paying_downloads) > MAX(Paying_downloads)







