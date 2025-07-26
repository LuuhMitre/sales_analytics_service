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

-- Inserts for products table
INSERT INTO products (name) VALUES
    ('IP DEDICADO'),
    ('IP TRÂNSITO'),
    ('LAN TO LAN'),
    ('TRANSPORTE PTT'),
    ('COLOCATION'),
    ('TELEFONIA FIXA'),
    ('ANTI DDOS');

-- Inserts for sellers table
INSERT INTO sellers (name, monthly_target, installation_target) VALUES
    ('João Santos', 7000.00, 3500.00),
    ('Letícia Cardoso', 10000.00, 5000.00),
    ('Carla Soares', 10000.00, 5000.00),
    ('Luiz Henrique', 5000.00, 2500.00),
    ('Marcos Rodrigues', 7000.00, 3500.00),
    ('Beatriz Almeida', 5000.00, 2500.00),
    ('Guilherme Costa', 10000.00, 5000.00),
    ('Mariana Oliveira', 7000.00, 3500.00);

-- Inserts for sales table (90 entries)
INSERT INTO sales (company, monthly_fee, installation_fee, contract_type, product_id, seller_id, sale_date, activation_date) VALUES
    ('NovaLink Soluções', 3400.00, 1250.00, 'new_sale', 1, 5, '2025-07-20', '2025-07-22'),
    ('FuturaNet Conectividade', 4900.00, 1800.00, 'upgrade', 2, 3, '2025-07-20', '2025-07-24'),
    ('GigaFibras Telecom', 1900.00, 700.00, 'new_sale', 4, 1, '2025-07-20', '2025-07-23'),
    ('Conecta Brasil', 5500.00, 2500.00, 'new_sale', 5, 2, '2025-07-19', '2025-07-25'),
    ('Velox Telecom', 2800.00, 1100.00, 'upgrade', 3, 7, '2025-07-19', '2025-07-21'),
    ('Data Center Express', 6500.00, 3000.00, 'new_sale', 5, 8, '2025-07-18', '2025-07-24'),
    ('Rede Segura Pro', 7500.00, 3500.00, 'new_sale', 7, 6, '2025-07-18', '2025-07-20'),
    ('VozTotal Comunicações', 1200.00, 450.00, 'new_sale', 6, 4, '2025-07-17', '2025-07-22'),
    ('Ultra Conexões', 4100.00, 1500.00, 'upgrade', 2, 2, '2025-07-17', '2025-07-21'),
    ('Ponto a Ponto Net', 3200.00, 1200.00, 'new_sale', 3, 1, '2025-07-16', '2025-07-18'),
    ('InfraData Hosting', 8000.00, 4000.00, 'new_sale', 5, 8, '2025-07-15', '2025-07-20'),
    ('Link Direto Telecom', 2200.00, 800.00, 'new_sale', 1, 5, '2025-07-14', '2025-07-17'),
    ('Mega Rota Net', 3800.00, 1400.00, 'upgrade', 2, 3, '2025-07-13', '2025-07-16'),
    ('Escudo Digital', 9000.00, 4500.00, 'new_sale', 7, 6, '2025-07-12', '2025-07-15'),
    ('FaleMais Telefonia', 800.00, 300.00, 'new_sale', 6, 7, '2025-07-11', '2025-07-14'),
    ('Conexão PTT SP', 4500.00, 1600.00, 'new_sale', 4, 1, '2025-07-10', '2025-07-13'),
    ('Alpha Soluções em TI', 3100.00, 1150.00, 'upgrade', 1, 4, '2025-07-09', '2025-07-12'),
    ('Matrix Conectividade', 5200.00, 2200.00, 'new_sale', 3, 2, '2025-07-08', '2025-07-11'),
    ('Nexus Hosting', 7200.00, 3200.00, 'new_sale', 5, 8, '2025-07-07', '2025-07-10'),
    ('Vortex IP Services', 4800.00, 1900.00, 'upgrade', 2, 3, '2025-07-06', '2025-07-09'),
    ('ProtectWall Security', 10000.00, 5000.00, 'new_sale', 7, 6, '2025-07-05', '2025-07-08'),
    ('Central de Voz', 1500.00, 600.00, 'upgrade', 6, 7, '2025-07-04', '2025-07-07'),
    ('Quantum Link', 2900.00, 1000.00, 'new_sale', 1, 5, '2025-07-03', '2025-07-06'),
    ('BridgeNet PTT', 4300.00, 1550.00, 'new_sale', 4, 1, '2025-07-02', '2025-07-05'),
    ('DataSpace Colocation', 8500.00, 4200.00, 'upgrade', 5, 8, '2025-07-01', '2025-07-04'),
    ('Fast Track IP', 3500.00, 1300.00, 'new_sale', 2, 2, '2025-06-30', '2025-07-03'),
    ('NetGuard DDoS', 6800.00, 3100.00, 'new_sale', 7, 6, '2025-06-29', '2025-07-02'),
    ('Global Talk', 950.00, 350.00, 'new_sale', 6, 4, '2025-06-28', '2025-07-01'),
    ('DirectLink LAN', 3300.00, 1250.00, 'upgrade', 3, 1, '2025-06-27', '2025-06-30'),
    ('Apex Dedicated IP', 2500.00, 900.00, 'new_sale', 1, 5, '2025-06-26', '2025-06-29'),
    ('Titanium Hosting', 9200.00, 4800.00, 'new_sale', 5, 8, '2025-06-25', '2025-06-28'),
    ('Flow Connect', 4200.00, 1700.00, 'new_sale', 2, 3, '2025-06-24', '2025-06-27'),
    ('Shield Security', 8200.00, 3800.00, 'upgrade', 7, 6, '2025-06-23', '2025-06-26'),
    ('Comunica Fácil', 1300.00, 500.00, 'new_sale', 6, 7, '2025-06-22', '2025-06-25'),
    ('Link Express PTT', 4700.00, 1800.00, 'new_sale', 4, 1, '2025-06-21', '2025-06-24'),
    ('Data Core Center', 7800.00, 3600.00, 'new_sale', 5, 2, '2025-06-20', '2025-06-23'),
    ('Infinity Net', 3600.00, 1350.00, 'upgrade', 3, 4, '2025-06-19', '2025-06-22'),
    ('IP Prime Solutions', 2700.00, 950.00, 'new_sale', 1, 5, '2025-06-18', '2025-06-21'),
    ('TransitNet Global', 5000.00, 2000.00, 'new_sale', 2, 3, '2025-06-17', '2025-06-20'),
    ('Fortress DDoS Protection', 9500.00, 4700.00, 'new_sale', 7, 6, '2025-06-16', '2025-06-19'),
    ('TeleRede Fixa', 1100.00, 400.00, 'upgrade', 6, 7, '2025-06-15', '2025-06-18'),
    ('Rack Seguro', 6900.00, 3300.00, 'new_sale', 5, 8, '2025-06-14', '2025-06-17'),
    ('Conecta PTT Brasil', 4000.00, 1450.00, 'new_sale', 4, 1, '2025-06-13', '2025-06-16'),
    ('Bridge Connection', 3000.00, 1100.00, 'new_sale', 3, 2, '2025-06-12', '2025-06-15'),
    ('IP Dedicado Max', 2300.00, 850.00, 'upgrade', 1, 4, '2025-06-11', '2025-06-14'),
    ('Trânsito Rápido', 4600.00, 1750.00, 'new_sale', 2, 3, '2025-06-10', '2025-06-13'),
    ('Defesa Cibernética', 8800.00, 4300.00, 'new_sale', 7, 6, '2025-06-09', '2025-06-12'),
    ('Call Center Voz', 1700.00, 700.00, 'new_sale', 6, 7, '2025-06-08', '2025-06-11'),
    ('Servidor Dedicado Co.', 9800.00, 4900.00, 'upgrade', 5, 8, '2025-06-07', '2025-06-10'),
    ('Link PTT Direto', 4400.00, 1650.00, 'new_sale', 4, 1, '2025-06-06', '2025-06-09'),
    ('Conexão LAN Segura', 3700.00, 1400.00, 'new_sale', 3, 2, '2025-06-05', '2025-06-08'),
    ('IP Fixo Empresarial', 2600.00, 920.00, 'new_sale', 1, 5, '2025-06-04', '2025-06-07'),
    ('Rede Trânsito Plus', 5300.00, 2300.00, 'upgrade', 2, 3, '2025-06-03', '2025-06-06'),
    ('Muralha Digital', 7900.00, 3700.00, 'new_sale', 7, 6, '2025-06-02', '2025-06-05'),
    ('Telefonia Corporativa', 1400.00, 550.00, 'new_sale', 6, 4, '2025-06-01', '2025-06-04'),
    ('Rack Space Pro', 8300.00, 4100.00, 'new_sale', 5, 8, '2025-05-31', '2025-06-03'),
    ('PTT Link Express', 4900.00, 1950.00, 'upgrade', 4, 1, '2025-05-30', '2025-06-02'),
    ('LAN to LAN Plus', 3900.00, 1500.00, 'new_sale', 3, 2, '2025-05-29', '2025-06-01'),
    ('IP Único Garantido', 2100.00, 750.00, 'new_sale', 1, 5, '2025-05-28', '2025-05-31'),
    ('Trânsito IP Dedicado', 5800.00, 2800.00, 'new_sale', 2, 3, '2025-05-27', '2025-05-30'),
    ('Anti-Ataque Pro', 9300.00, 4600.00, 'upgrade', 7, 6, '2025-05-26', '2025-05-29'),
    ('Voz sobre IP', 1800.00, 800.00, 'new_sale', 6, 7, '2025-05-25', '2025-05-28'),
    ('Colocation Prime', 8900.00, 4400.00, 'new_sale', 5, 8, '2025-05-24', '2025-05-27'),
    ('Link PTT SP-RJ', 5100.00, 2100.00, 'new_sale', 4, 1, '2025-05-23', '2025-05-26'),
    ('Conexão Ponto a Ponto', 3400.00, 1300.00, 'upgrade', 3, 2, '2025-05-22', '2025-05-25'),
    ('IP Fixo Pro', 2400.00, 880.00, 'new_sale', 1, 4, '2025-05-21', '2025-05-24'),
    ('IP Trânsito Gold', 6000.00, 3000.00, 'new_sale', 2, 3, '2025-05-20', '2025-05-23'),
    ('DDoS Shield Max', 11000.00, 5500.00, 'new_sale', 7, 6, '2025-05-19', '2025-05-22'),
    ('Telefonia Empresarial', 1600.00, 650.00, 'upgrade', 6, 7, '2025-05-18', '2025-05-21'),
    ('Data Center Prime', 9600.00, 4800.00, 'new_sale', 5, 8, '2025-05-17', '2025-05-20'),
    ('PTT Conect', 4600.00, 1700.00, 'new_sale', 4, 1, '2025-05-16', '2025-05-19'),
    ('Conexão LAN Premium', 3800.00, 1450.00, 'new_sale', 3, 2, '2025-05-15', '2025-05-18'),
    ('IP Dedicado Plus', 2800.00, 980.00, 'upgrade', 1, 5, '2025-05-14', '2025-05-17'),
    ('Rede Rápida IP', 5400.00, 2400.00, 'new_sale', 2, 3, '2025-05-13', '2025-05-16'),
    ('Proteção DDoS Total', 9700.00, 4850.00, 'new_sale', 7, 6, '2025-05-12', '2025-05-15'),
    ('Linha Direta Fixa', 1900.00, 900.00, 'new_sale', 6, 4, '2025-05-11', '2025-05-14'),
    ('Rack Premium', 8700.00, 4300.00, 'upgrade', 5, 8, '2025-05-10', '2025-05-13'),
    ('Link PTT Nacional', 5200.00, 2200.00, 'new_sale', 4, 1, '2025-05-09', '2025-05-12'),
    ('LAN to LAN Express', 4000.00, 1550.00, 'new_sale', 3, 2, '2025-05-08', '2025-05-11'),
    ('IP Fixo Gold', 2900.00, 1050.00, 'new_sale', 1, 5, '2025-05-07', '2025-05-10'),
    ('Trânsito IP Premium', 6200.00, 3100.00, 'upgrade', 2, 3, '2025-05-06', '2025-05-09'),
    ('Guardião DDoS', 12000.00, 6000.00, 'new_sale', 7, 6, '2025-05-05', '2025-05-08'),
    ('Telefonia Digital', 2000.00, 1000.00, 'new_sale', 6, 7, '2025-05-04', '2025-05-07'),
    ('Colocation Segura', 9100.00, 4550.00, 'new_sale', 5, 8, '2025-05-03', '2025-05-06'),
    ('Conexão PTT Express', 4800.00, 1900.00, 'upgrade', 4, 1, '2025-05-02', '2025-05-05'),
    ('Conexão LAN to LAN', 3600.00, 1350.00, 'new_sale', 3, 2, '2025-05-01', '2025-05-04'),
    ('IP Dedicado Essencial', 2200.00, 800.00, 'new_sale', 1, 4, '2025-04-30', '2025-05-03'),
    ('Trânsito IP Silver', 5600.00, 2600.00, 'new_sale', 2, 3, '2025-04-29', '2025-05-02'),
    ('Barreira DDoS', 10500.00, 5200.00, 'upgrade', 7, 6, '2025-04-28', '2025-05-01'),
    ('Voz Corporativa', 2100.00, 1100.00, 'new_sale', 6, 7, '2025-04-27', '2025-04-30'),
    ('Rack Data Center', 9400.00, 4700.00, 'new_sale', 5, 8, '2025-04-26', '2025-04-29');