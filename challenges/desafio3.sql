SELECT
    CONCAT(u.first_name, ' ', u.last_name) pessoa_usuaria,
    COUNT(ph.played_song) musicas_ouvidas,
    ROUND(SUM(s.length_seconds / 60), 2) total_minutos
FROM 
    user_table u
INNER JOIN
    playback_history ph ON u.user_id = ph.user_id
INNER JOIN
    song s ON ph.played_song = s.song_id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria;