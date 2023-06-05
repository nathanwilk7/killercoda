# Going to create entities

```
sqlite3
```{{exec}}

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
```{{exec}}

### Single line code blocks can be copied by default
`copy me`

### It can also be disabled
`copying disabled`{{}}

### Execute a command per click
`ls -lh`{{exec}}

### Send Ctrl+c before execute
Run a blocking command:
`sleep 1d`{{exec}}

End it and run another:
`whoami`{{exec interrupt}}

### Copy multiline code block
```
uname -r
pwd
```{{copy}}

### Execute multiline code block

```
uname -r
pwd
```{{exec}}


### Execute multiline code block with Ctrl+c
Run a blocking command:
`sleep 1d`{{exec}}

End it and run others:
```
uname -r
whoami
```{{exec interrupt}}
