FROM keinos/sqlite3

WORKDIR /home/sqlite

COPY lab/load_timeline_on_read.sql load_timeline_on_read.sql
COPY lab/load_timeline_on_write.sql load_timeline_on_write.sql
COPY lab/insert_timeline_on_read.sql insert_timeline_on_read.sql
COPY lab/insert_timeline_on_write.sql insert_timeline_on_write.sql
COPY lab/benchmark.sqlite benchmark.sqlite

ENTRYPOINT [ "sh" ]