-- Create Customers table
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  age INT,
  job VARCHAR(50),
  marital_status VARCHAR(20),
  education VARCHAR(50),
  contact_type VARCHAR(20)
);

-- Create Products table
CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(50),
  product_type VARCHAR(50)
);

-- Create Campaigns table
CREATE TABLE campaigns (
  campaign_id INT PRIMARY KEY,
  customer_id INT,
  contact_date DATE,
  duration INT, -- in seconds
  contact_day VARCHAR(10),
  contact_month VARCHAR(10),
  campaign_channel VARCHAR(20),
  product_id INT,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Create Responses table
CREATE TABLE responses (
  response_id INT PRIMARY KEY,
  campaign_id INT,
  response VARCHAR(5), -- 'yes' or 'no'
  FOREIGN KEY (campaign_id) REFERENCES campaigns(campaign_id)
