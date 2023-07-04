# Benchmarking

We’re going to insert a bunch of dummy data and see if we can get enough data loaded to see a measurable difference between how long reads and writes take.

First, exit your current sqlite shell (note you'll lose your previous work, but we're going to recreate things below):

```
.exit
```{{exec}}

Then, start up a new sqlite instance with:

```
sqlite3
```{{exec}}

Let’s create the tables we’ll need (same as before):

```
create table users (
  id integer primary key,
  username text unique
);

create table tweets (
  id integer primary key,
  poster_id integer references users(id),
  content text,
  post_time integer
);

create table follows (
  follower_id integer references users(id),
  followee_id integer references users(id)
);

create table timelines (
  username text unique references users(username), 
  timeline_json text
);
```{{exec}}

We’re going to insert some dummy data, TODO n users, follows, tweets, timeline, etc TODO this should only take a second or two to complete.

```
insert into users (username)
select abs(random()) || 'user' from generate_series(1, 1000);

insert into follows
select abs(random() % 1000), abs(random() % 1000) 
from generate_series(1, 100), users;

insert into tweets (poster_id, content, post_time) 
select
  abs(random() % 1000), 
  cast(abs(random()) as text) || ' some content',
  abs(random() % 1680750000)
from generate_series(1, 500), users;
```{{exec}}

Note, this will take some time (about TODO seconds in my testing). If the process dies due to memory or whatever, try rerunning the benchmarking section with smaller numbers of users, follows, and tweets.

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
group by users.username;
```{{exec}}

Let’s turn on the query timer which will tell us how long each query takes. We’ll use the timer for the first two queries and will hack our own “transaction timer” for the last two queries.

```
.timer on
```{{exec}}

**Stop** and **think hard** (maybe even do some reading about SQLite TODO links) about these benchmarking questions before you look at the solutions!

TODO how to see them? Look over the queries in `load_timeline_on_read.sql`  and `load_timeline_on_write.sql`. Given the amount of dummy data, how much faster do you think load timeline on write will be compared to load timeline on read? Explain your thought process. Take your time and be as thorough as you can. When you’re ready, open the solution up and read.

<details><summary>Solutions</summary>
    
    ```
    .read load_timeline_on_read.sql
    ```{{exec}}
    
    ```
    .read load_timeline_on_write.sql
    ```{{exec}}
    
    TODO investigate sqlite query plan and include details about access, indexes, etc

</details>    

Now we’re going to compare how long inserts take using the two approaches. Same gig as above but reversed, how much faster do you think `insert_timeline_on_read.sql` will be compared to `insert_timeline_on_write.sql`? Explain your thought process.

<details><summary>Solutions</summary>
    
    ```sql
    sql
    .read insert_timeline_on_read.sql
    ```
    
    ```sql
    sql
    .read insert_timeline_on_write.sql
    ```
    
    TODO
    
</details>

TODO

So inserting a tweet into 100 timelines is slower than just inserting a single tweet into the tweets table, but it’s still reasonably fast using sqlite. However, think about how slow this could get if a user had millions of followers, which would mean you have to copy that tweet into millions of timelines.

Caveat: I didn’t go into alternative ways to implement this, but instead focused on these 2 options with the hope that they are somewhat representative of common data systems which developers are designing and building but more so to give us a concrete example about which to discuss things like scalability and maintainability. I didn’t explore things like indexing, caching, denormalization, alternative data models, etc. TODO single writer, mem vs disk, etc.

You can now exit the sqlite shell:

```
.exit
```{{exec}}