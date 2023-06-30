FROM ubuntu

WORKDIR /root

RUN apt update

RUN apt install sqlite3 -y

COPY load_timeline_on_read.sql load_timeline_on_read.sql
COPY load_timeline_on_write.sql load_timeline_on_write.sql
COPY insert_timeline_on_read.sql insert_timeline_on_read.sql
COPY insert_timeline_on_write.sql insert_timeline_on_write.sql

ENTRYPOINT [ "bash" ]