SELECT 
    a.name artista,
    CASE
        WHEN COUNT(fs.favorite_song_id) >= 5 THEN 'A'
        WHEN COUNT(fs.favorite_song_id) IN (3, 4) THEN 'B'
        WHEN COUNT(fs.favorite_song_id) IN (1, 2) THEN 'C'
        WHEN COUNT(fs.favorite_song_id) = 0 THEN '-'
	    ELSE '-'
	END AS ranking
FROM
    artist a
INNER JOIN
    album b ON b.artist_id = a.artist_id
INNER JOIN
	song s ON s.album_id = b.album_id
LEFT JOIN
    favorite_song fs ON fs.favorite_song_id = s.song_id
GROUP BY artista
ORDER BY COUNT(favorite_song_id) DESC, artista ASC;