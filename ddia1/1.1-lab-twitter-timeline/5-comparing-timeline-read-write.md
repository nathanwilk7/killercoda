# Comparing Timeline on Read vs Timeline on Write

Now we have two options for how to implement timelines, we can either compute them on read using timeline on read (option 1) or we can compute them on write using timeline on write (option 2).

I want to make sure we’re clear on exactly how these two options work, can you describe the process and steps for reading and writing for each option?

<details><summary>Solution</summary>
    
In timeline on read (option 1), whenever a user posts a tweet, that tweet is inserted into the tweets table. Whenever a user loads their timeline, then the query to load the timeline searches over the entire tweets table, finds the tweets of the user’s followees, and sorts them by time. Therefore with this option posting tweets is not very much work for the database, but loading the timeline is lots of work for the database.

In timeline on write (option 2), whenever a user posts a tweet, that tweet is still inserted into the tweets table, but it is also inserted into every followee’s timeline. Then, instead of loading the timeline for a user from the tweets table, it can simply be loaded from the timelines table. Therefore with this option posting tweets can be a lot of work for the database (depending on how many followers a poster has), but loading the timeline is not not much work for the database.
    
</details>

Let’s talk about which option is “better”.

Hopefully you remember our recent discussion about “it depends” and so when I said let’s talk about which one is better, you thought to yourself, “it depends”. But what does it depend on? Let’s examine a few tradeoffs between the two approaches.

Which option do you expect to be faster for reads (e.g.: loading a timeline)? Why?

<details><summary>Solution</summary>

Timeline on write (option 2) should be faster for reads since it “precomputes” the timeline. This means that returning the timeline is essentially just a key-value look up by username, which should be quite fast. In timeline on read (option 1), the database has to compute a join across multiple tables and then order the results by time, which could be slow depending on how much data exists.
    
</details>

Which option do you expect to be faster for writes (e.g.: posting a tweet)? Why?

<details><summary>Solution</summary>

Timeline on read (option 1) should be faster for writes since the only write required is inserting one new row into the tweets table, which should be fast. In timeline on write (option 2), the database still inserts the row into the tweets table but also has to insert into the timeline of every single follower of the user who posted the tweet, which could be slow depending on the number of followers.

</details>

How does the number of followers and followees affect the performance of each option?

<details><summary>Solution</summary>

The more followers and followees a user has, the more “fan-out” occurs (e.g.: timelines require more work for users with more followers). This parameter affects both options. In timeline on read (option 1), more followers means that we’ll have to return more tweets in the timeline (and therefore load more of the tweets table, even if it’s well indexed). In timeline on write (option 2), more followers means that we’ll have to write to more timelines.
    
</details>

Which option uses more storage space? Roughly how much more?

<details><summary>Solution</summary>

Timeline on read (option 1) will use much less storage space than timeline on write (option 2) because option 1 only stores tweets once. In option 2, tweets are copied for every follower when a tweet is posted. If we use option 2, we should make sure we are ok with how much storage space it’s going to use.
    
</details>

Which option is more maintainable (this question is a bit fuzzy and hard to define, but thinking through maintainability is a good exercise and is important)?

<details><summary>Solution</summary>

Which option is more maintainable? There are two aspects of maintainability I want to address here (going to focus primarily on simplicity and evolvability). I think timeline on read (option 1) is simpler than timeline on write (option 2). Option 2 is complex for a few reasons.

Timeline on write (option 2) requires keeping multiple inserts across multiple tables in sync each time a tweet is posted. This means developers have to be careful when making changes to the code which inserts tweets. For example, do you need to transactionally update every single users’ timeline each time you add a tweet? This could be quite slow and slow down other queries on the database. Alternatively, if you do not insert all rows transactionally, then you may need to handle partial failures when a tweet is written only to some subset of the timelines. However, one way that I option 2 is that it gives a simple abstraction for developers reading timelines, they just select the relevant row from the timelines table. This is simpler than the more complex timeline query in option 1, however I think maintaining a single SQL query is much easier than maintaining the more complex logic keeping multiple table in sync.
    
</details>

How does each option handle deletion or editing of tweets?

<details><summary>Solution</summary>

In timeline on read (option 1), if a tweet is deleted or updated then you simply have to delete or update the corresponding tweet row in the tweets table. In timeline on write (option 2), you would need to delete or update the tweet in all the timelines in which it is stored. Given how potentially slow and non-performant this would be, you’d probably need to explore other ways of handling deletion and updating (e.g.: keep a separate cache with the ID’s of deleted or updated tweets and all users loading timeline must filter our deleting tweets or reload edited ones based on the cache).
    
</details>

Which option uses a schemaless (e.g.: schema-on-read) approach? What are the tradeoffs associated with such an approach?

<details><summary>Solution</summary>

Timeline on write (option 2) uses a schema-on-read (schemaless) approach for the timeline. Because tweets are stored simply as JSON, there is no guarantee from the database about what fields exist in the JSON or what types those fields have. This means that whenever the fields on a tweet are updated then the code which reads the JSON timeline cannot generally assume that those fields exist on all tweets, therefore it must parse and verify the schema while reading the JSON. This is opposed to schema-on-write where all fields are guaranteed to exist and have a type (e.g.: a normal SQLite table). Given that we’re also storing tweets as a separate table, I think keeping that separate table and the timelines objects in sync results in more difficult maintenability.
    
</details>

Given this discussion above, I would likely use timeline on read (option 1) if writes outnumber reads or if they occur at roughly the same frequency (or if we care more about write latency than read latency). However, if there are significantly more reads than writes, I would consider using timeline on write (option 2). Let’s try to do some quick benchmarking to see if we can get a more concrete idea of read vs write performance.