-- Create and use the Database
CREATE DATABASE IF NOT EXISTS tv_series;
USE tv_series;

-- Creates all necessary tables
CREATE TABLE producer
(
    producer_id   INT          NOT NULL AUTO_INCREMENT,
    producer_name VARCHAR(255) NOT NULL UNIQUE,
    PRIMARY KEY (producer_id)
);

CREATE TABLE genre
(
    genre_id   INT          NOT NULL AUTO_INCREMENT,
    genre_name VARCHAR(255) NOT NULL UNIQUE,
    PRIMARY KEY (genre_id)
);

CREATE TABLE series
(
    series_id          INT          NOT NULL AUTO_INCREMENT,
    series_name        VARCHAR(255) NOT NULL,
    series_description VARCHAR(255),
    series_genre_id    INT,
    PRIMARY KEY (series_id),
    FOREIGN KEY (series_genre_id) REFERENCES genre (genre_id)
);

CREATE TABLE series_producer
(
    series_producer_id  INT NOT NULL AUTO_INCREMENT,
    series_producer_sid INT,
    series_producer_pid INT,
    PRIMARY KEY (series_producer_id),
    FOREIGN KEY (series_producer_sid) REFERENCES series (series_id),
    FOREIGN KEY (series_producer_pid) REFERENCES producer (producer_id)
);

CREATE TABLE season
(
    season_id          INT          NOT NULL AUTO_INCREMENT,
    season_name        VARCHAR(255) NOT NULL,
    season_description VARCHAR(255),
    season_series_id   INT,
    PRIMARY KEY (season_id),
    FOREIGN KEY (season_series_id) REFERENCES series (series_id)
);

CREATE TABLE episode
(
    episode_id          INT          NOT NULL AUTO_INCREMENT,
    episode_name        VARCHAR(255) NOT NULL,
    episode_description VARCHAR(255),
    episode_season_id   INT,
    PRIMARY KEY (episode_id),
    FOREIGN KEY (episode_season_id) REFERENCES season (season_id)
);

USE tv_series;

INSERT INTO producer(producer_name)
VALUES ('Marta Kauffman'),
       ('David Crane'),
       ('Carter Bays '),
       ('Joseph Incaprera');

INSERT INTO genre(genre_name)
VALUES ('Comedy'),
       ('Drama'),
       ('Romantic'),
       ('Documentary'),
       ('Horror'),
       ('Crime'),
       ('Reality TV'),
       ('Game Show');

INSERT INTO series(series_name, series_description, series_genre_id)
VALUES ('Friends',
        'Follow the lives of six reckless adults living in Manhattan, as they indulge in adventures which make their lives both troublesome and happening.',
        1),
       ('How i Met Your Mother',
        'The series follows the adventures of Ted Mosby (played by Josh Radnor) and his love life as a single man.', 1),
       ('13 Reasons Why', 'Newcomer Katherine Langford plays the role of Hannah, a young woman who takes her own life.',
        2),
       ('Dream On',
        'Dream On is an American situation comedy about the family life, romantic life, and career of Martin Tupper, a divorced New York City book editor played by Brian Benben.',
        1);

INSERT INTO series_producer(series_producer_sid, series_producer_pid)
VALUES (1, 1),
       (1, 2),
       (2, 3),
       (4, 1);

INSERT INTO season(season_name, season_description, season_series_id)
VALUES ('Friends - Season 1',
        'The first season introduces the six main characters who live in New York City: Rachel Green, a waitress; professional chef Monica Geller.',
        1),
       ('Friends - Season 2',
        'The second season of Friends, an American sitcom created by David Crane and Marta Kauffman, premiered on NBC on September 21, 1995.',
        1),
       ('HIMYM - Season 1',
        'he series begins in September 2005 with Ted as a single, 27-year-old architect living with his two best friends from his college years: Marshall Eriksen, a law student, and Lily Aldrin, a kindergarten teacher and an aspiring artist.',
        2),
       ('13 Reasons Why- Season 1',
        'Newcomer Katherine Langford plays the role of Hannah, a young woman who takes her own life. Two weeks after her tragic death, a classmate named Clay finds a mysterious box on his porch.',
        3);


INSERT INTO episode(episode_name, episode_description, episode_season_id)
VALUES ('The one with the Birth',
        'When Carol gives birth, Ross and Susan almost miss the event when Phoebe accidentally locks them in a cupboard together to put a stop to their constant bickering.',
        1),
       ('The one with All the poker',
        'When the girls lose money to the guys in a poker match, they seek out Monicas Aunt Iris, a famous card player, for lessons in poker, and demand a rematch.',
        1),
       ('The one with the Bullies',
        'Monica is broke and decides to gamble on the stock market, and Chandler and Ross run into a couple of bullies in Central Park.',
        2),
       ('Return of the Shirt',
        'Teds continuing search for The One leads him to look into his past to rekindle old flames.', 3);

