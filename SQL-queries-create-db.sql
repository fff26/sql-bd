CREATE TABLE Artists (
  artist_id SERIAL PRIMARY KEY,
  artist_name VARCHAR(255) NOT NULL,
  artist_country VARCHAR(255)
);

CREATE TABLE Genres (
  genre_id SERIAL PRIMARY KEY,
  genre_name VARCHAR(255) NOT NULL
);

CREATE TABLE Albums (
  album_id SERIAL PRIMARY KEY,
  album_title VARCHAR(255) UNIQUE NOT NULL,
  album_year NUMERIC(4) NOT NULL,
  album_cover VARCHAR(255)
);

CREATE TABLE Tracks (
  track_id SERIAL PRIMARY KEY,
  track_title VARCHAR(255) NOT NULL,
  track_duration SMALLINT UNSIGNED NOT NULL,
  album_id INTEGER REFERENCES Albums(album_id)
);

CREATE TABLE Collections (
    collection_id SERIAL PRIMARY KEY,
    collection_title VARCHAR(50) NOT NULL,
    collection_year NUMERIC(4) NOT NULL
);

CREATE TABLE Artist_Genres (
  artist_id INTEGER REFERENCES Artists(artist_id),
  genre_id INTEGER REFERENCES Genres(genre_id),
  PRIMARY KEY (artist_id, genre_id)
);

CREATE TABLE Artist_Albums (
  artist_id INTEGER REFERENCES Artists(artist_id),
  album_id INTEGER REFERENCES Albums(album_id),
  PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE Collection_Albums (
    collection_id INTEGER REFERENCES Collections(collection_id),
    album_id INTEGER REFERENCES Albums(album_id),
    PRIMARY KEY (collection_id, album_id)
);