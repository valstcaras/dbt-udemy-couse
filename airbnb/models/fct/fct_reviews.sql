{{config(
    materialized='incremental',
    on_schema_change='fail'
)}}
with src_reviews as (
    select * from {{ ref('src_reviews') }}
)

select 
{{ dbt_utils.generate_surrogate_key(['review_id', 'review_date', 'reviewer_name', 'review_text']) }} as unique_review_id,
*
from src_reviews
where review_id is not null
{% if is_incremental() %}
    and review_date > (select max(review_date) from {{ this }})
{% endif %}