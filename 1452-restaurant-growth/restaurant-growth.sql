# Write your MySQL query statement below
with cte1 as (
    select visited_on, sum(amount) as total_amount
    from customer group by visited_on
), cte2 as (
    select visited_on, sum(total_amount) over (order by visited_on rows between 6 preceding and current row) as amount, 
    round(avg(total_amount) over (order by visited_on rows between 6 preceding and current row) , 2) as average_amount
    from cte1
    group by visited_on
)
select visited_on, amount, average_amount
from cte2 
where visited_on >= (select date_add(min(visited_on), interval 6 day) from customer) 
order by visited_on asc;