# Benchmarking

We’re going to insert a bunch of dummy data and see if we can get enough data loaded to see a measurable difference between how long reads and writes take.

First, exit your current sqlite shell (note you'll lose your previous work, but we're going to recreate things below):

```
.exit
```{{exec}}

Then, start up a new sqlite instance which is hooked up to some pre-generated benchmark data with:

```
sqlite3 benchmark.sqlite
```{{exec}}

The table schemas are the same as before but they've been populated with some mock data (note that the mock data is from the BigQuery hackernews public dataset, so it's not actually tweets and each comment has been truncated to 100 chars). Let's see how much data is in there:

TODO make this an exercise?

```
select count(*) from users;
```{{exec}}

```
select count(*) c from follows
group by followee_id
limit 3;
```{{exec}}

```
select count(*) from tweets;
```{{exec}}

```
select count(*) from tweets
group by poster_id
limit 3;
```{{exec}}

I didn't populate the timelines table to keep the data size smaller, so let's populate it now (this usually takes about 45 seconds to run). Note that we're only keeping track of 10 tweets per user in the timelines table here (IRL this would be the N latest tweets):

```
insert into timelines
with timeline_subquery as (
  select
  users.username,
  json_object(
    'tweet_id', tweets.id, 
    'poster_id', tweets.poster_id, 
    'content', tweets.content, 
    'post_time', tweets.post_time) timeline_json,
  row_number() over(partition by users.username order by tweets.post_time desc) AS rn
  from tweets
  join follows on follows.followee_id = tweets.poster_id
  join users on users.id = follows.follower_id
)
select username, json_group_array(timeline_json)
from timeline_subquery
where rn <= 10
group by username;

select 'done';
```{{exec}}

```
insert into timelines
select
 users.username,
 json_group_array(json_object(
  'tweet_id', tweets.id, 
  'poster_id', tweets.poster_id, 
  'content', tweets.content, 
  'post_time', tweets.post_time))
from tweets
join follows on follows.followee_id = tweets.poster_id
join users on users.id = follows.follower_id
where post_time < 100000000
group by users.username;
```

Let’s turn on the query timer which will tell us how long each query takes. We’ll use the timer for the first two queries and will hack our own “transaction timer” for the last two queries.

```
.timer on
```{{exec}}

**Stop** and **think hard** (maybe even do some reading about SQLite TODO links) about these benchmarking questions before you look at the solutions!

Let's look at the queries in `load_timeline_on_read.sql`  and `load_timeline_on_write.sql`.

Here is the load timeline on read query:

```
select t.*
from users
join follows f on f.follower_id = users.id
join tweets t on t.poster_id = f.followee_id
where users.id in (select id from users limit 1)
order by t.post_time
limit 10;
```

Here is the load timeline on write query:

```
select
timelines.username,
json_extract(timelines.timeline_json, '$[0]'),
json_extract(timelines.timeline_json, '$[1]'),
json_extract(timelines.timeline_json, '$[2]'),
json_extract(timelines.timeline_json, '$[3]'),
json_extract(timelines.timeline_json, '$[4]'),
json_extract(timelines.timeline_json, '$[5]'),
json_extract(timelines.timeline_json, '$[6]'),
json_extract(timelines.timeline_json, '$[7]'),
json_extract(timelines.timeline_json, '$[8]'),
json_extract(timelines.timeline_json, '$[9]')
from timelines
where timelines.username in (select username from users limit 1);
```

Given the amount of dummy data, how much faster do you think load timeline on write will be compared to load timeline on read? Explain your thought process. Take your time and be as thorough as you can. When you’re ready, open the solution up and run them a couple times to see how long each one takes.

<details><summary>Solutions</summary>
    
```
.read load_timeline_on_read.sql
```{{exec}}

```
.read load_timeline_on_write.sql
```{{exec}}

TODO talk about which is faster/slower and why
TODO investigate sqlite query plan and include details about access, indexes, etc

</details>    

For this last benchmark, we're going to turn off the timer because I've written a custom "timer" into the queries themselves which will print out how long they take.
```
.timer off
```{{exec}}

Now we’re going to compare how long inserts take using the two approaches. Let's look at the insert on read/write queries (I'm only showing the first few lines of the insert on write, but there are actually 200 inserts to simulate a tweet by someone who has 200 followers).

Here is the insert timeline on read query:

```
begin transaction;

drop table if exists start_time;
create temp table start_time as
SELECT CAST((julianday('now') - 2440587.5)*86400000 AS INTEGER) t;

insert into tweets (poster_id, content, post_time)
values (
  1, 
  cast(abs(random()) as text) || ' moar content',
  abs(random() % 1680750000)
);

select
 '*** END TIME',
 round(((julianday('now') - 2440587.5)*86400000.0 - start_time.t)/1000.0, 3)
from start_time;

commit;
```

Here is the insert timeline on write query:

```
begin transaction;

drop table if exists start_time;
create temp table start_time as SELECT CAST((julianday('now') - 2440587.5)*86400000 AS INTEGER) t;

update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) where username in (select username from users order by random() limit 1);
... (199 more times)

select '*** END TIME', round(((julianday('now') - 2440587.5)*86400000.0 - start_time.t) / 1000.0, 3) time_ms from start_time;

commit;
```

Same gig as above but reversed, how much faster do you think `insert_timeline_on_read.sql` will be compared to `insert_timeline_on_write.sql`? Explain your thought process.

<details><summary>Solutions</summary>

```
.read insert_timeline_on_read.sql
```{{exec}}

```
.read insert_timeline_on_write.sql
```{{exec}}

TODO talk about which is faster/slower and why
    
</details>

TODO

So inserting a tweet into 200 timelines is slower than just inserting a single tweet into the tweets table, but it’s still reasonably fast using sqlite. However, think about how slow this could get if a user had millions of followers, which would mean you have to copy that tweet into millions of timelines.

Caveat: I didn’t go into alternative ways to implement this, but instead focused on these 2 options with the hope that they are somewhat representative of common data systems which developers are designing and building but more so to give us a concrete example about which to discuss things like scalability and maintainability. I didn’t explore things like indexing, caching, denormalization, alternative data models, etc. TODO single writer, mem vs disk, etc.

You can now exit the sqlite shell:

```
.exit
```{{exec}}