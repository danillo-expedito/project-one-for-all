SELECT
    CONCAT(u.first_name, ' ', u.last_name) pessoa_usuaria,
    IF(YEAR(ph.playback_date) >= 2021, 'Ativa', 'Inativa') AS status_pessoa_usuaria
FROM 
    user_table u
INNER JOIN 
   (
       SELECT user_id, MAX(playback_date) max_date
       FROM playback_history
       GROUP BY user_id
   ) AS recent_ph ON u.user_id = recent_ph.user_id
INNER JOIN
     playback_history ph ON ph.user_id = recent_ph.user_id AND ph.playback_date = recent_ph.max_date
GROUP BY 
    pessoa_usuaria, status_pessoa_usuaria
ORDER BY 
    pessoa_usuaria;