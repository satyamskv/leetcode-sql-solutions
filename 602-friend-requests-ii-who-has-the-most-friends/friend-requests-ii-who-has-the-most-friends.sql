# Write your MySQL query statement below
with cte1 as (
    select requester_id as total_friends from RequestAccepted 
    union all
    select accepter_id  as total_friends from RequestAccepted 
)
select distinct total_friends  as id, count(*) as num
from cte1 group by total_friends order by count(*) desc limit 1;