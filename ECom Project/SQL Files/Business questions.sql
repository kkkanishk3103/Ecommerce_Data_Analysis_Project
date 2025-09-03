use Ecom;

-- 1. What is the total number of orders and total revenue generated over the entire period?
SELECT
    (SELECT COUNT(order_id) FROM Orders) AS total_orders,
    (SELECT SUM(payment_value) FROM Order_Payments) AS total_revenue;

-- 2. What is the average order value (AOV)?
SELECT (sum(payment_value)/count(distinct(order_id))) as AOV from order_payments;

-- 3. Which payment methods (credit_card, boleto, etc.) are most popular by number of transactions?
select payment_type, count(order_id) as Number_of_orders from order_payments group by payment_type order by Number_of_orders desc;

-- 4. How does the number of payment installments affect the total order value?
select payment_installments, avg(payment_value) as total_order_value from order_payments group by payment_installments order by total_order_value desc;

-- 5. How do sales and revenue trend on a monthly basis? Are there specific months that are exceptionally high or low?
select format(order_purchase_timestamp, 'yyyy-MM') as order_month, count(distinct(order_payments.order_id)) as Total_sales, sum(payment_value) as Total_revenue from order_payments join orders on orders.order_id = order_payments.order_id group by format(order_purchase_timestamp, 'yyyy-MM') order by format(order_purchase_timestamp, 'yyyy-MM');

-- 6. Which cities and states have the highest number of customers?
select top 10 customer_city, count(customer_unique_id) as total_customers from customers group by customer_city order by total_customers desc;
select top 10 customer_state, count(customer_unique_id) as total_customers from customers group by customer_state order by total_customers desc;

-- 7. What is the count of repeat customers (customers with more than one order) versus one-time buyers?
with Distributions as (select customer_unique_id ,count(customer_id) as number_of_orders from customers group by (customer_unique_id))
select case when number_of_orders=1 then 'one time buyer' else 'repeat customer' end as 'type of customer',count(customer_unique_id)  from Distributions group by case when number_of_orders=1 then 'one time buyer' else 'repeat customer' end  ;

-- 8. Who are the top 5 customers based on the total value of their purchases?
select top 5 customer_unique_id, sum(payment_value) as Total_value from customers join orders on customers.customer_id=orders.customer_id join order_payments on order_payments.order_id=orders.order_id group by customer_unique_id order by Total_value desc ;

-- 9. How many unique customers are there in the dataset?
select count(distinct(customer_unique_id)) as total_unique_customers from customers ;

-- 10. What are the top 10 best-selling products by quantity sold?
select top 10 product_category_name,count(order_items.order_id)as quantity_sold from products join order_items on products.product_id=order_items.product_id  group by product_category_name order by count(order_id) desc;

-- 11. Which are the top 10 most profitable product categories based on total revenue?
select top 10 product_category_name, sum(price) as total_revenue from products join order_items on products.product_id=order_items.product_id group by product_category_name order by total_revenue desc ;

-- 12. What is the average price of products within each category?
select product_category_name, avg(price) as avg_price from products join order_items on products.product_id=order_items.product_id group by product_category_name order by avg_price desc ;

-- 13. Are there products with consistently high/low review scores ? 
select product_category_name ,avg(review_score) average_score from products join order_items on  products.product_id=order_items.product_id join order_reviews on order_reviews.order_id=order_items.order_id where product_category_name is NOT NULL
group by product_category_name having avg(review_score)>4.5 ;

select product_category_name ,avg(review_score) average_score from products join order_items on  products.product_id=order_items.product_id join order_reviews on order_reviews.order_id=order_items.order_id group by product_category_name having avg(review_score)<2.5;

-- 14. What is the average shipping time from order approval to customer delivery?
select avg(cast(datediff (Day, order_approved_at, order_delivered_customer_date) as decimal)) as average_shipping_time from orders;

-- 15. How does the actual delivery date compare to the estimated delivery date? (How often are deliveries early, on time, or late?)

with differences as (select order_id, datediff(Day,order_delivered_customer_date,order_estimated_delivery_date) as Comparison from orders where order_delivered_customer_date is not null and order_estimated_delivery_date is not null)
select case when Comparison=0 then 'on time' when Comparison>0 then 'early' else 'late' end as statuses ,count(order_id) as no_of_orders from differences group by case when Comparison=0 then 'on time' when Comparison>0 then 'early' else 'late' end;

-- 16. What percentage of orders are fully delivered versus other statuses (canceled, shipped, etc.)?
select order_status,COUNT(order_id) AS number_of_orders, cast(count(order_id)*100/sum(count(order_id)) over() as decimal (5,3))as dist_percentage from orders group by order_status ORDER BY
    number_of_orders DESC;

-- 17. Which sellers generate the most revenue? (Remember to use a LEFT JOIN here due to the data quality issue).
select sellers.seller_id, sum(price) as revenue from sellers join order_items on sellers.seller_id=order_items.seller_id group by sellers.seller_id order by revenue desc;

-- 18. What is the geographic distribution of sellers by state?
select seller_state ,count(seller_id) as dist from sellers group by seller_state order by dist desc;

-- 19. What is the conversion rate from a "qualified lead" to a "closed lead"?
select (cast((select count(mql_id) from leads_closed) as float)*100)/(select count(mql_id)  from leads_qualified) as rate;

-- 20. How many closed leads can be successfully attributed to a registered seller? What percentage of leads are "unassigned"? (This directly addresses the data integrity issue you found).
select case when sellers.seller_id is not null then 'registered_seller' else 'unassigned' end as statuses, count(mql_id) as distributions from leads_closed left join sellers on leads_closed.seller_id=sellers.seller_id group by case when sellers.seller_id is not null then 'registered_seller' else 'unassigned' end;  