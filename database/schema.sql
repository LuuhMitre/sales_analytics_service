-- Drop the sales table if it exists to ensure a clean slate
DROP TABLE IF EXISTS sales;

-- Create table sales
CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    sale_date DATE NOT NULL,
    product VARCHAR(100) NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    quantity INTEGER NOT NULL
);

-- Insert some examples datas
INSERT INTO sales (sale_date, product, price, quantity) VALUES
('2025-07-01', 'Product A', 100.50, 2),
('2025-07-01', 'Product B', 250.00, 1),
('2025-07-02', 'Product A', 110.00, 3),
('2025-07-03', 'Product C', 80.25, 5),
('2025-07-04', 'Product B', 260.50, 2),
('2025-07-05', 'Product D', 550.00, 1);