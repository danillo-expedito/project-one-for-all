SELECT
    a.name album, COUNT(fs.favorite_song_id) favoritadas
FROM
    album a
INNER JOIN
    song s ON a.album_id = s.album_id
INNER JOIN 
    favorite_song fs ON s.song_id = fs.favorite_song_id
GROUP BY album
ORDER BY
    favoritadas DESC, album ASC
LIMIT 3;