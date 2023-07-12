DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE plan 
(
    plan_id INT AUTO_INCREMENT PRIMARY KEY,
    plan VARCHAR(20) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE user_table 
(
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    idade INT,
    plan_id INT NOT NULL,
    FOREIGN KEY (plan_id) REFERENCES plan (plan_id)
);

CREATE TABLE artist 
(
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE album 
(
    album_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    artist_id INT NOT NULL,
    release_year INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artist (artist_id)
);

CREATE TABLE song 
(
    song_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    length_seconds INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES album (album_id)
);

CREATE TABLE playback_history 
(
    user_id INT NOT NULL,
    played_song INT NOT NULL,
    playback_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, played_song),
    FOREIGN KEY (user_id) REFERENCES user_table (user_id),
    FOREIGN KEY (played_song) REFERENCES song (song_id)
);

CREATE TABLE following 
(
    user_id INT NOT NULL,
    following_artist INT NULL,
    UNIQUE (user_id, following_artist),
    FOREIGN KEY (user_id) REFERENCES user_table (user_id),
    FOREIGN KEY (following_artist) REFERENCES artist (artist_id)
);

INSERT INTO plan (plan_id, plan, price) VALUES
    (1, 'gratuito', 0),
    (2, 'familiar', 7.99),
    (3, 'universitário', 5.99),
    (4, 'pessoal', 6.99);

INSERT INTO user_table (user_id, first_name, last_name, idade, plan_id) VALUES
    (1, 'Barbara', 'Liskov', 82, 1),
    (2, 'Robert', 'Cecil Martin', 58, 1),
    (3, 'Ada', 'Lovelace', 37, 2),
    (4, 'Martin', 'Fowler', 46, 2),
    (5, 'Sandi', 'Metz', 58, 2),
    (6, 'Paulo', 'Freire', 19, 3),
    (7, 'Bell', 'Hooks', 26, 3),
    (8, 'Christopher', 'Alexander', 85, 4),
    (9, 'Judith', 'Butler', 45, 4),
    (10, 'Jorge', 'Amado', 58, 4);

INSERT INTO artist (artist_id, name) VALUES
    (1, 'Beyoncé'),
    (2, 'Queen'),
    (3, 'Elis Regina'),
    (4, 'Baco Exu do Blues'),
    (5, 'Blind Guardian'),
    (6, 'Nina Simone');
    
INSERT INTO album (album_id, name, artist_id, release_year) VALUES
    (1, 'Renaissance', 1, 2022),
    (2, 'Jazz', 2, 1978),
    (3, 'Hot Space', 2, 1982),
    (4, 'Falso Brilhante', 3, 1998),
    (5, 'Vento de Maio', 3, 2001),
    (6, 'QVVJFA?', 4, 2003),
    (7, 'Somewhere Far Beyond', 5, 2007),
    (8, 'I Put A Spell On You', 6, 2012);
    
INSERT INTO song (song_id, name, length_seconds, album_id) VALUES
    (1, 'BREAK MY SOUL', 279, 1),
    (2, 'VIRGO’S GROOVE', 369, 1),
    (3, 'ALIEN SUPERSTAR', 116, 1),
    (4, 'Don’t Stop Me Now', 203, 2),
    (5, 'Under Pressure', 152, 3),
    (6, 'Como Nossos Pais', 105, 4),
    (7, 'O Medo de Amar é o Medo de Ser Livre', 207, 5),
    (8, 'Samba em Paris', 267, 6),
    (9, 'The Bard’s Song', 244, 7),
    (10, 'Feeling Good', 100, 8);
    
INSERT INTO playback_history (user_id, played_song, playback_date) VALUES
    (1, 8, '2022-02-28 10:45:55'),
    (1, 2, '2020-05-02 05:30:35'),
    (1, 10, '2020-03-06 11:22:33'),
    (2, 10, '2022-08-05 08:05:17'),
    (2, 7, '2020-01-02 07:40:33'),
    (3, 10, '2020-11-13 16:55:13'),
    (3, 2, '2020-12-05 19:38:30'),
    (4, 8, '2021-08-15 17:10:10'),
    (5, 8, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (6, 7, '2017-01-24 00:31:17'),
    (6, 1, '2017-10-12 12:35:20'),
    (7, 4, '2011-12-15 22:30:49'),
    (8, 4, '2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (10, 3, '2015-12-13 08:30:22');
    
INSERT INTO following (user_id, following_artist) VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);
