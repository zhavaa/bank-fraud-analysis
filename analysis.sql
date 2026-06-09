/*SELECT category, AVG(amount) as avgsumma
FROM transactions
GROUP BY category 
ORDER BY avgsumma DESC;

SELECT gender, COUNT(*) as colvo
FROM transactions
GROUP BY gender;

SELECT fraud, category, COUNT(*)
FROM transactions
WHERE fraud = '1'
GROUP BY category
ORDER BY COUNT(*) DESC
LIMIT 3 

SELECT category, amount, AVG(AMOUNT) OVER(PARTITION BY category) as avg_by_category
FROM transactions

SELECT amount, ROW_NUMBER() OVER(PARTITION BY category ORDER BY amount DESC)
from transactions

SELECT category, amount, LAG(amount) OVER(PARTITION BY category ORDER BY amount)
FROM transactions
-------- CTE
WITH cte_summa AS (SELECT category, amount, SUM(amount) as summa
FROM transactions
GROUP BY category)
SELECT * FROM cte_summa
WHERE summa > 100000

WITH cte_fraud_avg AS( SELECT category, AVG(amount ) as fraudAVG
FROM transactions
WHERE fraud = '1'
GROUP BY category
)
SELECT * FROM cte_fraud_avg
WHERE (SELECT AVG(amount) FROM transactions WHERE fraud = '1') > fraudAVG 

WITH general AS (
	SELECT 
		category,
		COUNT(*) as total_transaction,
		SUM(amount) as total_amount,
		AVG(amount) as avg_amount
	FROM transactions 
	GROUP BY category 
),
fraud AS (
	SELECT 
		category,
		COUNT(*) as total_fraud
	FROM transactions
	WHERE fraud = '1'
	GROUP BY category 
)
SELECT 
	g.category,
	g.total_amount,
	g.avg_amount,
	f.total_fraud,
	ROUND(f.total_fraud * 100.0 / g.total_transaction, 2) as fraud_percent
FROM general g
JOIN fraud f ON g.category = f.category
ORDER BY fraud_percent DESC;

-----
SELECT customer, count(*) as total_transactions, SUM(amount)  
FROM transactions
GROUP BY customer 
ORDER BY SUM(amount) DESC
LIMIT 3

WITH cte_avg AS (SELECT category, AVG(amount) as avg_amount
FROM transactions
GROUP BY category)
SELECT * FROM cte_avg
WHERE (SELECT AVG(amount) FROM transactions)< avg_amount


SELECT
    customer,
    step,
    FIRST_VALUE(step) OVER(PARTITION BY customer ORDER BY step) as first_step,
    LAST_VALUE(step) OVER(PARTITION BY customer ORDER BY step 
                          ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as last_step
FROM transactions
*/
