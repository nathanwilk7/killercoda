# Option 1: Timeline on Read

One way you could implement timelines is by writing a query which requests all the tweets from the users a given user follows sorted by time. We’re going to write that query. First, let’s add some simple dummy data for users and follows.

```
insert into users (username)
values ('alice'), ('bob'), ('charlie'), ('david');

insert into follows
select alice.id, bob.id
from users alice, users bob 
where alice.username = 'alice' and bob.username = 'bob';

insert into follows 
select alice.id, charlie.id 
from users alice, users charlie 
where alice.username = 'alice' and charlie.username = 'charlie';
```{{exec}}

What we’re done here is create 4 users with the usernames `alice`, `bob`, `charlie`, and `david` and then `alice` has started following `bob` and `charlie` (but not `david`).

Let’s verify that our users and follows were inserted correctly (it’s ok if the id’s chosen by SQLite differ or the order of rows returned differs):

```
select * from users;
```{{exec}}

```
select * from follows;
```{{exec}}

Now we’re going to create some tweets.

```
insert into tweets (poster_id, content, post_time) 
select alice.id, 'alice first tweet', 0 
from users alice 
where alice.username = 'alice';

insert into tweets (poster_id, content, post_time) 
select bob.id, 'bob first tweet', 1 
from users bob 
where bob.username = 'bob';

insert into tweets (poster_id, content, post_time) 
select charlie.id, 'charlie first tweet', 2 
from users charlie 
where charlie.username = 'charlie';

insert into tweets (poster_id, content, post_time) 
select bob.id, 'bob second tweet', 3 
from users bob 
where bob.username = 'bob';

insert into tweets (poster_id, content, post_time) 
select david.id, 'david first tweet', 4 
from users david 
where david.username = 'david';
```{{exec}}

Note that we hardcoded the `post_time` for these tweets to be between 0 and 4.

Let’s verify the tweets we inserted (we’re going to order the results by `post_time`):

```
select * from tweets order by post_time;
```{{exec}}

We can see there are 5 tweets, 1 from `alice`, 2 from `bob`, 1 from `charlie`, and 1 from `david`. The order of tweets by `post_time` is:

`alice`'s first tweet.

`bob`'s first tweet.

`charlie`'s first tweet.

`bob`'s second tweet.

`david`'s first tweet.

Now it’s your turn to try to figure out how to write a query which does the following: Given a user ID, load all the tweets (id, poster_id, content, and post_time) for that users timeline sorted by the `post_time`. Remember that a user’s timeline should have all the tweets from that user’s “followees”.


TODO fix formatting

<details><summary>Hint: Here’s an example query which shows how to get the user IDs for a users’s “followees”</summary>
    
```
select f.followee_id 
from users given_user 
join follows f on f.follower_id = given_user.id 
where given_user.username = 'alice';
```{{exec}}

```
# or if you prefer to use id instead of username
select f.followee_id 
from follows f 
where f.follower_id = 1;
```{{exec}}
</details>

<details><summary>Solution</summary>
    
```
select t.* from users given_user 
join follows f on f.follower_id = given_user.id 
join tweets t on t.poster_id = f.followee_id 
where given_user.username = 'alice'
order by t.post_time;
```{{exec}}

```
# or if your prefer to use id instead of username
select t.* from follows f 
join tweets t on t.poster_id = f.followee_id 
where f.follower_id = 1 
order by t.post_time;
```{{exec}}
    

Do you think this design for implementing timelines is a good solution? Is it performant? Is it scalable? Is it reliable?


<details><summary>Solution</summary>
    
Alright, I know this is cheesy but this is a bit of a trick question. The “correct” answer to this question is, “it depends.” It turns out that “it depends” is almost always the correct answer when starting to evaluate any design. In other words, asking if a system design is “good” without more details is not a reasonable question to ask given the information you have so far. We’ll talk more about this later and throughout this course, but it’s crucial to remember that every design makes tradeoffs and those tradeoffs are based on assumptions about how the system will be used. Is it write-heavy or read-heavy? How much downtime is acceptable? Who are the users and administrators? What types of reads and writes should be supported? How long of response time is acceptable? etc, etc, etc. I’ll have some examples of more well founded questions later, but I want to point out that it’s not useful to design a system in a vacuum, you should design based on the tradeoffs and assumptions you want built into the system.

If you’re like me, when you first thought about this question, you thought some things like, “well it’s using SQLite so that means it will only run on a single instance, so it can be scaled vertically but not horizontally and SQLite only supports a single writer at a time” and “the query as written will be slow as the number of tweets and follows grows because it has to look up all the necessary tweets and sort them each time you run it”. These are (I think), reasonable things to think, but I’m trying to make the point that all designs must be built around the problem they’re trying to solve and there is no one size fits all magic solution which is always the right call. For example, if you’re writing an embedded system which needs to store relational data locally, then SQLite may be a good choice. However, if you need highly scalable relational data storage with high writes per second for a worldwide internet-based system, then SQLite may not the right choice of database.

</details> 

To get a better handle on these kinds of questions, we’re going to discuss another approach to how you could handle timelines and then follow up by comparing and contrasting their reliability, scalability, and maintainability in a more concrete way.