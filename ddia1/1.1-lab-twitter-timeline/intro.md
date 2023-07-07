# Prerequisites

You should read the Preface and Chapter 1 (Reliable, Scalable, and Maintainable Applications) of Designing Data-Intensive Applications before completing this lab. See the [Intro](https://killercoda.com/nathanwilk7/course/ddia1/intro) for where you can purchase a copy.

Note that on the free Killercoda plan, you only get 60 minutes (1 hour) to complete the lab before you'll have to restart. Please consider supporting Killercoda by upgrading to their Plus membership as I couldn't do this without their platform and great work.

If the `docker pull` command running in the terminal fails or gets stuck in a retry loop, then expand the "Docker Fail Workaround" block below and run the code inside.

<details><summary><b>Docker Fail Workaround</b></summary>

If the docker pull succeeds, then don't run this. If it fails or is stuck in a retry loop, then cancel the pull by typing CTRL+C in the terminal and then run the commands below to setup the tutorial without using docker.

```
apt install sqlite3
```{{exec}}

```
wget https://raw.githubusercontent.com/nathanwilk7/killercoda/master/ddia1/1.1-lab-twitter-timeline/lab/load_timeline_on_read.sql
wget https://raw.githubusercontent.com/nathanwilk7/killercoda/master/ddia1/1.1-lab-twitter-timeline/lab/load_timeline_on_write.sql
wget https://raw.githubusercontent.com/nathanwilk7/killercoda/master/ddia1/1.1-lab-twitter-timeline/lab/insert_timeline_on_read.sql
wget https://raw.githubusercontent.com/nathanwilk7/killercoda/master/ddia1/1.1-lab-twitter-timeline/lab/insert_timeline_on_write.sql
wget https://raw.githubusercontent.com/nathanwilk7/killercoda/master/ddia1/1.1-lab-twitter-timeline/lab/benchmark.sqlite
```{{exec}}