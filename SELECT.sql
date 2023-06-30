-- запрос количества исполнителей в каждом жанре
SELECT ag.genre_id, g.genre_name, COUNT(*) AS artist_count
FROM artist_genres ag
JOIN genres g ON ag.genre_id = g.genre_id
GROUP BY ag.genre_id, g.genre_name;

-- запрос кол-ва треков альбмов определённых годов
SELECT COUNT(*) AS track_count
FROM albums a
JOIN tracks t ON a.album_id = t.album_id
WHERE a.album_year BETWEEN 2019 AND 2020;

-- запрос средней продолжительности трека (в сек.) по каждому альбому
SELECT album_id, AVG(track_duration) AS avg_duration
FROM tracks
GROUP BY album_id;

-- запрос исполнителей не выпускавших альбомы в 2020 году
SELECT *
FROM artists a
WHERE NOT EXISTS (
  SELECT *
  FROM albums al
  WHERE a.artist_id = a.artist_id AND al.album_year = 2020
);

-- запрос сборников имеющих конкретного исполнителя в составе
SELECT distinct c.collection_title
FROM collections c
JOIN collection_albums ca ON c.collection_id = ca.collection_id
JOIN artist_albums aa ON ca.album_id = aa.album_id
WHERE aa.artist_id = (SELECT artist_id FROM artists WHERE artist_name = 'Егор Летов');
