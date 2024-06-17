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
