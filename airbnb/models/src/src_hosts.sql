with raw_hosts as (
    select * from {{source('airbnb', 'hosts')}}
)

select id as host_id,
       is_superhost,
       name as host_name,
       created_at,
       updated_at
from raw_hosts