use Ecom;

--To display all the tables in the database
select * from customers;
select * from geolocation;
select * from leads_closed;
select * from leads_qualified;
select * from order_items;
select * from order_payments;
select * from order_reviews;	
select * from orders;
select * from products;
select * from sellers;

-- To add foreign keys in order to join the tables
ALTER TABLE Order_Items
ADD FOREIGN KEY (order_id) REFERENCES orders(order_id);

ALTER TABLE Order_Payments
ADD FOREIGN KEY (order_id) REFERENCES Orders(order_id);

ALTER TABLE Order_reviews
ADD FOREIGN KEY (order_id) REFERENCES Orders(order_id);

ALTER TABLE Orders
ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id);

ALTER TABLE Order_Items
ADD FOREIGN KEY (product_id) REFERENCES products(product_id);

ALTER TABLE Order_Items
ADD FOREIGN KEY (seller_id) REFERENCES sellers(seller_id);

ALTER TABLE leads_closed
ADD FOREIGN KEY (mql_id) REFERENCES leads_qualified(mql_id);