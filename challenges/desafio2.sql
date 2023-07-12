SELECT
    COUNT(s.song_id) AS cancoes, COUNT(DISTINCT s.album_id) AS albuns, COUNT(DISTINCT a.artist_id) AS artistas
FROM 
    song s
INNER JOIN 
    album a ON s.album_id = a.album_id;