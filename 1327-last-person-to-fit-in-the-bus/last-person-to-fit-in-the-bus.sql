# Write your MySQL query statement below
with cte1 as (
    select *, sum(weight) over (order by turn) as weights
    from queue
)
select person_name from cte1
where weights <= 1000 order by turn desc limit 1;