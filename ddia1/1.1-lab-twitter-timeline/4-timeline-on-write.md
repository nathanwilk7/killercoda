# Option 2: Timeline on Write

We’re going to try a different way to implement timelines. In this method, we’ll keep a timeline for each user and every time a tweet is posted, then we’ll append that tweet to all the the timelines of all the followers of the user who posted the tweet.

First, let’s create a timelines table.

Side note, we’re going to do something a little weird here, which is to use a JSON array in SQLite for each user’s timeline. This probably isn’t the best way to do this, but I think it will be sufficient for this demonstration. Also, I’m using username instead of user ID here because it simplifies the queries below.

```
create table timelines (
  username text unique references users(username), 
  timeline_json text
);
```

Let’s insert the tweets from our tweets table into this timelines table to show how it works. Note that the code below is pretty hacky and you’d probably do something better than this in real life. We’re essentially using the timelines table as a key value store where the key is the user ID and the value is a JSON array of the user’s timeline.

Create an empty array for each user's id:

```
insert into timelines 
select username, json_array() from users;
```{{exec}}

Now each user has an empty JSON array for their timeline:

```
select * from timelines;
```{{exec}}

Alice is the only user who has followed anyone at this point, so let's insert the tweets from her followees into alice's timeline. Note that the order matters here since we're appending to an array:

```
update timelines set timeline_json = json_insert(
  timeline_json,
  '$[#]', 
  json_object(
    'tweet_id', tweets.id, 
    'poster_id', tweets.poster_id, 
    'content', tweets.content, 
    'post_time', tweets.post_time
  )
)
from (
  select tweets.*, users.username poster_username from tweets 
  join users on users.id = tweets.poster_id 
  where content = 'bob first tweet'
) tweets
where username = 'alice';

update timelines set timeline_json = json_insert(
  timeline_json, 
  '$[#]', 
  json_object(
    'tweet_id', tweets.id, 
    'poster_id', tweets.poster_id, 
    'content', tweets.content, 
    'post_time', tweets.post_time
  )
)
from (
  select tweets.*, users.username poster_username from tweets 
  join users on users.id = tweets.poster_id 
  where content = 'charlie first tweet'
) tweets
where username = 'alice';

update timelines set timeline_json = json_insert(
  timeline_json, 
  '$[#]', 
  json_object(
    'tweet_id', tweets.id, 
    'poster_id', tweets.poster_id, 
    'content', tweets.content, 
    'post_time', tweets.post_time
  )
)
from (
  select tweets.*, users.username poster_username from tweets 
  join users on users.id = tweets.poster_id 
  where content = 'bob second tweet'
) tweets
where username = 'alice';
```{{exec}}

Now if we look at the timelines, we'll see that alice's is populated with the expected tweets:

```
select * from timelines;
```{{exec}}

Now we can load up Alice’s timeline using the timelines table like this:

```
select timeline_json from timelines
where username = 'alice';
```

Or
```
select je.value 
from timelines, json_each(timelines.timeline_json) je
where username = 'alice';
```{{exec}}

Note that in the example I’m assuming `json_each` returns the rows in order, I’m just doing this to make it simpler but in real life you’d want to ensure ordering.