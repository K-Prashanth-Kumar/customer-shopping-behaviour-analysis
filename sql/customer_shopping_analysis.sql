-- Q1: Which gender contributes the most revenue, and what is their average spend?
SELECT 
    gender,
    COUNT(*) AS total_customers,
    SUM(purchase_amount) AS total_revenue,
    AVG(purchase_amount) AS avg_spend,
    SUM(CASE WHEN discount_applied = 'Yes' THEN 1 ELSE 0 END) AS discount_users
FROM customer
GROUP BY gender;

-- Q2: Which age group generates the highest total revenue?
SELECT 
    age_group,
    SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY age_group
ORDER BY total_revenue DESC;


-- Q3: Do subscribed customers spend more than non-subscribed customers?
SELECT 
    subscription_status,
    COUNT(*)             AS total_customers,
    SUM(purchase_amount) AS total_revenue,
    AVG(purchase_amount) AS avg_spend
FROM customer
GROUP BY subscription_status
ORDER BY total_revenue DESC;


-- Q4: Which season drives the highest total revenue?
SELECT 
    season,
    SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY season
ORDER BY total_revenue DESC;


-- Q5: Which payment method generates the most revenue?
SELECT 
    payment_method,
    SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY payment_method
ORDER BY total_revenue DESC;


-- Q6: Which age groups use discounts the most, and what percentage of each group uses them?
SELECT 
    age_group,
    CAST(100.0 * SUM(CASE WHEN discount_applied = 'Yes' THEN 1 ELSE 0 END)/ COUNT(*)
    AS DECIMAL(10,2)) AS discount_percentage
FROM customer
GROUP BY age_group
ORDER BY discount_percentage DESC;


-- Q7: Which 5 items have the highest average customer review rating?
SELECT TOP 5
    item_purchased,
    ROUND(AVG(review_rating), 2) AS avg_rating
FROM customer
GROUP BY item_purchased
ORDER BY avg_rating DESC;


-- Q8: Which is the top most purchased item within each product category?
WITH item_count AS (
    SELECT 
        category,
        item_purchased,
        COUNT(*) AS purchase_count
    FROM customer
    GROUP BY category, item_purchased
)
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY category ORDER BY purchase_count DESC) AS item_rank
    FROM item_count
) t
WHERE item_rank = 1
ORDER BY category, purchase_count DESC;


-- Q9: In which categories do discounts have the most impact on orders and revenue?
SELECT 
    category,
    discount_applied,
    COUNT(*)             AS total_orders,
    SUM(purchase_amount) AS total_revenue,
    AVG(purchase_amount) AS avg_spend
FROM customer
GROUP BY category, discount_applied
ORDER BY category, discount_applied;


-- Q10: Which shipping types are most commonly used and how do they
--      compare in total revenue and average spend?
SELECT 
    shipping_type,
    COUNT(*)             AS total_orders,
    SUM(purchase_amount) AS total_revenue,
    AVG(purchase_amount) AS avg_spend
FROM customer
GROUP BY shipping_type
ORDER BY total_orders DESC;


-- Q11: Which top 10 locations generate the most orders and highest revenue?
SELECT TOP 10
    location,
    COUNT(*)             AS total_orders,
    SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY location
ORDER BY total_orders DESC;


-- Q12: Which product categories perform best in each season
--      in terms of revenue and number of orders?
SELECT 
    season,
    category,
    SUM(purchase_amount) AS total_revenue,
    COUNT(*)             AS total_orders
FROM customer
GROUP BY season, category
ORDER BY season, total_revenue DESC;