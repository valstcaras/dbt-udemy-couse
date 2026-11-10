select * 
from {{ref('fct_reviews') }}  as r
left join {{ref('dim_listings_cleansed') }} as d
on r.review_id = d.listing_id
where r.review_date < d.created_at