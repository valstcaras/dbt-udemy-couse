{{config(
    materialized='table'
)}}
with src_hosts as (
    select *
    from {{ ref('src_hosts') }}
)

select host_id,
       is_superhost,
       NVL(host_name, 'Anonymous') as host_name,
       created_at,
       updated_at
from src_hosts