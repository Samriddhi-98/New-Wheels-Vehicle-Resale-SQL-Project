	
/*
-----------------------------------------------------------------------------------------------------------------------------------
                                                         Queries                                               
-----------------------------------------------------------------------------------------------------------------------------------*/
use carvalue;
/*-- QUERY RELATED TO CUSTOMERS
     [Q1] The distribution of customers across states? */

SELECT state,COUNT(customer_id) as customers_across_states FROM customer_t GROUP BY state ORDER BY customers_across_states DESC;

------------------------------------------------------------------------------------------------------------------------------------

/* [Q2] The average rating in each quarter
-- Very Bad is 1, Bad is 2, Okay is 3, Good is 4, Very Good is 5. */


WITH cte AS  (SELECT customer_feedback, quarter_number, 
 CASE customer_feedback WHEN 'Very Bad' THEN 1 
 WHEN 'Bad' THEN 2
 WHEN 'Okay' THEN 3 
 WHEN 'Good' THEN 4 
 WHEN 'Very Good' THEN 5 END AS customer_rating FROM order_t)
 select quarter_number,ROUND(AVG(customer_rating),2) AS Avg_Rating
 FROM cte GROUP BY quarter_number ORDER BY quarter_number; 
 


-- ---------------------------------------------------------------------------------------------------------------------------------

/* [Q3] Customers satisfication over time */ 
 
WITH customer_feedback AS ( SELECT customer_feedback, quarter_number, count(*) AS total_feedback FROM order_t GROUP BY customer_feedback, quarter_number)
SELECT customer_feedback, quarter_number, total_feedback, (total_feedback /Sum(total_feedback) OVER (partition by quarter_number))* 100 AS percentage_feedback 
FROM customer_feedback; 

-- Yes


-- ---------------------------------------------------------------------------------------------------------------------------------

/*[Q4] The top 5 vehicle makers preferred by the customer.*/

SELECT P.vehicle_maker,COUNT(o.customer_id) AS TOP_5 
FROM product_t as P 
JOIN order_t as O 
ON P.product_id = O.product_id
GROUP BY P.vehicle_maker ORDER BY TOP_5 DESC LIMIT 5;


-- ---------------------------------------------------------------------------------------------------------------------------------

/*[Q5] The most preferred vehicle make in each state
*/

WITH CTE AS (SELECT State, Vehicle_maker, row_number() OVER(partition by state ORDER BY COUNT(distinct(C.customer_id))) AS RANKS 
FROM customer_t AS C 
JOIN order_t AS O 
ON C.customer_id = O.customer_id 
JOIN product_t AS P 
ON O.product_id = P.product_id
GROUP BY C.state, P.vehicle_maker)  SELECT state, vehicle_maker, ranks FROM CTE WHERE ranks=1;  


-- ---------------------------------------------------------------------------------------------------------------------------------

/*QUESTIONS RELATED TO REVENUE and ORDERS 

-- [Q6] The trend of number of orders by quarters?
*/

SELECT Quarter_number, COUNT(order_id) AS Number_of_orders 
FROM order_t GROUP BY Quarter_number ORDER BY quarter_number;


-- ---------------------------------------------------------------------------------------------------------------------------------

/* [Q7] The quarter over quarter % change in revenue
*/  

With rev_of_quar AS (SELECT quarter_number as qn ,SUM(vehicle_price*quantity) As rev FROM order_t group by qn order by qn)
SELECT qn, rev,
LAG(rev) OVER (ORDER BY qn) AS prev_rev,
ROUND( (rev - LAG(rev) OVER (ORDER BY qn)) * 100.0 / LAG(rev) OVER (ORDER BY qn), 2 ) AS pct_change_qoq
FROM rev_of_quar ORDER BY qn;


-- ---------------------------------------------------------------------------------------------------------------------------------

/* [Q8]  The trend of revenue and orders by quarters? */

SELECT O.Quarter_number, SUM(P.vehicle_price) AS Revenue, COUNT(O.order_id) AS Number_of_orders
FROM Order_t AS O 
JOIN product_t AS P 
ON O.product_id = P.product_id
GROUP BY O.Quarter_number 
ORDER BY O.Quarter_number;
 
 
-- ---------------------------------------------------------------------------------------------------------------------------------

/* QUESTIONS RELATED TO SHIPPING 
    [Q9]  The average discount offered for different types of credit cards? */

SELECT C.credit_card_type, ROUND(AVG(O.discount*100),0) AS Average_discount
FROM Customer_t AS C 
INNER JOIN Order_t AS O 
ON C.customer_id = O.customer_id 
GROUP BY C.credit_card_type
ORDER BY average_discount;  


-- ---------------------------------------------------------------------------------------------------------------------------------

/* [Q10] The average time taken to ship the placed orders for each quarters? */

SELECT Quarter_number, AVG(datediff(ship_date,order_date)) AS Average_Time_Taken_Days FROM order_t GROUP BY quarter_number;     


-- -------------------------------------------------------- Done ----------------------------------------------------------------------


