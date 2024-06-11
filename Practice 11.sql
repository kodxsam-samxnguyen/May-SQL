--EX1
SELECT COUNTRY.Continent, FLOOR(AVG(CITY.Population)) AS AvgCityPopulation
FROM CITY
JOIN COUNTRY 
ON CITY.CountryCode = COUNTRY.Code
GROUP BY COUNTRY.Continent;

--EX2
SELECT 
ROUND(COUNT(texts.email_id):: DECIMAL/ COUNT(emails.email_id),2) AS activata_rate
FROM emails
LEFT JOIN texts 
ON emails.email_id = texts.email_id
AND texts.signup_action = 'Confirmed';

--EX3
SELECT age.age_bucket,
ROUND(SUM(CASE WHEN activity_type = 'open' THEN time_spent ELSE 0 end) * 100.0/
    SUM(CASE WHEN activities.activity_type IN ('send', 'open') THEN time_spent ELSE 0 END), 2) AS open_perc,
ROUND( SUM(CASE WHEN activity_type = 'send' THEN time_spent ELSE 0 end) * 100.0/
    SUM(CASE WHEN activities.activity_type IN ('send', 'open') THEN time_spent ELSE 0 END), 2) as send_perc
FROM activities 
INNER JOIN age_breakdown AS age
ON activities.user_id = age.user_id
WHERE activities.activity_type IN ('send', 'open')
GROUP BY age.age_bucket;

--EX4
SELECT customer_id
FROM customer_contracts AS a
LEFT JOIN products AS b
ON a.product_id = b.product_id
GROUP BY customer_id
HAVING COUNT(DISTINCT b.product_category) = 3;



