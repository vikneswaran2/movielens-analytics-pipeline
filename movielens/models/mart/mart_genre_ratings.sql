{{ config(
    materialized='table',
    schema='movielens_mart'
) }}

SELECT
    genre,
    AVG(r.rating) AS average_rating,
    COUNT(DISTINCT m.movie_id) AS total_movies,
    COUNT(*) AS total_ratings
FROM {{ ref('dim_movies') }} m
JOIN {{ ref('fct_ratings') }} r
ON m.movie_id = r.movie_id
CROSS JOIN UNNEST(m.genre_array) AS genre
GROUP BY genre
ORDER BY average_rating DESC