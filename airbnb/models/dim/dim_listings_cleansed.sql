{{config(
    materialized='view'
)}}

with scr_listings as (
    select *
    from {{ ref('src_listings') }}
)

select 
       listing_id,
       listing_name,
       room_type,
       CASE WHEN minimum_nights = 0 THEN 1 
       ELSE minimum_nights 
       END as minimum_nights,
       host_id,
       REPLACE(price_str, '$') :: NUMBER(10,2) AS price,
       price_str,
       created_at,
       updated_at
from scr_listings