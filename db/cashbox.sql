DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS merchants;
DROP TABLE IF EXISTS categories;


CREATE TABLE categories(
id SERIAL8 primary key,
name VARCHAR(255)
); 

CREATE TABLE merchants(
id SERIAL8 primary key,
name VARCHAR(255)
);

CREATE TABLE transactions(
id SERIAL8 primary key,
trans_date DATE,
amount numeric(10,2),
merchant_id int8 references merchants(id),
category_id int8 references categories(id)
);

