🧱 1. View — Fato Vendas
CREATE OR REPLACE VIEW vw_fato_vendas AS
SELECT
    o.order_id,
    o.order_date,
    o.customer_id,
    o.employee_id,
    od.product_id,
    od.quantity,
    od.unit_price,
    (od.quantity * od.unit_price) AS total_item
FROM orders o
JOIN order_details od
    ON o.order_id = od.order_id;

🧱 2. View — Dimensão Clientes
CREATE OR REPLACE VIEW vw_dim_clientes AS
SELECT
    customer_id,
    company_name,
    contact_name,
    country,
    city
FROM customers;


🧱 3. View — Dimensão Produtos
CREATE OR REPLACE VIEW vw_dim_produtos AS
SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    s.company_name AS supplier_name
FROM products p
JOIN categories c
    ON p.category_id = c.category_id
JOIN suppliers s
    ON p.supplier_id = s.supplier_id;

