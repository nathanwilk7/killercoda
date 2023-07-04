begin transaction;

drop table if exists start_time;
create temp table start_time as SELECT CAST((julianday('now') - 2440587.5)*86400000 AS INTEGER) t;

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) from generate_series(1, 1) where username in (select username from users order by random() limit 1);

select '*** END TIME', round(((julianday('now') - 2440587.5)*86400000.0 - start_time.t) / 1000.0, 3) time_ms from start_time;

commit;