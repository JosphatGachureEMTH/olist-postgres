-- ============================================================
-- Olist E-commerce Dataset
-- Raw Data Loading
-- ============================================================

-- Load data into the raw schema.
-- CSV files are expected to be available inside the PostgreSQL
-- environment under /data.


\copy raw.customers
FROM '/data/olist_customers_dataset.csv'
WITH (FORMAT csv, HEADER true);


\copy raw.geolocation
FROM '/data/olist_geolocation_dataset.csv'
WITH (FORMAT csv, HEADER true);


\copy raw.order_items
FROM '/data/olist_order_items_dataset.csv'
WITH (FORMAT csv, HEADER true);


\copy raw.order_payments
FROM '/data/olist_order_payments_dataset.csv'
WITH (FORMAT csv, HEADER true);


\copy raw.order_reviews
FROM '/data/olist_order_reviews_dataset.csv'
WITH (FORMAT csv, HEADER true);


\copy raw.orders
FROM '/data/olist_orders_dataset.csv'
WITH (FORMAT csv, HEADER true);


\copy raw.products
FROM '/data/olist_products_dataset.csv'
WITH (FORMAT csv, HEADER true);


\copy raw.sellers
FROM '/data/olist_sellers_dataset.csv'
WITH (FORMAT csv, HEADER true);


\copy raw.product_category_name_translation
FROM '/data/product_category_name_translation.csv'
WITH (FORMAT csv, HEADER true);