-- Create the users table
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL
);

-- Create the cards table
CREATE TABLE cards (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES users(id),
  card_type VARCHAR(50) NOT NULL,
  number VARCHAR(50) NOT NULL
);

-- Create the products table
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  author VARCHAR(255) NOT NULL,
  country VARCHAR(100) NOT NULL,
  price NUMERIC(10, 2) NOT NULL
);

-- Create the orders table
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES users(id),
  total_price NUMERIC(10, 2) NOT NULL
);

-- Create the order_items table
CREATE TABLE order_items (
  id SERIAL PRIMARY KEY,
  order_id INTEGER NOT NULL REFERENCES orders(id),
  product_id INTEGER NOT NULL REFERENCES products(id),
  quantity INTEGER NOT NULL
);
