-- ============================================================
-- Olist E-commerce Data Model
-- Raw Layer
-- ============================================================

CREATE SCHEMA IF NOT EXISTS raw;


-- ============================================================
-- Customers
-- ============================================================

CREATE TABLE raw.customers (
    customer_id TEXT NOT NULL,
    customer_unique_id TEXT NOT NULL,
    customer_zip_code_prefix INTEGER NOT NULL,
    customer_city TEXT NOT NULL,
    customer_state CHAR(2) NOT NULL,

    CONSTRAINT pk_customers
        PRIMARY KEY (customer_id)
);


-- ============================================================
-- Geolocation
-- ============================================================

CREATE TABLE raw.geolocation (
    geolocation_zip VARCHAR(5) NOT NULL,
    geolocation_lat NUMERIC(12,8) NOT NULL,
    geolocation_lng NUMERIC(12,8) NOT NULL,
    geolocation_city TEXT NOT NULL,
    geolocation_state CHAR(2) NOT NULL
);


-- ============================================================
-- Orders
-- ============================================================

CREATE TABLE raw.orders (
    order_id VARCHAR(32) NOT NULL,
    customer_id VARCHAR(32) NOT NULL,
    order_status TEXT NOT NULL,
    order_purchase_timestamp TIMESTAMP NOT NULL,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP,

    CONSTRAINT pk_orders
        PRIMARY KEY (order_id),

    CONSTRAINT fk_orders_customers
        FOREIGN KEY (customer_id)
        REFERENCES raw.customers(customer_id)
);


-- ============================================================
-- Products
-- ============================================================

CREATE TABLE raw.products (
    product_id VARCHAR(32) NOT NULL,
    product_category_name VARCHAR(80),
    product_name_length INTEGER,
    product_description_length INTEGER,
    product_photo_quality INTEGER,
    product_weight_g INTEGER,
    product_length_cm INTEGER,
    product_height_cm INTEGER,
    product_width_cm INTEGER,

    CONSTRAINT pk_products
        PRIMARY KEY (product_id)
);


-- ============================================================
-- Sellers
-- ============================================================

CREATE TABLE raw.sellers (
    seller_id VARCHAR(32) NOT NULL,
    seller_zip_code_prefix INTEGER NOT NULL,
    seller_city TEXT,
    seller_state CHAR(2) NOT NULL,

    CONSTRAINT pk_sellers
        PRIMARY KEY (seller_id)
);


-- ============================================================
-- Order Items
-- ============================================================

CREATE TABLE raw.order_items (
    order_id VARCHAR(32) NOT NULL,
    order_item_id INTEGER NOT NULL,
    product_id VARCHAR(32) NOT NULL,
    seller_id VARCHAR(32) NOT NULL,
    shipping_limit_date TIMESTAMP NOT NULL,
    price NUMERIC(10,4) NOT NULL,
    freight_value NUMERIC(10,4) NOT NULL,

    CONSTRAINT pk_order_items
        PRIMARY KEY (order_id, order_item_id),

    CONSTRAINT fk_order_items_orders
        FOREIGN KEY (order_id)
        REFERENCES raw.orders(order_id),

    CONSTRAINT fk_order_items_products
        FOREIGN KEY (product_id)
        REFERENCES raw.products(product_id),

    CONSTRAINT fk_order_items_sellers
        FOREIGN KEY (seller_id)
        REFERENCES raw.sellers(seller_id)
);


-- ============================================================
-- Order Payments
-- ============================================================

CREATE TABLE raw.order_payments (
    order_id VARCHAR(32) NOT NULL,
    payment_sequential INTEGER NOT NULL,
    payment_type TEXT,
    payment_installments INTEGER NOT NULL,
    payment_value NUMERIC(10,2),

    CONSTRAINT pk_order_payments
        PRIMARY KEY (order_id, payment_sequential),

    CONSTRAINT fk_order_payments_orders
        FOREIGN KEY (order_id)
        REFERENCES raw.orders(order_id)
);


-- ============================================================
-- Order Reviews
-- ============================================================

CREATE TABLE raw.order_reviews (
    review_id VARCHAR(32) NOT NULL,
    order_id VARCHAR(32) NOT NULL,
    review_score INTEGER,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date TIMESTAMP NOT NULL,
    review_answer_date TIMESTAMP,

    CONSTRAINT pk_order_reviews
        PRIMARY KEY (review_id, order_id),

    CONSTRAINT fk_order_reviews_orders
        FOREIGN KEY (order_id)
        REFERENCES raw.orders(order_id)
);


-- ============================================================
-- Product Category Translation
-- ============================================================

CREATE TABLE raw.product_category_name_translation (
    product_category_name TEXT NOT NULL,
    product_category_name_english TEXT NOT NULL
);