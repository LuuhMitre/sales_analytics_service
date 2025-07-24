-- Drop table product to ensure a clean configuration
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS sellers;
DROP TABLE IF EXISTS products;

-- Create table sellers
CREATE TABLE sellers (
    id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
    monthly_target DECIMAL(10, 2) NOT NULL,
    installation_target DECIMAL(10, 2) NOT NULL
);

-- Create table products
CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) UNIQUE NOT NULL 
);

-- Create table sales
CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    company VARCHAR(100) NOT NULL,
    monthly_fee DECIMAL(10, 2) NOT NULL,
    installation_fee DECIMAL(10, 2) NOT NULL,
    contract_type VARCHAR(20) NOT NULL CHECK (contract_type IN ('new_sale', 'upgrade')),
    sale_date DATE NOT NULL,
    activation_date DATE,
    product_id INTEGER NOT NULL,
    seller_id INTEGER NOT NULL,
	CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES products(id),
	CONSTRAINT fk_seller FOREIGN KEY (seller_id) REFERENCES sellers(id)
);


-- Insert some examples data into the tables. All values are fictional and for demonstration purposes only.

-- Sellers
INSERT INTO sellers (name, monthly_target, installation_target) VALUES
    ('Letícia Cardoso', 5000.00, 2500.00),
    ('Carla Soares', 10000.00, 5000.00),
    ('Joaquim Santos', 5000.00, 2500.00),
    ('Luiz Henrique', 7000.00, 3500.00),
    ('Marcos Rodrigues', 7000.00, 3500.00);

-- Products
INSERT INTO products (name) VALUES
    ('INTERNET CORPORATIVA'),
    ('IP DEDICADO'),
    ('IP TRÂNSITO'),
    ('LAN TO LAN'),
    ('SEMI-DEDICADO'),
    ('TRANSPORTE PTT'),
    ('WIFI-SEGURO'),
    ('TV'),
    ('COLOCATION'),
    ('SOUPLAY'),
    ('ROTEADOR'),
    ('EVENTO IP'),
    ('TELEFONIA FIXA'),
    ('ANTI DDOS');

