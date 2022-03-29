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