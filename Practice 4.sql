--ex1
SELECT 
SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_view,
SUM(CASE WHEN device_type IN ('tablet','phone') THEN 1 ELSE 0 END) AS moblie_view
FROM viewership;

--ex2
SELECT *,
    CASE
        WHEN x + y > z AND y + z > x AND x + z > y THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM
    Triangle;

--ex3
SELECT ROUND(100*  SUM( CASE WHEN  call_category IS NULL or 
call_category = 'n/a' THEN 1 ELSE 0 end) :: DECIMAL
/COUNT(*),1) AS uncategorised_call_pct
FROM callers;

--ex4
SELECT  name FROM Customer 
WHERE  referee_id != 2
OR referee_id IS NULL;
