select t.*
from users
join follows f on f.follower_id = users.id
join tweets t on t.poster_id = f.followee_id
where users.id in (select id from users limit 1)
order by t.post_time
limit 10;
