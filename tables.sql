-- Table creation

-- Create table CUSTOMERS
CREATE TABLE CUSTOMERS(
	customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(50),
    email VARCHAR(100),
    street VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    zip_code INT
);

-- Create table BRANDS
CREATE TABLE BRANDS(
	brand_id INT PRIMARY KEY,
    brand_name VARCHAR(30)
);

-- Create table CATEGORIES
CREATE TABLE CATEGORIES(
	category_id INT PRIMARY KEY,
    category_name VARCHAR(30)
);

-- Create table PRODUCTS
CREATE TABLE PRODUCTS(
	product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    brand_id INT,
    category_id INT,
    model_year VARCHAR(10),
    list_price INT,
    FOREIGN KEY (brand_id) REFERENCES BRANDS(brand_id),
    FOREIGN KEY (category_id) REFERENCES CATEGORIES(category_id)
);

-- Create tables STORES
CREATE TABLE STORES(
	store_id INT PRIMARY KEY,
    store_name VARCHAR(50),
    phone VARCHAR(50),
    email VARCHAR(50),
    street VARCHAR(50),
    city VARCHAR(30),
    state VARCHAR(10),
    zip_code VARCHAR(10)
);

-- Create table STAFFS
CREATE TABLE STAFFS(
	staff_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    phone VARCHAR(30),
    available INT,
    store_id INT,
    FOREIGN KEY (store_id) REFERENCES STORES(store_id)
);

-- Create table ORDERS
CREATE TABLE ORDERS(
	order_id INT PRIMARY KEY,
    customer_id INT,
    order_status INT,
    order_date VARCHAR(20),
    required_date VARCHAR(20),
    shipped_date VARCHAR(20),
    store_id INT,
    staff_id INT,
    FOREIGN KEY (store_id) REFERENCES STORES(store_id),
    FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id),
    FOREIGN KEY (staff_id) REFERENCES STAFFS(staff_id)
);

-- Create table ORDER_ITEMS
CREATE TABLE ORDER_ITEMS(
	order_id INT,
    item_id INT,
    product_id INT,
    quantity INT,
    list_price INT,
    discount INT,
    PRIMARY KEY(order_id, item_id),
    FOREIGN KEY (order_id) REFERENCES ORDERS(order_id),
    FOREIGN KEY (product_id) REFERENCES PRODUCTS(product_id)
);

-- Read in data from files

-- Read customer data
LOAD DATA INFILE 'C:/Users/tousi/OneDrive/Desktop/Projects/BikeStoreAnalysis/data/customers.csv' INTO TABLE CUSTOMERS FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- Read brands data
LOAD DATA INFILE 'C:/Users/tousi/OneDrive/Desktop/Projects/BikeStoreAnalysis/data/brands.csv' INTO TABLE BRANDS FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- Read categories data
LOAD DATA INFILE 'C:/Users/tousi/OneDrive/Desktop/Projects/BikeStoreAnalysis/data/categories.csv' INTO TABLE CATEGORIES FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- Read products data
LOAD DATA INFILE 'C:/Users/tousi/OneDrive/Desktop/Projects/BikeStoreAnalysis/data/products.csv' INTO TABLE PRODUCTS FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- Read stores data
LOAD DATA INFILE 'C:/Users/tousi/OneDrive/Desktop/Projects/BikeStoreAnalysis/data/stores.csv' INTO TABLE STORES FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- Read staff data
LOAD DATA INFILE 'C:/Users/tousi/OneDrive/Desktop/Projects/BikeStoreAnalysis/data/staffs_updated.csv' INTO TABLE STAFFS FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- Read orders data
LOAD DATA INFILE 'C:/Users/tousi/OneDrive/Desktop/Projects/BikeStoreAnalysis/data/orders.csv' INTO TABLE ORDERS FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- Read order_items data
LOAD DATA INFILE 'C:/Users/tousi/OneDrive/Desktop/Projects/BikeStoreAnalysis/data/order_items.csv' INTO TABLE ORDER_ITEMS FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

select * from order_items LIMIT 5;
