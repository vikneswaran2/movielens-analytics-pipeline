{{ config(materialized='view') }}

WITH raw_tags AS (

    SELECT *
    FROM {{ source('raw', 'raw_tags') }}

)

SELECT
    userId AS user_id,
    movieId AS movie_id,
    tag,
    TIMESTAMP_SECONDS(timestamp) AS tag_timestamp
FROM raw_tags