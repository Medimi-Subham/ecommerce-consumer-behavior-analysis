SELECT COUNT(*) AS TotalRows
FROM ecommerce_consumer_Behavior_analysis;
 
SELECT TOP 1000 *
FROM ecommerce_consumer_Behavior_analysis;

SELECT *
FROM ecommerce_consumer_behavior_analysis
WHERE purchase_amt IS NULL;

SELECT customer_id,
COUNT(*) AS DuplicateCount
FROM ecommerce_consumer_behavior_analysis
GROUP BY customer_id
HAVING COUNT(*) > 1;

ALTER TABLE ecommerce_consumer_behavior_analysis
ADD purchase_amount DECIMAL(10,2);

UPDATE ecommerce_consumer_behavior_analysis 
SET purchase_amount =
CAST(REPLACE(purchase_amt,'$', ' ') AS DECIMAL(10,2));

SELECT TOP 10
purchase_amt,
purchase_amount
FROM ecommerce_consumer_behavior_analysis;


SELECT
SUM(purchase_amount) AS TotalRevenue
FROM ecommerce_consumer_behavior_analysis;

SELECT
AVG(purchase_amount) AS AvgOrderValue
FROM ecommerce_consumer_behavior_analysis;

SELECT
purchase_cat,
SUM(purchase_amount) AS Revenue
FROM ecommerce_consumer_behavior_analysis
GROUP BY purchase_cat
ORDER BY Revenue DESC;

ALTER TABLE ecommerce_consumer_behavior_analysis
ADD Age_Group VARCHAR(20);

UPDATE ecommerce_consumer_behavior_analysis
SET Age_Group =
CASE
WHEN Age BETWEEN 18 AND 25 THEN '18-25'
WHEN Age BETWEEN 26 AND 35 THEN '26-35'
WHEN Age BETWEEN 36 AND 45 THEN '36-45'
ELSE '46+'
END;

SELECT purchase_cat
FROM ecommerce_consumer_behavior_analysis;

SELECT
gender,
SUM(purchase_amount) AS Revenue
FROM ecommerce_consumer_behavior_analysis
GROUP BY gender;

SELECT
income_level,
SUM(purchase_amount) AS Revenue
FROM ecommerce_consumer_behavior_analysis
GROUP BY income_level
ORDER BY Revenue DESC;

SELECT
payment_method,
COUNT(*) AS Transactions
FROM ecommerce_consumer_behavior_analysis
GROUP BY payment_method
ORDER BY Transactions DESC;

SELECT
device_used_for_shopping,
COUNT(*) AS Customers
FROM ecommerce_consumer_behavior_analysis
GROUP BY device_used_for_shopping;

SELECT
loyalty_members,
AVG(purchase_amount) AS AvgSpend
FROM ecommerce_consumer_behavior_analysis
GROUP BY loyalty_members;

SELECT
customer_satisfaction,
COUNT(*) AS Customers
FROM ecommerce_consumer_behavior_analysis
GROUP BY customer_satisfaction
ORDER BY customer_satisfaction;


CREATE VIEW vw_RevenueByCategory AS
SELECT
purchase_cat,
SUM(purchase_amount) AS Revenue
FROM ecommerce_consumer_behavior_analysis
GROUP BY purchase_cat;

CREATE VIEW vw_PaymentAnalysis AS
SELECT
payment_method,
COUNT(*) AS Transactions
FROM ecommerce_consumer_behavior_analysis
GROUP BY payment_method;

CREATE VIEW vw_DeviceAnalysis AS
SELECT
device_used_for_shopping,
COUNT(*) AS Customers
FROM ecommerce_consumer_behavior_analysis
GROUP BY device_used_for_shopping;
