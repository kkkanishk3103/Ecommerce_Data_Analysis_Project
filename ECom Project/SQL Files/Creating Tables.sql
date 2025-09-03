CREATE DATABASE ECom;
USE Ecom;

CREATE TABLE customers (
    customer_id CHAR(32) NOT NULL,
    customer_unique_id CHAR(32) NOT NULL,
    customer_zip_code_prefix INT NOT NULL,
    customer_city VARCHAR(50) NOT NULL,
    customer_state CHAR(2) NOT NULL,
    PRIMARY KEY (customer_id)
);

CREATE TABLE geolocation (
    geolocation_id INT IDENTITY(1,1) NOT NULL,
    geolocation_zip_code_prefix INT NOT NULL,
    geolocation_lat DECIMAL(10, 8) NOT NULL,
    geolocation_lng DECIMAL(11, 8) NOT NULL,
    geolocation_city VARCHAR(50) NOT NULL,
    geolocation_state CHAR(2) NOT NULL,
    PRIMARY KEY (geolocation_id)
);

CREATE TABLE leads_closed (
    mql_id CHAR(32) NOT NULL,
    seller_id CHAR(32) NOT NULL,
    sdr_id CHAR(32) NOT NULL,
    sr_id CHAR(32) NOT NULL,
    won_date DATETIME2 NOT NULL,
    business_segment VARCHAR(35) NULL,
    lead_type VARCHAR(20) NULL,
    lead_behaviour_profile VARCHAR(15) NULL,
    has_company BIT NULL,
    has_gtin BIT NULL,
    average_stock VARCHAR(10) NULL,
    business_type VARCHAR(15) NULL,
    declared_product_catalog_size INT NULL,
    declared_monthly_revenue MONEY NOT NULL,
    PRIMARY KEY (mql_id)
);

CREATE TABLE leads_qualified (
    mql_id CHAR(32) NOT NULL,
    first_contact_date DATE NOT NULL,
    landing_page_id CHAR(32) NOT NULL,
    origin VARCHAR(20) NULL,
    PRIMARY KEY (mql_id)
);

CREATE TABLE Order_Items (
    order_id CHAR(32) NOT NULL,
    order_item_id TINYINT NOT NULL,
    product_id CHAR(32) NOT NULL,
    seller_id CHAR(32) NOT NULL,
    shipping_limit_date DATETIME2 NOT NULL,
    price MONEY NOT NULL,
    freight_value MONEY NOT NULL,
    PRIMARY KEY (order_id, order_item_id)
);

CREATE TABLE Order_Payments (
    order_id CHAR(32) NOT NULL,
    payment_sequential TINYINT NOT NULL,
    payment_type VARCHAR(15) NOT NULL,
    payment_installments TINYINT NOT NULL,
    payment_value MONEY NOT NULL,
    PRIMARY KEY (order_id, payment_sequential)
);

CREATE TABLE Order_Payments (
    order_id CHAR(32) NOT NULL,
    payment_sequential TINYINT NOT NULL,
    payment_type VARCHAR(15) NOT NULL,
    payment_installments TINYINT NOT NULL,
    payment_value MONEY NOT NULL,
    PRIMARY KEY (order_id, payment_sequential)
);

CREATE TABLE Orders (
    order_id CHAR(32) NOT NULL,
    customer_id CHAR(32) NOT NULL,
    order_status VARCHAR(15) NOT NULL,
    order_purchase_timestamp DATETIME2 NOT NULL,
    order_approved_at DATETIME2 NULL,
    order_delivered_carrier_date DATETIME2 NULL,
    order_delivered_customer_date DATETIME2 NULL,
    order_estimated_delivery_date DATE NOT NULL,
    PRIMARY KEY (order_id)
);

CREATE TABLE Products (
    product_id CHAR(32) NOT NULL,
    product_category_name VARCHAR(50) NULL,
    product_name_lenght TINYINT NULL,
    product_description_lenght SMALLINT NULL,
    product_photos_qty TINYINT NULL,
    product_weight_g INT NULL,
    product_length_cm TINYINT NULL,
    product_height_cm TINYINT NULL,
    product_width_cm TINYINT NULL,
    PRIMARY KEY (product_id)
);

CREATE TABLE Sellers (
    seller_id CHAR(32) NOT NULL,
    seller_zip_code_prefix INT NOT NULL,
    seller_city VARCHAR(40) NOT NULL,
    seller_state CHAR(2) NOT NULL,
    PRIMARY KEY (seller_id)
);