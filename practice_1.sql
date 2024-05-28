--EX9
SELECT product_id  FROM Products
WHERE low_fats = "Y"
AND recyclable = "Y"

--EX11
SELECT name, population, area FROM WORLD
WHERE population >= 25000000
OR area >= 3000000;

--EX10
SELECT  name FROM Customer 
WHERE  referee_id != 2
OR referee_id IS NULL

