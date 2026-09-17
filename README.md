\# Olist E-commerce Data Modeling with PostgreSQL



A hands-on PostgreSQL data modeling project using the Brazilian Olist e-commerce dataset.



\## Project Objective



The objective of this project is to take a raw e-commerce dataset and build a structured PostgreSQL data model while developing practical skills in:



\- Relational database design

\- Primary and foreign keys

\- One-to-many relationships

\- Composite primary keys

\- Data types and constraints

\- Data quality investigation

\- Raw and clean data layers

\- SQL-based data analysis

\- Data products and analytical modeling



\## Dataset



The project uses the Olist Brazilian e-commerce dataset.



The raw dataset contains information about:



\- Customers

\- Sellers

\- Orders

\- Order items

\- Payments

\- Reviews

\- Products

\- Product categories

\- Geolocation



\## Database



Database:



`studydb`



Schema:



`raw`



The raw schema is designed to preserve the structure and characteristics of the source data before transformation into analytical models.



\## Key Modeling Decisions



\### Orders and Order Items



An order can contain multiple products.



Therefore:



`orders` → `order\_items`



is a one-to-many relationship.



The order item table uses a composite primary key:



`(order\_id, order\_item\_id)`



because `order\_item\_id` identifies an item position within an order rather than uniquely identifying a row across the entire dataset.



\### Order Payments



An order can have multiple payment records.



The primary key is:



`(order\_id, payment\_sequential)`



\### Order Reviews



Investigation of the source data showed that `review\_id` was not unique.



Therefore, the raw table uses:



`(review\_id, order\_id)`



as its composite primary key rather than incorrectly assuming that `review\_id` alone is unique.



\### Geolocation



Latitude and longitude are stored as separate numeric columns using:



`NUMERIC(12,8)`



to preserve the precision present in the source data.



\## Project Structure



```text

olist-postgres/

├── README.md

├── .gitignore

└── sql/

&#x20;   └── create\_tables.sql

