{{ config(
    materialized='table',
    schema='movielens_mart'
) }}

SELECT
    user_id,
    COUNT(*) AS number_of_ratings,
    AVG(rating) AS average_rating_given,
    MIN(rating_timestamp) AS first_rating_date,
    MAX(rating_timestamp) AS last_rating_date
FROM {{ ref('fct_ratings') }}
GROUP BY user_id
ORDER BY number_of_ratings DESC