--ex1
WITH count_of_company AS (
SELECT 
company_id,
title, 
description,
count(job_id) AS job_count
FROM job_listings
GROUP BY company_id, title, description
)
SELECT COUNT(DISTINCT company_id) AS duplicate_company
FROM count_of_company
WHERE job_count > 1;

-- ex 3
WITH call_records AS (
  SELECT
    policy_holder_id,
    COUNT(case_id) AS call_count
  FROM callers
  GROUP BY policy_holder_id
  HAVING COUNT(case_id) >= 3
)
SELECT COUNT(policy_holder_id) AS policy_holder_count
FROM call_records;

--ex 4
SELECT pages.page_id
FROM pages
LEFT JOIN page_likes ON pages.page_id = page_likes.page_id
WHERE page_likes.page_id is null
ORDER BY page_id ASC;

--ex 6
SELECT  SUBSTR(trans_date,1,7) as month,
 country, count(id) as trans_count, 
 SUM(CASE WHEN state = 'approved' then 1 else 0 END) as approved_count,
 SUM(amount) as trans_total_amount, SUM(CASE WHEN state = 'approved' then amount else 0 END) as approved_total_amount
FROM Transactions
GROUP BY month, country;

--EX 7
SELECT product_id, year AS first_year, quantity, price 
FROM Sales 
WHERE (product_id, year) IN (
SELECT product_id, min(year) AS year 
FROM Sales 
GROUP BY product_id 
);
