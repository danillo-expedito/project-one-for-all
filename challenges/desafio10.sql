USE SpotifyClone;

CREATE TABLE favorite_song 
(
    user_id	INT NOT NULL,
    favorite_song_id INT NOT NULL,
    UNIQUE (user_id, favorite_song_id),
    FOREIGN KEY (user_id) REFERENCES user_table (user_id),
    FOREIGN KEY (favorite_song_id) REFERENCES song (song_id)
);

INSERT INTO favorite_song (user_id, favorite_song_id) VALUES
	('1', '3'),
	('1', '6'),
	('1', '10'),
	('2', '4'),
	('3', '1'),
	('3', '3'),
	('4', '7'),
	('4', '4'),
	('5', '10'),
	('5', '2'),
	('8', '4'),
	('9', '7'),
	('10', '3');