SELECT 
    s.name AS cancao, COUNT(ph.played_song) reproducoes
FROM 
    song s
INNER JOIN 
    playback_history ph ON s.song_id = ph.played_song
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;