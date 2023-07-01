# Context/Gameplan

We’re going to implement a simplified version of the twitter timeline using SQLite. We’re going to try out two different ways of implementing the timeline and evaluate their tradeoffs.

Roughly, a Twitter timeline works like this:

1. A user U1 posts a tweet (a tweet for our purposes is just a string).
2. A user U2 posts a tweet.
3. A different user U3 loads their timeline.

When user U3 loads their timeline, the tweets from all the users U3 follows are displayed sorted by time. If user U3 follows users U1 and U2, then their posted tweets will show up in user U3’s timeline.

Note, in this lab we’re going to have the timeline sorted in time ascending order instead of descending order to keep things simpler, but of course in real life you’d do descending. Also, we’re not going to worry about keeping track of which tweets a user has already read, we’ll just show all the tweets in the timeline every time we load it.