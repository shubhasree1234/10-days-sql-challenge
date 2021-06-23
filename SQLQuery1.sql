
use IVY_practise
-- Use table drivers
SELECT * FROM Drivers

--Enlist all the Drivers, earning less than or equal to 20k or earning more than or equal to 50k.
SELECT *
FROM Drivers
WHERE salary <= 20000 or salary >= 50000
ORDER BY salary

