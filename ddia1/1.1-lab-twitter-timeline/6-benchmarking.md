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

The table schemas are the same as before but they've been populated with some mock data (note that the mock data is from the BigQuery hackernews public dataset, so it's not actually tweets and each comment has been truncated to 100 chars). Let's explore the data a bit. Figure things out like how many users/tweets/etc there are and how many followers users have and whatever else you want to check.

<details><summary>Solution</summary>

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

</details>

Let’s turn on the query timer which will tell us how long each query takes. We’ll use the timer for the first two queries and will hack our own “transaction timer” for the last two queries.

```
.timer on
```{{exec}}

Let's look at the queries in `load_timeline_on_read.sql`  and `load_timeline_on_write.sql`.

Here is the load timeline on read query:

```
select t.*
from users
join follows f on f.follower_id = users.id
join tweets t on t.poster_id = f.followee_id
where users.id = 10
order by t.post_time desc
limit 10;
```

Here is the load timeline on write query:

```
select
timelines.username,
timelines.timeline_json
from timelines
where timelines.username = 'husseinfazal';
```

Given the amount of dummy data, how much faster do you think load timeline on write will be compared to load timeline on read? Explain your thought process. Take your time and be as thorough as you can. When you’re ready, open the solution up and run them a couple times to see how long each one takes.

**Stop** and **think hard** about these benchmarking questions before you look at the solutions!

<details><summary>Solutions</summary>
    
```
.read load_timeline_on_read.sql
```{{exec}}

```
.read load_timeline_on_write.sql
```{{exec}}

TODO talk about which is faster/slower and why

</details>

For this last benchmark, we're going to turn off the timer because I've written a custom "timer" into the queries themselves which will print out how long they take.
```
.timer off
```{{exec}}

Now we’re going to compare how long inserts take using the two approaches. Let's look at the insert on read/write queries (I'm only showing the first few lines of the insert on write, but there are actually 200 inserts to simulate a tweet by someone who has 200 followers).

Here is the insert timeline on read query:

```
insert into tweets (poster_id, content, post_time)
values (
  10, 
  cast(abs(random()) as text) || ' moar content',
  abs(random() % 1680750000)
);
```

Here is the insert timeline on write query:

```
update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) where username = 'bewaretheirs';
update timelines set timeline_json = json_insert(timeline_json, '$[#]', json_object('tweet_id', abs(random() % 2000000), 'poster_id', abs(random() % 2000), 'content', cast(abs(random()) as text) || 'more content', 'post_time', abs(random() % 1680750000))) where username = 'BlueScreenDeath';
... (1000 update statements to simulate a post by someone with 1000 followers)
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
    
So inserting a tweet into 200 timelines is slower than just inserting a single tweet into the tweets table, but it’s still reasonably fast using sqlite. However, think about how slow this could get if a user had millions of followers, which would mean you have to copy that tweet into millions of timelines.

</details>

Caveat: I didn’t go into alternative ways to implement this, but instead focused on these 2 options with the hope that they are somewhat representative of common data systems which developers are designing and building but more so to give us a concrete example about which to discuss things like scalability and maintainability. I didn’t explore things like indexing, caching, denormalization, alternative data models, etc (e.g.: I'm not saying this is actually a good implementation of twitter timelines on SQLite, just using the example to illustrate some of the principles in design tradeoffs).

You can now exit the sqlite shell:

```
.exit
```{{exec}}

This benchmarking example was meant to show how different designs for reading/writing affect performance.