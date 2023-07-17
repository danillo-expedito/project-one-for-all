SELECT 
    CASE
        WHEN u.idade <= 30 THEN 'Até 30 anos'
        WHEN u.idade BETWEEN 31 AND 60 THEN 'Entre 31 e 60 anos'
        WHEN u.idade > 60 THEN 'Maior de 60 anos'
	END AS faixa_etaria,
    COUNT(DISTINCT u.user_id) total_pessoas_usuarias,
    COUNT(fs.user_id) total_favoritadas
FROM
    user_table u
LEFT JOIN
    favorite_song fs ON fs.user_id = u.user_id
GROUP BY faixa_etaria
ORDER BY faixa_etaria ASC;