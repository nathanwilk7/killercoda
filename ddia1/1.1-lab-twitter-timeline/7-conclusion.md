# Conclusion

Alright, you made it! Well done. This article is a taste of what to expect in this Designing Data-Intensive Applications supplemental course. Here’s a summary of some main points:

It depends is “always” the right answer when thinking about system design. It depends on the assumptions you make about how the system will be used and the tradeoffs you want.

Wrote some SQL to support a super simplified Twitter in SQLite using either timeline-on-read or timeline-on-write.

When evaluating a system design, some high level ideas to consider are its performance, scalability, reliability, and maintainability. Here we primarily discussed how our timeline implementation affects performance, though we touched a bit on scalability and maintainability as well.

TODO did some benchmarking to prototype timeline-on-read vs timeline-on-write and learning about how SQLite does stuff?

I do want to add that most future labs will go deeper into the technical details (e.g.: topics like replication and more details on data system internals), see this TODO [list of future topics](https://www.notion.so/Designing-Data-Intensive-Applications-Course-ce023398f3134e20951afab1779bbcef?pvs=21), but this lab was meant to give a general intro to thinking about system design tradeoffs.

Fin. Head back to TODO [Chapter 1](https://www.notion.so/Designing-Data-Intensive-Applications-Course-ce023398f3134e20951afab1779bbcef?pvs=21) to continue the course.