-- Sales
INSERT INTO sales (company, monthly_fee, installation_fee, contract_type, product_id, seller_id, sale_date, activation_date) VALUES
    ('Alfa Telecom', 3000.00, 1000.00, 'new_sale', 1, 1, '2025-04-05', '2025-07-01'),
    ('Beta Net', 2500.00, 900.00, 'upgrade', 2, 2, '2025-04-12', '2025-07-01'),
    ('GigaFiber', 4500.00, 2000.00, 'new_sale', 3, 3, '2025-04-15', '2025-07-02'),
    ('LinkMax', 3800.00, 1300.00, 'new_sale', 4, 4, '2025-04-20', '2025-07-03'),
    ('FuturaNet', 5000.00, 1800.00, 'upgrade', 5, 5, '2025-04-25', '2025-07-04'),
    ('Alfa Telecom', 3200.00, 1200.00, 'upgrade', 6, 1, '2025-05-01', '2025-07-05'),
    ('TopConnect', 2900.00, 1100.00, 'new_sale', 7, 2, '2025-05-05', '2025-07-05'),
    ('Comtel', 3100.00, 950.00, 'upgrade', 8, 3, '2025-05-10', '2025-07-06'),
    ('GigaFiber', 4700.00, 2200.00, 'new_sale', 9, 4, '2025-05-12', '2025-07-06'),
    ('NovaLink', 2600.00, 1000.00, 'upgrade', 10, 5, '2025-05-15', '2025-07-07'),
    ('Alfa Telecom', 3400.00, 1050.00, 'new_sale', 11, 1, '2025-05-20', '2025-07-07'),
    ('Beta Net', 2800.00, 850.00, 'upgrade', 12, 2, '2025-05-25', '2025-07-08'),
    ('LinkMax', 3900.00, 1250.00, 'new_sale', 13, 3, '2025-05-30', '2025-07-08'),
    ('FuturaNet', 4100.00, 1300.00, 'upgrade', 14, 4, '2025-06-01', '2025-07-09'),
    ('Comtel', 3700.00, 1000.00, 'new_sale', 1, 5, '2025-06-04', '2025-07-09'),
    ('TopConnect', 2500.00, 800.00, 'upgrade', 2, 1, '2025-06-07', '2025-07-10'),
    ('NovaLink', 2600.00, 950.00, 'new_sale', 3, 2, '2025-06-10', '2025-07-10'),
    ('GigaFiber', 4300.00, 1600.00, 'upgrade', 4, 3, '2025-06-13', '2025-07-11'),
    ('Alfa Telecom', 3100.00, 1000.00, 'new_sale', 5, 4, '2025-06-15', '2025-07-11'),
    ('Beta Net', 2800.00, 900.00, 'upgrade', 6, 5, '2025-06-18', '2025-07-12'),
    ('FuturaNet', 4900.00, 1700.00, 'new_sale', 7, 1, '2025-06-20', '2025-07-12'),
    ('Comtel', 3600.00, 1150.00, 'upgrade', 8, 2, '2025-06-23', '2025-07-13'),
    ('TopConnect', 3100.00, 1200.00, 'new_sale', 9, 3, '2025-06-25', '2025-07-13'),
    ('NovaLink', 3300.00, 1100.00, 'upgrade', 10, 4, '2025-06-27', '2025-07-14'),
    ('GigaFiber', 4400.00, 2000.00, 'new_sale', 11, 5, '2025-06-29', '2025-07-14'),
    ('LinkMax', 3900.00, 1350.00, 'upgrade', 12, 1, '2025-07-01', '2025-07-15'),
    ('FuturaNet', 4200.00, 1600.00, 'new_sale', 13, 2, '2025-07-03', '2025-07-15'),
    ('Comtel', 3100.00, 950.00, 'upgrade', 14, 3, '2025-07-05', '2025-07-16'),
    ('Alfa Telecom', 3000.00, 1050.00, 'new_sale', 1, 4, '2025-07-07', '2025-07-16'),
    ('TopConnect', 2700.00, 1000.00, 'upgrade', 2, 5, '2025-07-08', '2025-07-17'),
    ('NovaLink', 2900.00, 1100.00, 'new_sale', 3, 1, '2025-07-09', '2025-07-17'),
    ('GigaFiber', 4000.00, 1450.00, 'upgrade', 4, 2, '2025-07-10', '2025-07-18'),
    ('LinkMax', 3800.00, 1250.00, 'new_sale', 5, 3, '2025-07-11', '2025-07-18'),
    ('Comtel', 3500.00, 900.00, 'upgrade', 6, 4, '2025-07-12', '2025-07-19'),
    ('Beta Net', 2600.00, 950.00, 'new_sale', 7, 5, '2025-07-13', '2025-07-19'),
    ('Alfa Telecom', 3400.00, 1150.00, 'upgrade', 8, 1, '2025-07-14', '2025-07-20'),
    ('TopConnect', 3200.00, 1100.00, 'new_sale', 9, 2, '2025-07-15', '2025-07-20'),
    ('NovaLink', 3600.00, 1300.00, 'upgrade', 10, 3, '2025-07-16', '2025-07-20'),
    ('FuturaNet', 4100.00, 1500.00, 'new_sale', 11, 4, '2025-07-17', '2025-07-20'),
    ('GigaFiber', 4700.00, 2200.00, 'upgrade', 12, 5, '2025-07-18', '2025-07-20'),
    ('LinkMax', 3900.00, 1250.00, 'new_sale', 13, 1, '2025-07-19', '2025-07-20'),
    ('Comtel', 3000.00, 1000.00, 'upgrade', 14, 2, '2025-07-20', '2025-07-20'),
    ('TopConnect', 2800.00, 950.00, 'new_sale', 1, 3, '2025-07-20', '2025-07-20'),
    ('Alfa Telecom', 3300.00, 1200.00, 'upgrade', 2, 4, '2025-07-20', '2025-07-20'),
    ('NovaLink', 3400.00, 1250.00, 'new_sale', 3, 5, '2025-07-20', '2025-07-20'),
    ('FuturaNet', 4000.00, 1800.00, 'upgrade', 4, 1, '2025-07-20', '2025-07-20'),
    ('GigaFiber', 4600.00, 1900.00, 'new_sale', 5, 2, '2025-07-20', '2025-07-20'),
    ('LinkMax', 3700.00, 1100.00, 'upgrade', 6, 3, '2025-07-20', '2025-07-20');
