/*==============================================================
/****************** Spotify Data Analysis *********************/
===============================================================*/


-- Retrieve the names of all tracks that have more than 1 billion streams.
SELECT track
FROM spotify
WHERE stream > 1000000000;


-- List all albums along with their respective artists.
SELECT  DISTINCT album,
		artist
FROM spotify;


-- Get the total number of comments for tracks where licensed = TRUE.
SELECT COUNT(comments) AS no_of_comments
FROM spotify
WHERE licensed = True;



-- Find all tracks that belong to the album type single.
SELECT track
FROM spotify
WHERE album_type = 'single';



-- Count the total number of tracks by each artist.
SELECT 	DISTINCT artist,
		COUNT(*) AS total_tracks
FROM spotify
GROUP BY 1;



-- Calculate the average danceability of tracks in each album.
SELECT 	album,
		ROUND(
			AVG(danceability)::NUMERIC, 2
		)AS avg_danceability
FROM spotify
GROUP BY 1
ORDER BY 2 DESC;



-- Find the top 5 tracks with the highest energy values.
SELECT 	track,
		energy
FROM spotify
ORDER BY 2 DESC
LIMIT 5;


-- List all tracks along with their views and likes where official_video = TRUE.
SELECT 	track,
		SUM(views) AS total_views,
		SUM(likes) AS total_likes
FROM spotify
WHERE official_video = True
GROUP BY 1;



-- For each album, calculate the total views of all associated tracks.
SELECT 	album,
		track,
		SUM(views) AS total_views
FROM spotify
GROUP BY 1, 2
ORDER BY 1;



-- Retrieve the track names that have been streamed on Spotify more than YouTube.
SELECT 	track,
    	SUM(CASE WHEN most_playedon = 'Spotify' THEN stream ELSE 0 END) AS spotify_streams,
    	SUM(CASE WHEN most_playedon = 'Youtube' THEN stream ELSE 0 END) AS youtube_streams
FROM spotify
GROUP BY 1
HAVING SUM(CASE WHEN most_playedon = 'Spotify' THEN stream ELSE 0 END) >
       SUM(CASE WHEN most_playedon = 'Youtube' THEN stream ELSE 0 END);


-- Find the top 3 most-viewed tracks for each artist using window functions.
SELECT 	artist,
		track,
		total_views
FROM(
	SELECT 	DISTINCT artist,
			track,
			SUM(views) AS total_views, 
			DENSE_RANK() OVER(PARTITION BY artist ORDER BY SUM(views) DESC) AS rank_n
	FROM spotify
	GROUP BY 1, 2
	ORDER BY 1, 3 DESC
)
WHERE rank_n < 4;



-- Write a query to find tracks where the liveness score is above the average.
SELECT 	track,
		liveness
FROM spotify
WHERE liveness > (SELECT AVG(liveness) FROM spotify)



-- Use a WITH clause to calculate the difference between the highest and lowest energy values 
-- for tracks in each album.
WITH cte AS
(
	SELECT 	album,
			MAX(energy) as highest_energy,
			MIN(energy) as lowest_energery
	FROM spotify
	GROUP BY 1
)
SELECT 	album,
		highest_energy - lowest_energery as energy_diff
FROM cte
ORDER BY 2 DESC



-- Find tracks where the energy-to-liveness ratio is greater than 1.2.
SELECT *
FROM spotify
WHERE energyliveness > 1.2;



-- Calculate the cumulative sum of likes for tracks ordered by the number of views, using window functions.
SELECT 	track,
    	total_views,
    	total_likes,
    	SUM(total_likes) OVER (ORDER BY total_views DESC) AS cumulative_likes
FROM (
    SELECT	track,
        	SUM(views) AS total_views,
        	SUM(likes) AS total_likes
    FROM spotify
    GROUP BY track
) AS aggregated;


-- Danceable songs with high energy tend to attract more likes and views
SELECT 	track,
    	artist,
    	danceability,
    	energy,
    	likes,
    	views
FROM spotify
WHERE danceability > 0.7 AND energy > 0.7
ORDER BY 5 DESC, 6 DESC
LIMIT 20;

-- Tracks with lower speechiness often score higher in valence
SELECT 	track,
    	artist,
    	album,
    	speechiness,
    	valence
FROM spotify
WHERE speechiness < 0.3
ORDER BY 5 DESC
LIMIT 20;