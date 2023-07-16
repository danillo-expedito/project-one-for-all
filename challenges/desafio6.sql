SELECT 
    MIN(p.price) faturamento_minimo,
    MAX(p.price) faturamento_maximo,
    ROUND(AVG(p.price), 2) faturamento_medio,
    SUM(p.price) faturamento_total
FROM
    user_table u
INNER JOIN
	plan p ON u.plan_id = p.plan_id;