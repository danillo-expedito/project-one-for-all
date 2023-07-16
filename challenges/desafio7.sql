SELECT 
    a.name artista, b.name album, COUNT(f.user_id) pessoas_seguidoras
FROM
    artist a
INNER JOIN 
    album b ON a.artist_id = b.artist_id
INNER JOIN 
    following f ON f.following_artist = a.artist_id
GROUP BY artista, album
ORDER BY
    pessoas_seguidoras DESC, artista ASC, album ASC;