CREATE SCHEMA IF NOT EXISTS movie_data;

SET
    search_path TO movie_data;

-- create tables
CREATE TABLE IF NOT EXISTS fact_name_basics (
    name_id text UNIQUE NOT NULL,
    primary_name text,
    birth_year int,
    death_year int,
    primary_profession text,
    known_for_titles text,
    PRIMARY KEY (name_id)
);

CREATE TABLE IF NOT EXISTS fact_title_akas (
    title_id text UNIQUE NOT NULL,
    ordering bigint,
    title text,
    region text,
    language_name text,
    TYPES text,
    attritutes text,
    is_original_title boolean,
    PRIMARY KEY (title_id)
);

CREATE TABLE IF NOT EXISTS fact_title_basics (
    title_id text UNIQUE NOT NULL,
    title_type text,
    primary_title text,
    original_title text,
    is_adult boolean,
    start_year int,
    end_year int,
    runtime_mins int,
    genres text,
    PRIMARY KEY (title_id)
);

CREATE TABLE IF NOT EXISTS fact_title_crew (
    title_id text UNIQUE NOT NULL,
    directors text,
    writers text,
    PRIMARY KEY (title_id)
);

CREATE TABLE IF NOT EXISTS fact_title_episode(
    title_id text UNIQUE NOT NULL,
    parent_title_id text,
    season_number int,
    episode_number int,
    PRIMARY KEY (title_id)
);

CREATE TABLE IF NOT EXISTS fact_title_principals (
    title_id text UNIQUE NOT NULL,
    ordering bigint,
    name_id text,
    category text,
    job text,
    characters text,
    PRIMARY KEY (title_id)
);

CREATE TABLE IF NOT EXISTS fact_title_ratings (
    title_id text UNIQUE NOT NULL,
    average_rating float,
    num_of_votes bigint,
    PRIMARY KEY (title_id)
);

-- import data from csv
COPY fact_name_basics(
    name_id,
    primary_name,
    birth_year,
    death_year,
    primary_profession,
    known_for_titles
)
FROM
    'C:\Users\Dante\Desktop\Projects\movie-sentiment-analysis\data\name.basics.csv' DELIMITER ',
' CSV HEADER;

COPY fact_title_akas(
    title_id,
    ordering,
    title,
    region,
    language_name,
    TYPES,
    attritutes,
    is_original_title
)
FROM
    'C:\Users\Dante\Desktop\Projects\movie-sentiment-analysis\data\title.akas.csv' DELIMITER ',
' CSV HEADER;

COPY fact_title_basics(
    title_id,
    title_type,
    primary_title,
    original_title,
    is_adult,
    start_year,
    end_year,
    runtime_mins,
    genres
)
FROM
    'C:\Users\Dante\Desktop\Projects\movie-sentiment-analysis\data\title.basics.csv' DELIMITER ',
' CSV HEADER;

COPY fact_title_crew(title_id, directors, writers)
FROM
    'C:\Users\Dante\Desktop\Projects\movie-sentiment-analysis\data\title.crew.csv' DELIMITER ',
' CSV HEADER;

COPY fact_title_episode(
    title_id,
    parent_title_id,
    season_number,
    episode_number
)
FROM
    'C:\Users\Dante\Desktop\Projects\movie-sentiment-analysis\data\title.episode.csv' DELIMITER ',
' CSV HEADER;

COPY fact_title_principals(
    title_id,
    ordering,
    name_id,
    category,
    job,
    characters
)
FROM
    'C:\Users\Dante\Desktop\Projects\movie-sentiment-analysis\data\title.principals.csv' DELIMITER ',
' CSV HEADER;

COPY fact_title_ratings(
    title_id,
    average_rating,
    num_of_votes
)
FROM
    'C:\Users\Dante\Desktop\Projects\movie-sentiment-analysis\data\title.ratings.csv' DELIMITER ',
' CSV HEADER;