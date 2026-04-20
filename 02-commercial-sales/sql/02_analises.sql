🧮 1. Total de Vendas
-- Total de Vendas
SELECT
    SUM(total_item) AS total_vendas
FROM vw_fato_vendas;

🧾 2. Total de Pedidos

-- Total de Pedidos
SELECT
    COUNT(DISTINCT order_id) AS total_pedidos
FROM vw_fato_vendas;


📦 3. Total de Quantidade Vendida

-- Total de Quantidade Vendida
SELECT
    SUM(quantity) AS total_quantidade
FROM vw_fato_vendas;


💳 4. Ticket Médio

-- Ticket Médio
SELECT
    ROUND(
        CAST(SUM(total_item) / COUNT(DISTINCT order_id) AS numeric),
        2
    ) AS ticket_medio
FROM vw_fato_vendas;


📈 5. Vendas por Ano

-- Vendas por Ano
SELECT
    EXTRACT(YEAR FROM order_date) AS ano,
    SUM(total_item) AS total_vendas
FROM vw_fato_vendas
GROUP BY ano
ORDER BY ano;


📅 6. Vendas por Ano e Mês

-- Vendas por Ano e Mês
SELECT
    TO_CHAR(order_date, 'YYYY-MM') AS ano_mes,
    SUM(total_item) AS total_vendas
FROM vw_fato_vendas
GROUP BY ano_mes
ORDER BY ano_mes;



🏷️ 7. Vendas por Categoria de Produto


-- Vendas por Categoria
SELECT
    p.category_name,
    SUM(f.total_item) AS total_vendas
FROM vw_fato_vendas f
JOIN vw_dim_produtos p
    ON f.product_id = p.product_id
GROUP BY p.category_name
ORDER BY total_vendas DESC;


👨‍💼 8. Vendas por Funcionário

-- Vendas por Funcionário
SELECT
    CONCAT(e.first_name, ' ', e.last_name) AS funcionario,
    SUM(f.total_item) AS total_vendas
FROM vw_fato_vendas f
JOIN vw_dim_funcionarios e
    ON f.employee_id = e.employee_id
GROUP BY funcionario
ORDER BY total_vendas DESC;




