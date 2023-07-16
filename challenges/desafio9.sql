SELECT
    COUNT(ph.played_song) musicas_no_historico
FROM
    user_table u
INNER JOIN
    playback_history ph ON u.user_id = ph.user_id
GROUP BY u.first_name, u.last_name
HAVING CONCAT(u.first_name, ' ', u.last_name) = 'Barbara Liskov';