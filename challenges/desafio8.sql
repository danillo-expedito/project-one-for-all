SELECT
     a.name artista, b.name album
FROM
     artist a
INNER JOIN 
     album b ON a.artist_id = b.artist_id
GROUP BY artista, album
HAVING artista = 'Elis Regina'
ORDER BY album;